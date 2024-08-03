-- neo-tree
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- remove deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  keys = {
    { "<leader>E", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function ()
    require("neo-tree").setup{
      close_if_last_window = true,
      default_component_configs = {
        indent = {
          indent_size = 1,
          with_markers = false,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = true,
          never_show = {
            ".git",
            ".npm",
            ".nuxt",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true,
        },
      }
    }
    -- Highlights
    -- Run :Telescope highlights to list all highlights
    -- vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { ctermfg='white', fg="#abb2bf" })
    -- vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { ctermfg='white', fg="#abb2bf" })
  end
}
