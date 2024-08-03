-- nvim-surround
-- https://github.com/kylechui/nvim-surround

return {
  "kylechui/nvim-surround",
  event = "BufEnter",
  version = "*",
  config = function()
    require("nvim-surround").setup({
      surrounds = {
        ["c"] = {
          -- Add more than 1 character
          add = function()
            local config = require("nvim-surround.config")
            local tag = config.get_input("Enter characters to surround: ")
            if tag then
              return { { tag }, { string.reverse(tag) } }
            end
          end
        }
      }
    })
  end
}
