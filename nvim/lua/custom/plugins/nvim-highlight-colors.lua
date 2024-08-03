-- nvim-highlight-colors
-- https://github.com/brenoprata10/nvim-highlight-colors

return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  config = function ()
    local highlight = require("nvim-highlight-colors")
    highlight.setup({
      enable_tailwind = true
    })
  end
}
