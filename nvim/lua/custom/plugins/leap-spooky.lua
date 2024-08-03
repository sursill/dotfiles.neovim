-- leap-spooky.nvim
-- https://github.com/ggandor/leap-spooky.nvim

return {
  "ggandor/leap-spooky.nvim",
  -- dependencies = { "ggandor/leap" },
  event = 'VeryLazy',
  opts = {
    affixes = {
      remote = { window = 'r', cross_window = 'R' },
      magnetic = { window = 'm', cross_window = 'M' },
    },
    paste_on_remote_yank = false
  }
}
