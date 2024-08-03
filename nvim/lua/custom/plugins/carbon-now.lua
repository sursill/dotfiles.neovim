-- carbon-now
-- https://www.github.com/ellisonleao/carbon-now.nvim

return {
  "ellisonleao/carbon-now.nvim",
  cmd = {"CarbonNow"},
  keys = {
    { "<leader>cn", ":CarbonNow<CR>", mode = {"n", "v"}, desc = "[C]arbon [N]ow" },
  },
  opts = {
      -- Config here
      -- https://www.github.com/ellisonleao/carbon-now.nvim#configuration-and-customization
      options = {
        bg = "#4A4A4A",
        theme = "vscode",
        font_family = "Fira Code",
        font_size = "12px",
        line_numbers = true,
        window_theme = "none"
      }
  },
}
