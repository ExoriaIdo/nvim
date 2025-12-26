-- suricata.lua
local M = {}

local colors = {
    bg = "#242933",
    fg = "#CBD4E4",

    orange = "#6E9A80",
    cyan = "#2F959A",
    gray = "#65676D",
    blue = "#7F7E9E",
    red = "#8B4333",
    brown = "#734D72",
    pink = "#90908a",
    green = "#5A8F55",

    comment = "#36383A",
    visual = "#282A2C",

    cursor_line = "#EDBE58",
    selection = "#26282A",
    search = "#384130",
    line_number = "#404243",
    line_number_current = "#D55056",
}

function M.setup()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end
    vim.o.background = "dark"
    vim.g.colors_name = "suricata"

    local highlights = {
        -- Grupos básicos de Treesitter (puedes agregar más)
        Normal = { fg = colors.fg, bg = colors.bg },              -- Texto normal
        String = { fg = colors.green },                           -- Las comillas y strings
        CursorLine = { bg = 'None' },
        Visual = { bg = colors.visual },

        Directory = { fg = colors.gray },                         -- Nombres de directorios/archivos
        IncSearch = { bg = colors.visual },

        ["@function"] = { fg = colors.cyan },  -- function name
        ["@function.builtin"] = { fg = colors.blue }, -- print(), len()
        ["@keyword"] = { fg = colors.orange }, -- def, class
        ["@keyword.conditional"] = { fg = colors.pink }, -- while
        ["@keyword.import"] = { fg = colors.blue },
        ["@keyword.operator"] = { fg = colors.orange }, -- Ej: and, or, not
        ["@keyword.return"] = { fg = colors.blue },
        ["@variable"] = { fg = colors.fg },
        ["@constant.builtin"] = { fg = colors.orange }, -- None
        ["@constant"] = { fg = colors.cyan }, -- VARIABLE
        ["@string"] = { fg = colors.pink },
        ["@comment"] = { fg = colors.comment },
        ["@operator"] = { fg = colors.pink },
        ["@type"] = { fg = colors.fg }, -- Ej: class Producto:
        ["@boolean"] = { fg = colors.blue },
        ["@number"] = { fg = colors.cyan },
        ["@attribute"] = { fg = colors.gray },
        ["@module"] = { fg = colors.fg },
        ["@type.builtin"] = { fg = colors.blue }, -- Ej: str, int, list
        ["@variable.builtin"] = { fg = colors.brown }, -- Ej: self, cls, __name__
        ["@method"] = { fg = colors.green },-- Ej: objeto.metodo()
        ["@field"] = { fg = colors.green },
        ["@property"] = { fg = colors.fg },
        ["@namespace"] = { fg = colors.fg },
        ["@parameter"] = { fg = colors.fg }, -- Ej: def func(param):
        ["@punctuation"] = { fg = colors.fg }, -- Ej: (, ), :, ,
        ["@constructor"] = { fg = colors.fg }, -- {} in another languages
        ["@variable.member"] = { fg = colors.pink },
        ["@variable.parameter"] = { fg = colors.cyan }, -- Parámetros de función
        ["@punctuation.bracket"] = { fg = colors.fg },       -- llaves, paréntesis
        ["@punctuation.special"] = { fg = colors.orange },-- : ! < > dentro de {}
        ["@attribute.builtin"] = { fg = colors.brown },
        ["CursorLineNr"] = { fg = colors.red },
        ["LineNr"] = { fg = colors.comment },
        -- Fondo flotante oscuro

        -- UI y elementos de Neovim (no parte de Treesitter)
        -- === ELEMENTOS DE LA INTERFAZ ===
        Pmenu = { fg = colors.fg, bg = colors.gray },             -- Menú de autocompletado (fondo)
        PmenuSel = { fg = colors.bg, bg = colors.cyan },          -- Opción seleccionada en autocompletado
        PmenuSbar = { bg = colors.gray },                         -- Barra de scroll del menú
        PmenuThumb = { bg = colors.light_gray },                  -- Indicador de scroll del menú

        -- === TELESCOPE/FINDER (para ventanas como las de tu imagen) ===
        TelescopeTitle = { fg = colors.orange },         -- Títulos "Results", "Grep Preview", "Find Files"
        TelescopePromptBorder = { fg = colors.comment },               -- Borde de la caja de búsqueda
        TelescopeResultsBorder = { fg = colors.comment },              -- Borde de la lista de resultados
        TelescopePreviewBorder = { fg = colors.comment },              -- Borde de la vista previa
        TelescopeSelection = { bg = colors.visual },           -- Línea seleccionada (con >)
        TelescopeMatching = { fg = colors.cyan, bold = true },    -- Texto que coincide con la búsqueda
        -- Los nombres de archivos en la lista "Results"

        -- === VENTANAS FLOTANTES GENERALES ===
        FloatBorder = { fg = colors.fg },                         -- Bordes de ventanas flotantes
        FloatTitle = { fg = colors.fg, bold = true },             -- Títulos de ventanas flotantes
        NormalFloat = { fg = colors.fg, bg = colors.bg },    

        StatusLine = { fg = colors.fg, bg = colors.bg },
        StatusLineNC = { fg = colors.comment, bg = colors.gray },
        TabLine = { fg = colors.comment, bg = colors.gray },
        TabLineFill = { bg = colors.gray },
        TabLineSel = { fg = colors.fg, bg = colors.bg },

        VertSplit = { fg = colors.red },
        Folded = { fg = colors.comment, bg = colors.gray },
        FoldColumn = { fg = colors.comment, bg = colors.bg },
        SignColumn = { bg = colors.bg },

        DiagnosticError = { fg = colors.red },
        DiagnosticWarn = { fg = colors.orange },
        DiagnosticInfo = { fg = colors.cyan },
        DiagnosticHint = { fg = colors.light_gray },

        DiffAdd = { fg = colors.green },
        DiffChange = { fg = colors.orange },
        DiffDelete = { fg = colors.pink },
        DiffText = { fg = colors.cyan, bg = colors.gray },
        EndOfBuffer = { fg = colors.bg },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
