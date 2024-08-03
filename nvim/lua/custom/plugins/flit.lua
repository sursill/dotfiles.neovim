-- flit.nvim
-- https://github.com/ggandor/flit.nvim

return {
  "ggandor/flit.nvim",
  event = "BufEnter",
  config = function ()
    require("flit").setup{}
  end
}
