-- nvim-surround
-- https://github.com/kylechui/nvim-surround

return {
  "kylechui/nvim-surround",
  event = "BufEnter",
  version = "*",
  config = function ()
    require("nvim-surround").setup()
  end
}
