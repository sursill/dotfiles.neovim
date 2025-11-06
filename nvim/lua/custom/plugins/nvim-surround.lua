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
              local mirror_map = {
                ["("] = ")", [")"] = "(",
                ["["] = "]", ["]"] = "[",
                ["{"] = "}", ["}"] = "{",
                ["<"] = ">", [">"] = "<",
              }

              local function reverse_and_mirror(s)
                local out = {}
                for i = #s, 1, -1 do
                  local ch = s:sub(i, i)
                  out[#out + 1] = mirror_map[ch] or ch
                end
                return table.concat(out)
              end

              return { { tag }, { reverse_and_mirror(tag) } }
            end
          end
        },
        ["q"] = {
          add = { "${", "}" },
        }
      }
    })
  end
}
