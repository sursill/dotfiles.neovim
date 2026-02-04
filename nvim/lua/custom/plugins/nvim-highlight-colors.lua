-- nvim-highlight-colors
-- https://github.com/brenoprata10/nvim-highlight-colors

return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  config = function ()
    local highlight = require("nvim-highlight-colors")
    highlight.setup({
      render = 'virtual',
      virtual_symbol = '',
      virtual_symbol_position = 'eow',
      virtual_symbol_prefix = ' ',
      virtual_symbol_suffix = '',

      enable_named_colors = false,
      enable_tailwind = true,
    })
  end
}

-- Preview
-- border: solid #a21c12; # Test color
