-- "lua package.loaded['jirafa'] = nil; require('jirafa').setup()"
-- jirafa.lua
local M = {}

local colors = {
    bg = "#262626",
    fg = "#E6D5C6",
    gb = "#6E6E6E",

    goldenrod = "#B99A5B",
    gray_green = "#8D9B92",
    rosewood = "#89666A",
    maquillaje = "#AC8391",

    visual = "#323436",

    red = "#C96442",
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
        String = { fg = colors.goldenrod },                           -- Las comillas y strings
        CursorLine = { bg = 'None' },
        Visual = { bg = colors.visual },

        Directory = { fg = colors.goldenrod },                         -- Nombres de directorios/archivos
        IncSearch = { bg = colors.visual },

        ["@function"] = { fg = colors.goldenrod },
        ["@function.builtin"] = { fg = colors.rosewood},
        ["@function.call"] = { fg = colors.gray_green },
        ["@method"] = { fg = colors.fg}, -- #
        ["@method.call"] = { fg = colors.fg }, --#

        -- Palabras clave (universal)
        ["@keyword"] = { fg = colors.red},
        ["@keyword.conditional"] = { fg = colors.red },    -- if, else, switch
        ["@keyword.repeat"] = { fg = colors.red},         -- for, while, loop
        ["@keyword.return"] = { fg = colors.rosewood },
        ["@keyword.operator"] = { fg = colors.red },     -- and, or, not, &&, ||
        ["@keyword.import"] = { fg = colors.gray_green },         -- import, include, use
        ["@keyword.function"] = { fg = colors.red },     -- def, function, func

        -- Variables y constantes
        ["@variable"] = { fg = colors.fg },
        ["@variable.builtin"] = { fg = colors.fg },      -- this, self, super
        ["@variable.parameter"] = { fg = colors.fg },
        ["@variable.member"] = { fg = colors.fg },        -- object.property
        ["@constant"] = { fg = colors.red },
        ["@constant.builtin"] = { fg = colors.goldenrod },     -- true, false, null, nil

        -- Tipos de datos
        ["@type"] = { fg = colors.maquillaje },
        ["@type.builtin"] = { fg = colors.rosewood },           -- int, string, bool, etc.
        ["@type.definition"] = { fg = colors.fg },          -- class, struct, interface

        -- Literales
        ["@string"] = { fg = colors.gray_green},
        ["@string.escape"] = { fg = colors.fg },        -- \n, \t, etc.
        ["@number"] = { fg = colors.gray_green},
        ["@boolean"] = { fg = colors.maquillaje },
        ["@character"] = { fg = colors.maquillaje },

        -- Comentarios
        ["@comment"] = { fg = colors.gb },
        ["@comment.documentation"] = { fg = colors.gb },

        -- Operadores y puntuación
        ["@operator"] = { fg = colors.maquillaje },
        ["@punctuation"] = { fg = colors.fg },
        ["@punctuation.bracket"] = { fg = colors.fg },      -- (), [], {}
        ["@punctuation.delimiter"] = { fg = colors.fg },    -- ,, ;, :
        ["@punctuation.special"] = { fg = colors.fg },  -- @, #, $

        -- Propiedades y campos
        ["@property"] = { fg = colors.fg },
        ["@field"] = { fg = colors.fg },
        ["@attribute"] = { fg = colors.goldenrod },               -- decoradores, annotations

        -- Constructores y namespaces
        ["@constructor"] = { fg = colors.goldenrod },
        ["@namespace"] = { fg = colors.fg },                 -- módulos, packages
        ["@module"] = { fg = colors.rosewood },

        -- Parámetros
        ["@parameter"] = { fg = colors.fg },

        -- Etiquetas específicas para algunos lenguajes pero comunes
        ["@tag"] = { fg = colors.fg},                   -- HTML/XML tags
        ["@tag.attribute"] = { fg = colors.gray_green },
        ["@tag.delimiter"] = { fg = colors.goldenrod },             -- < > </ />

        -- UI Elements
        ["CursorLineNr"] = { fg = colors.goldenrod },
        ["LineNr"] = { fg = colors.gb },

        -- === ELEMENTOS DE LA INTERFAZ ===
        Pmenu = { fg = colors.fg, bg = colors.bg },             -- Menú de autocompletado (fondo)
        PmenuSel = { fg = colors.fg, bg = colors.gb },          -- Opción seleccionada en autocompletado
        PmenuSbar = { bg = colors.bg },                         -- Barra de scroll del menú
        PmenuThumb = { bg = colors.bg },                  -- Indicador de scroll del menú

        -- === TELESCOPE/FINDER (para ventanas como las de tu imagen) ===
        TelescopeTitle = { fg = colors.goldenrod },         -- Títulos "Results", "Grep Preview", "Find Files"
        TelescopePromptBorder = { fg = colors.gb },               -- Borde de la caja de búsqueda
        TelescopeResultsBorder = { fg = colors.gb },              -- Borde de la lista de resultados
        TelescopePreviewBorder = { fg = colors.gb },              -- Borde de la vista previa
        TelescopeSelection = { bg = colors.visual },           -- Línea seleccionada (con >)
        TelescopeMatching = { fg = colors.gray_green },    -- Texto que coincide con la búsqueda


        StatusLine = { fg = colors.fg, bg = colors.bg},
        StatusLineNC = { fg = colors.fg , bg = colors.bg },

        WinSeparator = { fg = colors.visual },
        Folded = { fg = colors.gb, bg = colors.visual },
        FoldColumn = { fg = colors.gb, bg = colors.goldenrod },

        DiagnosticError = { fg = colors.red },
        DiagnosticWarn = { fg = colors.goldenrod },
        DiagnosticInfo = { fg = colors.maquillaje },
        DiagnosticHint = { fg = colors.gray_green },

        -- Todos los subrayados de diagnósticos en verde
        DiagnosticUnderlineError = { underline = true, sp = colors.gb },
        DiagnosticUnderlineWarn = { underline = true, sp = colors.gb },
        DiagnosticUnderlineInfo = { underline = true, sp = colors.gb },
        DiagnosticUnderlineHint = { underline = true, sp = colors.gb },

        EndOfBuffer = { fg = colors.bg },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
