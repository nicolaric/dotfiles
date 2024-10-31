return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/neotest-jest", "nvim-neotest/nvim-nio" },
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>tw",
      "<cmd>lua require('neotest').run.run({ jestCommand = 'node_modules/.bin/jest --watch ' })<cr>",
      {}
    )
    vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", {})

    local neotest = require("neotest")
    neotest.setup({
      discovery = {
        enabled = false,
      },
      adapters = {
        require("neotest-jest")({
          jest_test_discovery = true,
          jestConfigFile = function(file)
            if string.find(file, "/libs/") or string.find(file, "/apps/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          cwd = function(file)
            if string.find(file, "/libs/") or string.find(file, "/apps/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
}
