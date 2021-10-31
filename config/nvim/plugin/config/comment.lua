local comment = require 'Comment'

comment.setup({
  padding = true,
  ignore = '^$', -- Ignore empty lines

  mappings = {
    basic = true,
    extra = false,
  },

  toggler = {
    line = 'gcc',
    block = 'gbc',
  },

  opleader = {
    line = 'gc',
    block = 'gb'
  }
})
