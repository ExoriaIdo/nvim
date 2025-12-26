local ls = require "luasnip"
local types = require "luasnip.util.types"

local M = {}

function M.setup()
  ls.config.set_config {
    history = true,

    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<- Choice", "Error" } },
        },
      },
    },
  }

end

return M

