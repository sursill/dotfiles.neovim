-- dial.nvim
-- https://github.com/monaqa/dial.nvim

return {
  "monaqa/dial.nvim",
  lazy = true,
  keys = {
    { "<C-a>", mode = { 'n', 'v' }, desc = "Increment text object under cursor" },
    { "<C-x>", mode = { 'n', 'v' }, desc = "Decrement text object under cursor" },
  },
  config = function ()
    local augend = require('dial.augend')

    require("dial.config").augends:register_group{
      default = {
        augend.integer.alias.decimal_int,
        augend.constant.alias.bool,
        augend.constant.alias.Alpha,
        augend.constant.alias.alpha,
        augend.date.alias["%H:%M"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%Y/%m/%d"],

        -- Custom augends
        augend.constant.new{
          elements = { '||', '&&' },
          word = false,
          cyclic = true,
        },

        augend.constant.new{
          elements = { '==', '!=' },
          word = false,
          cyclic = true,
        },

        augend.constant.new{
          elements = { '===', '!==' },
          word = false,
          cyclic = true,
        },

        augend.constant.new{
          elements = { 'public', 'protected', 'private' },
          word = true,
          cyclic = true,
        },

        augend.constant.new{
          elements = { 'let', 'const' },
          word = true,
          cyclic = true,
        },

        -- Could be moved to a visual/ frontend centric group
        augend.constant.new{
          elements = { 'xs', 'sm', 'md', 'lg', 'xl' },
          word = true,
          cyclic = true,
        }
      }
    }

    -- Keymaps
    local map = require("dial.map")

    vim.keymap.set("n", "<C-a>", map.inc_normal(), { noremap = true, desc = "Increment text object under cursor" })
    vim.keymap.set("n", "<C-x>", map.dec_normal(), { noremap = true, desc = "Decrement text object under cursor" })
    vim.keymap.set("v", "<C-a>", map.inc_visual(), { noremap = true, desc = "Increment text object under cursor" })
    vim.keymap.set("v", "<C-x>", map.dec_visual(), { noremap = true, desc = "Decrement text object under cursor" })

    vim.keymap.set("n", "g<C-a>", function ()
      map.manipulate("increment", "gnormal")
    end, { noremap = true, desc = "Increment text object under cursor" })
    vim.keymap.set("n", "g<C-x>", function ()
      map.manipulate("decrement", "gnormal")
    end, { noremap = true, desc = "Decrement text object under cursor" })
    vim.keymap.set("v", "g<C-a>", function ()
      map.manipulate("increment", "gvisual")
    end, { noremap = true, desc = "Increment text object under cursor" })
    vim.keymap.set("v", "g<C-x>", function ()
      map.manipulate("decrement", "gvisual")
    end, { noremap = true, desc = "Decrement text object under cursor" })

  end
}
