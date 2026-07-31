#!/bin/bash

# Herdr workspace initializer.
# Adapted from tmux-init.sh to use the Herdr terminal workspace manager.
# See: https://herdr.dev

set -euo pipefail

HERDR_SESSIONS_DIR="$HOME/.config/herdr/sessions"

# Run a herdr command inside the context of a named persistent session.
herdr_in_session() {
    local session=$1
    shift
    herdr --session "$session" "$@"
}

# Ensure the herdr server for a named session is running.
ensure_session() {
    local session=$1
    mkdir -p "$HERDR_SESSIONS_DIR/$session"

    if ! herdr_in_session "$session" status server 2>/dev/null | grep -q "status: running"; then
        echo "Starting herdr session: $session"
        herdr server --session "$session" >/dev/null 2>&1 &
        # Wait for the session server to accept connections.
        for _ in {1..30}; do
            if herdr_in_session "$session" status server 2>/dev/null | grep -q "status: running"; then
                break
            fi
            sleep 0.5
        done
    fi
}

# Return the workspace ID for a given label in a session, or empty string.
get_workspace_id() {
    local session=$1
    local label=$2
    herdr_in_session "$session" workspace list \
        | jq -r --arg label "$label" '.result.workspaces[] | select(.label == $label) | .workspace_id' \
        | head -n1
}

# Create a workspace in a session if it does not already exist.
# Prints the workspace ID.
create_workspace() {
    local session=$1
    local label=$2
    local cwd=${3:-.}
    local ws_id

    ws_id=$(get_workspace_id "$session" "$label")
    if [ -z "$ws_id" ]; then
        ws_id=$(herdr_in_session "$session" workspace create --label "$label" --cwd "$cwd" --no-focus \
            | jq -r '.result.workspace.workspace_id')
    fi

    echo "$ws_id"
}

# Create a named tab in a session/workspace and run a command in its pane.
# Usage: create_tab <session> <workspace_id> <tab-label> <working-dir> <command...>
create_tab() {
    local session=$1
    local ws_id=$2
    local tab_label=$3
    local cwd=$4
    shift 4
    local command="$*"
    local pane_id

    # Reuse the single default tab created with the workspace for the first
    # tab (it has label "1"); create additional tabs as needed.
    local first_tab
    first_tab=$(herdr_in_session "$session" tab list --workspace "$ws_id" | jq -r '.result.tabs[0]')

    if [ "$(echo "$first_tab" | jq -r '.label')" = "1" ]; then
        local first_tab_id
        first_tab_id=$(echo "$first_tab" | jq -r '.tab_id')
        herdr_in_session "$session" tab rename "$first_tab_id" "$tab_label" >/dev/null 2>&1 || true
        pane_id=$(herdr_in_session "$session" pane list --workspace "$ws_id" | jq -r '.result.panes[0].pane_id')
    else
        pane_id=$(herdr_in_session "$session" tab create --workspace "$ws_id" --label "$tab_label" --cwd "$cwd" --no-focus \
            | jq -r '.result.root_pane.pane_id')
    fi

    herdr_in_session "$session" pane run "$pane_id" bash -c "cd $cwd && $command"
}

# ---------------------------------------------------------------------------
# Bootstrap
# ---------------------------------------------------------------------------

# Create the akenza-ui session
ensure_session "akenza-ui"
akenza_ui_ws=$(create_workspace "akenza-ui" "akenza-ui" "./projects/akenza-ui")
create_tab "akenza-ui" "$akenza_ui_ws" "editor" "./projects/akenza-ui" "nvim"
create_tab "akenza-ui" "$akenza_ui_ws" "serve" "./projects/akenza-ui" "nx serve"
create_tab "akenza-ui" "$akenza_ui_ws" "lazygit" "./projects/akenza-ui" "lazygit"

# Create the login session
ensure_session "login"
login_ws=$(create_workspace "login" "login" "./projects/helm-keycloak")
create_tab "login" "$login_ws" "editor" "./projects/helm-keycloak" "nvim"
create_tab "login" "$login_ws" "lazygit" "./projects/helm-keycloak" "lazygit"

# Create the config session
ensure_session "config"
config_ws=$(create_workspace "config" "config" ".")
create_tab "config" "$config_ws" "sketchybar" "." "sketchybar"

# Create the notes session
ensure_session "notes"
notes_ws=$(create_workspace "notes" "notes" "notes")
create_tab "notes" "$notes_ws" "editor" "notes" "nvim"

echo "Herdr sessions and tabs initialized."
echo "Use 'herdr --session akenza-ui' or 'herdr --session notes' to attach."
