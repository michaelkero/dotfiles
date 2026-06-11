return {
    {
          'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter', -- Change from 'nvim-treesitter.configs' to 'nvim-treesitter'
        opts = {
          -- Your standard treesitter options go here
          highlight = { enable = true },
        },
    },
}
