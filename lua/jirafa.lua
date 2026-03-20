-- "lua package.loaded['jirafa'] = nil; require('jirafa').setup()"
-- jirafa.lua — mac_classic palette port
local M = {}

local colors = {
    bg      = "#EFF2EE",
    fg      = "#000000",
    gb      = "#808080",

    dblue   = "#0000A2",   -- numbers, function names
    blue    = "#1E39F6",   -- keywords, operators
    lblue   = "#0066FF",   -- comments, folds
    lpurple = "#6E79F1",   -- booleans, constants
    teal    = "#318495",   -- instance/global vars
    dgreen  = "#007B22",   -- strings, labels
    lgreen  = "#00BC41",   -- interpolation, CSS attrs
    red     = "#D51015",   -- constants, symbols, numbers
    pink    = "#E18AC7",   -- regexps
    bgrey   = "#3C4C72",   -- rails helpers, cursor

    visual  = "#C6DEFF",
    curline = "#F0F6FF",
    linebg  = "#EFEFEF",
    error   = "#990000",
}

function M.setup()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end
    vim.o.background = "light"
    vim.g.colors_name = "mac_classic"

    local highlights = {
        -- Base
        Normal        = { fg = colors.fg,      bg = colors.bg },
        Visual        = { bg = colors.visual },
        CursorLine    = { bg = colors.curline },
        CursorColumn  = { bg = colors.curline },
        LineNr        = { fg = colors.gb,       bg = colors.linebg },
        CursorLineNr  = { fg = colors.dblue,    bg = colors.linebg },
        VertSplit     = { fg = colors.bg,        bg = "#CFCFCF" },
        MatchParen    = { fg = colors.blue,      bold = true },
        Folded        = { fg = colors.lblue,     bg = colors.bg },
        FoldColumn    = { fg = colors.lblue,     bg = colors.linebg },
        Directory     = { fg = colors.red,       bold = true },
        EndOfBuffer   = { fg = colors.linebg },

        -- Search
        IncSearch     = { bg = "#FFCE77" },
        Search        = { bg = "#FFE6BB" },

        -- Popupmenu
        Pmenu         = { fg = colors.fg,  bg = colors.linebg },
        PmenuSel      = { fg = colors.fg,  bg = colors.visual },
        PmenuSbar     = { bg = colors.linebg },
        PmenuThumb    = { bg = colors.gb },

        -- StatusLine
        StatusLine    = { fg = colors.fg,  bg = colors.visual,  italic = true },
        StatusLineNC  = { fg = colors.fg,  bg = colors.linebg },

        -- Window
        WinSeparator  = { fg = "#CFCFCF" },

        -- Invisible chars
        NonText       = { fg = "#DFDFDF" },
        SpecialKey    = { fg = "#DFDFDF" },

        -- Errors / Warnings
        ErrorMsg      = { fg = colors.bg,  bg = colors.error },
        WarningMsg    = { fg = colors.bg,  bg = colors.error },
        DiagnosticError             = { fg = colors.error },
        DiagnosticWarn              = { fg = "#FFCE77" },
        DiagnosticInfo              = { fg = colors.lblue },
        DiagnosticHint              = { fg = colors.teal },
        DiagnosticUnderlineError    = { underline = true, sp = colors.error },
        DiagnosticUnderlineWarn     = { underline = true, sp = colors.gb },
        DiagnosticUnderlineInfo     = { underline = true, sp = colors.gb },
        DiagnosticUnderlineHint     = { underline = true, sp = colors.gb },

        -- Core syntax
        Comment       = { fg = colors.lblue,   italic = true },
        Constant      = { fg = colors.red,      bold = true },
        String        = { fg = colors.dgreen },
        Character     = { fg = colors.red,      bold = true },
        Number        = { fg = colors.dblue },
        Float         = { fg = colors.dblue },
        Boolean       = { fg = colors.lpurple,  bold = true },
        Identifier    = { fg = colors.blue,     bold = true },
        Function      = { fg = colors.dblue,    bold = true },
        Statement     = { fg = colors.blue,     bold = true },
        Conditional   = { fg = colors.blue,     bold = true },
        Repeat        = { fg = colors.blue,     bold = true },
        Label         = { fg = colors.dgreen },
        Operator      = { fg = colors.blue,     bold = true },
        Keyword       = { fg = colors.blue,     bold = true },
        Exception     = { fg = colors.blue,     bold = true },
        PreProc       = { fg = colors.blue,     bold = true },
        Define        = { fg = colors.blue,     bold = true },
        Type          = { fg = colors.lpurple },
        StorageClass  = { fg = colors.blue,     bold = true },
        Special       = { fg = colors.fg },
        Title         = { fg = colors.fg,        bold = true },
        Todo          = { fg = colors.lblue,     bold = true, italic = true, reverse = true },
        Underlined    = { underline = true },

        -- Treesitter
        ["@comment"]                = { fg = colors.lblue,   italic = true },
        ["@comment.documentation"]  = { fg = colors.lblue,   italic = true },

        ["@keyword"]                = { fg = colors.blue,    bold = true },
        ["@keyword.conditional"]    = { fg = colors.blue,    bold = true },
        ["@keyword.repeat"]         = { fg = colors.blue,    bold = true },
        ["@keyword.return"]         = { fg = colors.blue,    bold = true },
        ["@keyword.operator"]       = { fg = colors.blue,    bold = true },
        ["@keyword.import"]         = { fg = colors.blue,    bold = true },
        ["@keyword.function"]       = { fg = colors.blue,    bold = true },

        ["@function"]               = { fg = colors.dblue,   bold = true },
        ["@function.builtin"]       = { fg = colors.dblue,   bold = true },
        ["@function.call"]          = { fg = colors.dblue },
        ["@method"]                 = { fg = colors.dblue,   bold = true },
        ["@method.call"]            = { fg = colors.dblue },

        ["@variable"]               = { fg = colors.fg },
        ["@variable.builtin"]       = { fg = colors.teal },
        ["@variable.parameter"]     = { fg = colors.fg },
        ["@variable.member"]        = { fg = colors.fg },

        ["@constant"]               = { fg = colors.red,     bold = true },
        ["@constant.builtin"]       = { fg = colors.lpurple, bold = true },

        ["@type"]                   = { fg = colors.lpurple },
        ["@type.builtin"]           = { fg = colors.lpurple, bold = true },
        ["@type.definition"]        = { fg = colors.fg },

        ["@string"]                 = { fg = colors.dgreen },
        ["@string.escape"]          = { fg = colors.lgreen },
        ["@number"]                 = { fg = colors.dblue },
        ["@boolean"]                = { fg = colors.lpurple, bold = true },
        ["@character"]              = { fg = colors.red,     bold = true },

        ["@operator"]               = { fg = colors.blue,    bold = true },
        ["@punctuation"]            = { fg = colors.fg },
        ["@punctuation.bracket"]    = { fg = colors.fg },
        ["@punctuation.delimiter"]  = { fg = colors.fg },
        ["@punctuation.special"]    = { fg = colors.lgreen },

        ["@property"]               = { fg = colors.fg },
        ["@field"]                  = { fg = colors.fg },
        ["@attribute"]              = { fg = colors.dblue },
        ["@constructor"]            = { fg = colors.dblue,   bold = true },
        ["@namespace"]              = { fg = colors.fg },
        ["@module"]                 = { fg = colors.teal },
        ["@parameter"]              = { fg = colors.fg },

        ["@tag"]                    = { fg = colors.blue },
        ["@tag.attribute"]          = { fg = colors.blue },
        ["@tag.delimiter"]          = { fg = colors.blue },

        -- Telescope
        TelescopeTitle          = { fg = colors.dblue,  bold = true },
        TelescopePromptBorder   = { fg = colors.gb },
        TelescopeResultsBorder  = { fg = colors.gb },
        TelescopePreviewBorder  = { fg = colors.gb },
        TelescopeSelection      = { bg = colors.visual },
        TelescopeMatching       = { fg = colors.red,    bold = true },

        -- Diff
        diffAdded   = { fg = colors.dgreen },
        diffRemoved = { fg = colors.red },
        diffFile    = { fg = colors.lpurple },
        diffLine    = { fg = colors.fg },
        diffChange  = { fg = colors.dgreen },
        diffText    = { fg = colors.dgreen },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

return M
