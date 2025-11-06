-- leap.nvim
-- https://github.com/ggandor/leap.nvim

return {
  "ggandor/leap.nvim",
  dependencies = {
    'tpope/vim-repeat',
  },
  config = function ()
    -- Leap anywhere
    -- vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
    -- vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap)')

    vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
  end
}
