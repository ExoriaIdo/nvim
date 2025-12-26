-- "lua package.loaded['jirafa'] = nil; require('jirafa').setup()"
-- jirafa.lua
local M = {}

local colors = {
    bg = "#131110",
    fg = "#969A9C",
    color1 = "#766F53",
    color2 = "#6C7271",
    color3 = "#545E6C",
    color4 = "#6C635D",
    gb = "#2B2B2B",
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
        String = { fg = colors.color1 },                           -- Las comillas y strings
        CursorLine = { bg = 'None' },
        Visual = { bg = colors.gb },

        Directory = { fg = colors.color1 },                         -- Nombres de directorios/archivos
        IncSearch = { bg = colors.gb },

        ["@function"] = { fg = colors.color1 },
        ["@function.builtin"] = { fg = colors.color2},           -- print()
        ["@function.call"] = { fg = colors.color1 },
        ["@method"] = { fg = colors.fg}, -- #
        ["@method.call"] = { fg = colors.fg }, --#

        -- Palabras clave (universal)
        ["@keyword"] = { fg = colors.color3},                -- class try except finally
        ["@keyword.conditional"] = { fg = colors.color3 },    -- if, else, switch
        ["@keyword.repeat"] = { fg = colors.color3},         -- for, while, loop
        ["@keyword.return"] = { fg = colors.color2 },
        ["@keyword.operator"] = { fg = colors.color3 },     -- and, or, not, &&, ||

        ["@keyword.import"] = { fg = colors.color2 },         -- import, include, use
        ["@keyword.function"] = { fg = colors.color3 },     -- def, function, func

        -- Variables y constantes
        ["@variable"] = { fg = colors.fg },
        ["@variable.builtin"] = { fg = colors.color2 },      -- this, self, super
        ["@variable.parameter"] = { fg = colors.fg },
        ["@variable.member"] = { fg = colors.color4 },        -- object.property
        ["@constant"] = { fg = colors.color1 },
        ["@constant.builtin"] = { fg = colors.color1 },     -- true, false, null, nil

        -- Tipos de datos
        ["@type"] = { fg = colors.color2 },
        ["@type.builtin"] = { fg = colors.color2 },           -- int, string, bool, etc.
        ["@type.definition"] = { fg = colors.fg },          -- class, struct, interface

        -- Literales
        ["@string"] = { fg = colors.color4},
        ["@string.escape"] = { fg = colors.fg },        -- \n, \t, etc.
        ["@number"] = { fg = colors.color2},
        ["@boolean"] = { fg = colors.color4 },
        ["@character"] = { fg = colors.color4 },

        -- Comentarios
        ["@comment"] = { fg = colors.gb },
        ["@comment.documentation"] = { fg = colors.gb },

        -- Operadores y puntuación
        ["@operator"] = { fg = colors.color4 },
        ["@punctuation"] = { fg = colors.fg },
        ["@punctuation.bracket"] = { fg = colors.fg },      -- (), [], {}
        ["@punctuation.delimiter"] = { fg = colors.fg },    -- ,, ;, :
        ["@punctuation.special"] = { fg = colors.fg },  -- @, #, $

        -- Propiedades y campos
        ["@property"] = { fg = colors.fg },
        ["@field"] = { fg = colors.fg },
        ["@attribute"] = { fg = colors.color1 },               -- decoradores, annotations

        -- Constructores y namespaces
        ["@constructor"] = { fg = colors.color1 },
        ["@namespace"] = { fg = colors.fg },                 -- módulos, packages
        ["@module"] = { fg = colors.color3 },

        -- Parámetros
        ["@parameter"] = { fg = colors.fg },

        -- Etiquetas específicas para algunos lenguajes pero comunes
        ["@tag"] = { fg = colors.fg},                   -- HTML/XML tags
        ["@tag.attribute"] = { fg = colors.color2 },
        ["@tag.delimiter"] = { fg = colors.color1 },             -- < > </ />

        -- UI Elements
        ["CursorLineNr"] = { fg = colors.color1 },
        ["LineNr"] = { fg = colors.gb },

        -- === ELEMENTOS DE LA INTERFAZ ===
        Pmenu = { fg = colors.fg, bg = colors.bg },             -- Menú de autocompletado (fondo)
        PmenuSel = { fg = colors.fg, bg = colors.gb },          -- Opción seleccionada en autocompletado
        PmenuSbar = { bg = colors.bg },                         -- Barra de scroll del menú
        PmenuThumb = { bg = colors.bg },                  -- Indicador de scroll del menú

        -- === TELESCOPE/FINDER (para ventanas como las de tu imagen) ===
        TelescopeTitle = { fg = colors.color1 },         -- Títulos "Results", "Grep Preview", "Find Files"
        TelescopePromptBorder = { fg = colors.gb },               -- Borde de la caja de búsqueda
        TelescopeResultsBorder = { fg = colors.gb },              -- Borde de la lista de resultados
        TelescopePreviewBorder = { fg = colors.gb },              -- Borde de la vista previa
        TelescopeSelection = { bg = colors.gb },           -- Línea seleccionada (con >)
        TelescopeMatching = { fg = colors.color2 },    -- Texto que coincide con la búsqueda


        StatusLine = { fg = colors.fg, bg = colors.bg},
        StatusLineNC = { fg = colors.fg , bg = colors.bg },

        WinSeparator = { fg = colors.gb },
        Folded = { fg = colors.gb, bg = colors.gb },
        FoldColumn = { fg = colors.gb, bg = colors.color1 },

        DiagnosticError = { fg = colors.color4 },
        DiagnosticWarn = { fg = colors.color1 },
        DiagnosticInfo = { fg = colors.color4 },
        DiagnosticHint = { fg = colors.color2 },

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
