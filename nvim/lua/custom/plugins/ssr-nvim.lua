-- ssr.nvim
-- https://github.com/cshuaimin/ssr.nvim

return {
  "cshuaimin/ssr.nvim",
  lazy = true,
  init = function ()
    vim.keymap.set({ "n", "x" }, "<leader>cR", function() require("ssr").open() end, { desc = "Structural Replace" })
  end
}
