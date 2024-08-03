-- treesj
-- https://github.com/Wansmer/treesj

return {
  "Wansmer/treesj",
  keys = {
    '<space>m',
    '<space>j',
    '<space>s',
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = true,
  config = function()
    local tsj = require("treesj")
    local langs = {}

    tsj.setup({
      use_default_keymaps = true,
      check_syntax_error = true,
      max_join_length = 120,
      cursor_behavior = 'hold',
      notify = true,
      langs = langs,
      dot_repeat = true,
    })
  end
}
