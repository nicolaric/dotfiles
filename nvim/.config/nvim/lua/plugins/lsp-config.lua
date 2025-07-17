return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    -- {
    --   "williamboman/mason-lspconfig.nvim",
    --   lazy = false,
    --   opts = {
    --     auto_install = true,
    --   },
    -- },
    { "tjdevries/vlog.nvim" },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local function ts_lsp_command(command)
                local params = {
                    command = command,
                    arguments = { vim.api.nvim_buf_get_name(0) },
                    title = "",
                }
                vim.lsp.buf.execute_command(params)
            end

            lspconfig.solargraph.setup({
                capabilities = capabilities,
            })
            -- lspconfig.html.setup({
            --		capabilities = capabilities,
            -- })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.nxls.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                commands = {
                    TSOrganizeImports = {
                        function()
                            return ts_lsp_command("_typescript.organizeImports")
                        end,
                        description = "Organize Imports",
                    },
                    TSAddMissingImports = {
                        function()
                            return ts_lsp_command("_typescript.addMissingImports")
                        end,
                        description = "Add Missing Imports",
                    },
                },
            })
            lspconfig.angularls.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("angular.json", "nx.json"),
            })
            lspconfig.zls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>cto", ":TSOrganizeImports<CR>", {})
            vim.keymap.set("n", "<leader>cta", ":TSAddMissingImports<CR>", {})
        end,
    },
}
