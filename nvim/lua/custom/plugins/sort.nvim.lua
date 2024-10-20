-- sort.nvim
-- https://github.com/sQVe/sort.nvim

return {
  "sQVe/sort.nvim",
  cmd = {
    -- NOTE: lazy.nvim does not allow commands in lowercase
    -- sort.nvim `sort` command is different from `Sort`
    -- When `sort` is used, plugin still works but does not
    -- register sort.nvim as started in Lazy
    "Sort",
  }
}
