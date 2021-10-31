local ts = require 'nvim-treesitter.configs'

ts.setup {
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {},
  },

  indent = {
    enable = false,
    disable = {},
  },

  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" }
  },

  ensure_installed = {
    "lua",
    "c",
    "cpp",
    "tsx",
    "json",
    "html",
    "css",
    "javascript",
    "typescript",
  }
}

