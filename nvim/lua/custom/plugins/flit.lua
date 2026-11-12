-- flit.nvim
-- https://github.com/ggandor/flit.nvim

return {
  "ggandor/flit.nvim",
  event = "BufEnter",
  config = function ()
    require("flit").setup{
      opts = {
        -- Override Flit's removed Leap option; preserve case-sensitive f/t motions.
        case_sensitive = false,
        vim_opts = { ['go.ignorecase'] = false },
      },
    }
  end
}
