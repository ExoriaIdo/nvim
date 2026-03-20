return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      "python",
      "rust",
      "cpp",
    },
    highlight = {
      enable = true,
    },
  },
}
