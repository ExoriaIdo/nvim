return {
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup {
      size = 15,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 3, -- Cambia alfa del fondo (puedes ajustar según tus preferencias)
      start_in_insert = true,
      persist_size = true,
      direction = 'float', -- Puedes cambiar a 'horizontal', 'window' o 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'single', -- Puedes cambiar a 'double', 'shadow' o 'none', 'single'
        width = 100,
        height = 30,
        winblend = 3,
        highlights = { border = "Normal", background = "Normal" } -- Cambia a los grupos de resaltado correctos
      }
    }
  end
}
