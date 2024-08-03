-- todo-comments.nvim
-- https://github.com/folke/todo-comments.nvim

-- TODO: Make it so it also detects PHP docblock `@todo` keywords
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odos" }
  },
  opts = {
    sign_priority = 4, -- Prioritize git signs
  },
}
