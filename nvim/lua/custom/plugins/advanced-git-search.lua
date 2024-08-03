-- advanced-git-search
-- https://github.com/aaronhallaert/advanced-git-search.nvim

return {
  'aaronhallaert/advanced-git-search.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
  },
  cmd = { 'AdvancedGitSearch' },
  config = function ()
    local telescope = require("telescope")
    telescope.setup{
      extensions = {
        advanced_git_search =  {
          diff_plugin = "fugitive",
          git_flags = {},
          show_builtin_git_pickers = false,
        }
      }
    }

    telescope.load_extension("advanced_git_search")
  end
}
