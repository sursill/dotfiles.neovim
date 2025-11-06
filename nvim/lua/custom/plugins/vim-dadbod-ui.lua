-- vim-dadbod-ui
-- https://github.com/kristijanhusak/vim-dadbod-ui

return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function ()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_show_help = 0
    -- vim.g.db_ui_use_nvim_notify = 1
    vim.g.db_ui_save_location = '~/.config/dadbod_ui'
    vim.g.db_ui_dotenv_variable_prefix = 'DBUI_'

    vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>DBUI<CR>', { desc = 'Open [D]atabase [B]rowser' })

    -- NOTE: Define connection strings inside nvim.env. eg.
    -- DBUI_PROJECTNAME_DEV=postgres://username:password@localhost:5432/database_name
  end
}
