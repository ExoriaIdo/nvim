return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()

    -- Keymaps y autocmds al conectar un LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        opts.desc = "Go to next diagnostic"
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        opts.desc = "Show documentation"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = "Format buffer"
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

        -- Formateo automático al guardar
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = ev.buf,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end,
    })

    -- Iconos de diagnóstico
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN]  = " ",
          [vim.diagnostic.severity.HINT]  = "󰠠 ",
          [vim.diagnostic.severity.INFO]  = " ",
        }
      }
    })

    -- Rust Analyzer
    vim.lsp.config('rust_analyzer', {
      settings = {
        ['rust-analyzer'] = {
          procMacro = { enable = true },
          diagnostics = {
            enable = true,
            disabled = { "macro-error", "unresolved-proc-macro" },
          },
        }
      }
    })
    vim.lsp.enable('rust_analyzer')

    -- Python
    vim.lsp.config('pylsp', {
      filetypes = { "python" },  -- nota: "py" no es válido, debe ser "python"
    })
    vim.lsp.enable('pylsp')

    -- C/C++
    vim.lsp.config('clangd', {
      filetypes = { "c", "cpp" },  -- nota: "cpp" solo cubría C++, agregué "c" también
    })
    vim.lsp.enable('clangd')

  end
}
