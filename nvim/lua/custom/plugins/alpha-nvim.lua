-- alpha-nvim
-- https://github.com/goolord/alpha-nvim

-- Useful links
-- https://github.com/sho-87/dotfiles/blob/master/nvim/lua/utils.lua
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-1309233

return {
  'goolord/alpha-nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function ()
    local theme = require('alpha.themes.theta')
    local dashboard = require('alpha.themes.dashboard')

    local function get_header()
      local art = {
        ' .d8888b.  8888888b.   .d8888b.  888     ',
        'd88P  Y88b 888   Y88b d88P  Y88b 888     ',
        'Y88b.      888    888 Y88b.      888     ',
        ' "Y888b.   888   d88P  "Y888b.   888     ',
        '    "Y88b. 8888888P"      "Y88b. 888     ',
        '      "888 888 T88b         "888 888     ',
        'Y88b  d88P 888  T88b  Y88b  d88P 888     ',
        ' "Y8888P"  888   T88b  "Y8888P"  88888888',
      }
      return art
    end

    local function get_quick_links()
      return {
        dashboard.button('s', "  Search Directory", "<leader>sf"),
        dashboard.button('e', "  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button('q', "  Quit", ":qa <CR>"),
      }
    end

    local function get_tools()
      return {
        dashboard.button('l', "󰒓  Lazy", ":Lazy<CR>"),
        dashboard.button('m', "󰒓  Mason", ":Mason<CR>"),
      }
    end

    local function get_info()
      local todayString = os.date(" Today is %A, %b %d")
      return {
        todayString,
      }
    end

    -- theme.section.header.val = get_header()
    -- theme.section.buttons.val = get_quick_links()
    -- theme.section.footer.val = get_info()

    local function render_lines(lineTbl, type, opts)
      local lines = {}
      for i, line in ipairs(lineTbl) do
        local lineType = type or "text"
        local lineOptions = opts or {
          position = "center",
        }

        local tbl = {
          type = lineType,
          val = line,
          opts = lineOptions
        }
        table.insert(lines, tbl)
      end
      return lines
    end

    theme.config.layout = {
      { type = "padding", val = 4 },
      { type = "group", val = render_lines(get_header()), opts = {} },
      { type = "padding", val = 4 },
      { type = "group", val = get_quick_links(), opts = {} },
      { type = "padding", val = 2 },
      { type = "group", val = render_lines({ "Tools" }, nil, { hl = "SpecialComment", position = "center" }), opts = {} },
      { type = "group", val = get_tools(), opts = {} },
      { type = "padding", val = 4 },
      { type = "group", val = render_lines(get_info()), opts = {} },
    }

    require('alpha').setup(theme.config)
  end
}
