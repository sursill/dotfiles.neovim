-- text-case.nvim
-- https://github.com/johmsalas/text-case.nvim

return {
  "johmsalas/text-case.nvim",
  event = 'BufEnter',
  config = function ()
    local textcase = require("textcase")
    local telescope = require("telescope")

    telescope.load_extension('textcase')
    textcase.setup {}

    vim.api.nvim_set_keymap('n', 'gat', '<cmd>TextCaseOpenTelescope<CR>', { desc = "Select textcase to apply" })
    vim.api.nvim_set_keymap('v', 'gat', '<cmd>TextCaseOpenTelescope<CR>', { desc = "Select textcase to apply" })
  end
}
