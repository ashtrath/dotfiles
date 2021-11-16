local tree = require 'nvim-tree'

tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = true,
  indent_marker = true,
  update_cwd = true,
  ignore = { ".git", "node_modules", ".cache" },

  update_focused_file = {
     enable = true,
     update_cwd = false,
  },

  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },

  view = {
     allow_resize = false,
     side = "left",
     width = 23,
  },

  show_icons = {
    git = true,
    folders = true,
    files = true,
  },

  icons = {
    default = " ",
    symlink = " ",
    git = {
      deleted = "",
      ignored = "◌",
      unstaged = "✗",
      staged = "✓",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
    },
  
    folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
    },
  },

  termguicolors = true,
  hide_dotfiles = false,

}

