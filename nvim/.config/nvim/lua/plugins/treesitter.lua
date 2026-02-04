return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  -- branch = 'main',          -- optional: forces main (but it's already default in 2026)
  config = function()
    require('nvim-treesitter').setup {
      auto_install = true,
      highlight    = { enable = true },
      indent       = { enable = true },

      -- Add more options if you want/need them, examples:
      -- ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "python", "c", "rust" },
      -- incremental_selection = { enable = true },
      -- textobjects = { ... },
    }
  end,
}
