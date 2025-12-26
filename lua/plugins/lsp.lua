return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    -- Configuración de indentación a 2 espacios
    vim.opt.tabstop = 2          -- Número de espacios para tabulaciones
    vim.opt.softtabstop = 2      -- Número de espacios para retroceder con backspace
    vim.opt.shiftwidth = 2       -- Número de espacios para el autoindentado
    vim.opt.expandtab = true     -- Convertir tabs en espacios

    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = bufnr})

      -- NUEVO: Agregar formateo manual
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {
        buffer = bufnr, 
        desc = "Format file"
      })

      -- NUEVO: Formateo automático al guardar (opcional - puedes comentar estas líneas si no lo quieres)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end

    local keymap = vim.keymap -- for conciseness
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }
        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        -- NUEVO: Agregar formateo también aquí para todos los LSP
        opts.desc = "Format buffer"
        keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
      end,
    })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.HINT]  = "󰠠 ",
          [vim.diagnostic.severity.INFO]  = " ",
        }
      }
    })

    require'lspconfig'.rust_analyzer.setup{
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = true,
          },
          procMacro = {
            enable = true,
          },
          checkOnSave = true,
          telemetry = {
            enable = false
          },
          workspace = {
            checkThirdParty = false
          }
        }
      }
    }

    require'lspconfig'.pylsp.setup{
      on_attach = on_attach,
    }

    -- Configuración para C/C++ (Clangd)
    require'lspconfig'.clangd.setup{
      on_attach = on_attach,
    }
  end
}
