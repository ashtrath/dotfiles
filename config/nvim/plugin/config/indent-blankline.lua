vim.opt.list = true

require("indent_blankline").setup {
    char = "▏",
    show_current_context = true,
		filetype_exclude = {
      "help",
      "terminal",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "dashboard",
    }, 
		buftype_exclude	 = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false
}
