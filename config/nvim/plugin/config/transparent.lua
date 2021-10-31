local transparent = require 'transparent'

transparent.setup({
  enable = true,
  extra_groups = {
    "GalaxyLineBackground"
  },
  exclude = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
})
