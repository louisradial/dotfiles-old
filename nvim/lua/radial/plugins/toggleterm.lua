return {
    'akinsho/toggleterm.nvim',
    event = 'TermOpen',
    keys = {
        {[[<C-\>]], '<cmd>ToggleTerm', desc = 'Toggle Terminal'}
    },
    opts = {
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = 'float',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = 'curved',
            winblend = 0,
            highlights = {
                border = 'Normal',
                background = 'Normal',
            },
        },
    },
    config = function(_, opts)
        require('toggleterm').setup(opts)
        vim.keymap.set('t', '<Esc>', [[<c-\><c-n>:bd<cr>]], {desc = 'Quit terminal'})
    end
}
