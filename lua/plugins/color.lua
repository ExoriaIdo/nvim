return {
  -- "ellisonleao/gruvbox.nvim",
  "jnurmine/Zenburn",
  -- "zenbones-theme/zenbones.nvim",
  -- dependencies = "rktjmp/lush.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('zenburn')
  end,
}
