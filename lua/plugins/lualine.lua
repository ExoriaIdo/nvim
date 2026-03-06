return {
  'nvim-lualine/lualine.nvim',
  config = function()
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = {
        normal = {
          a = { fg = '#7c7c7c', bg = '#222222', gui = 'bold' },
          b = { fg = '#d3d3d3', bg = '#222222' },
          c = { fg = '#7eae81', bg = '#222222' },
        },
        insert = {
          a = { fg = '#7eae81', bg = '#222222', gui = 'bold' },
          b = { fg = '#7c7c7c', bg = '#222222' },
          c = { fg = '#d3d3d3', bg = '#222222' },
        },
        visual = {
          a = { fg = '#d3d3d3', bg = '#222222', gui = 'bold' },
          b = { fg = '#7eae81', bg = '#222222' },
          c = { fg = '#7c7c7c', bg = '#222222' },
        },
        replace = {
          a = { fg = '#ffffff', bg = '#222222', gui = 'bold' },
          b = { fg = '#ffffff', bg = '#222222' },
          c = { fg = '#ffffff', bg = '#222222' },
        },
        inactive = {
          a = { fg = '#888888', bg = '#222222', gui = 'bold' },
          b = { fg = '#888888', bg = '#222222' },
          c = { fg = '#888888', bg = '#222222' },
        },
      },
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    }
  }
  end
}
