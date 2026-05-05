export ZSH="$HOME/.oh-my-zsh"
DISABLE_LS_COLORS="true"

plugins=(
  git
  kubectl
)

export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_HOME="$HOME/.config"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="$HOME/Library/Python/3.13/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.lmstudio/bin:$PATH"
export PATH="$HOME/projects/nic-agent/zig-out/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openblas/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="/opt/homebrew/opt/openblas/lib"
export CFLAGS="/opt/homebrew/opt/openblas/include"
export GOOGLE_CLOUD_PROJECT=akenza-dev
export VERTEX_LOCATION=global
export CARAPACE_BRIDGES="zsh,fish,bash,inshellisense"
export NVM_DIR="$HOME/.nvm"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias g="git"
alias python="python3"
alias cd="z"
alias ls="eza -l --header --icons"
alias k="kubectl"
alias get_idf=". $HOME/esp/esp-idf/export.sh"
alias v="nvim"
alias awsprofile='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'
alias awssso='echo Logging into ${AWS_PROFILE} && aws sso login'

source "$ZSH/oh-my-zsh.sh"

if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

source <(ng completion script)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(kubectl completion zsh)"
eval "$(gh enhance completion zsh)"
eval "$(atuin init zsh)"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
carapace source kubectl

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
