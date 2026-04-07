-- Note: Requires the `efmls-configs-nvim` plugin
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local black = require("efmls-configs.formatters.black")
local flake8 = require("efmls-configs.linters.flake8")
local eslint_d = require("efmls-configs.linters.eslint_d")
local prettier = require("efmls-configs.formatters.prettier")
local fixjson = require("efmls-configs.formatters.fixjson")

-- Optional extras (you can uncomment when needed)
-- local clang_format = require("efmls-configs.formatters.clang-format")
-- local trivy = require("efmls-configs.linters.trivy")

return {
  filetypes = {
    -- "cpp",
    "docker",
    "json",
    "lua",
    "markdown",
    "python",
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
  },
  settings = {
    languages = {
      -- cpp = { clang_format, trivy },
      docker = { prettier },
      json = { fixjson, eslint_d },
      lua = { luacheck, stylua },
      markdown = { prettier },
      python = { flake8, black },
    },
  },
}

