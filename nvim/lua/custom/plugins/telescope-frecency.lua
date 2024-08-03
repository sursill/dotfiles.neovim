-- telescope-frecency.nvim
-- https://github.com/nvim-telescope/telescope-frecency.nvim

return {
  "nvim-telescope/telescope-frecency.nvim",
  keys = {
    { "<leader>sf", "<cmd>Telescope frecency<cr>", desc = "[S]earch files by [F]recency" }
  },
  config = function ()
    require("telescope").load_extension("frecency")
  end
}
