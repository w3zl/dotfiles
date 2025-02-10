return {
    { 
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
            require('lualine').setup({
                options = {
                    theme = 'palenight',
		        },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'filetype'},
                    lualine_c = {'filename'},
                    lualine_x = {},
                    lualine_y = {'location'},
                    lualine_z = {'branch', 'diff', 'diagnostics'}
                }
	        })
	    end,
    },
}

