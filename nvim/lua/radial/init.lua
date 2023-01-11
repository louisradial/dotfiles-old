require('radial.plugins')
require('radial.set')
require('radial.remap')
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup('HighlightYank', {clear = true})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 60,
        })
    end,
})

local postspace_group = augroup('DeletePostspace', {clear = true})
autocmd({'BufWritePre'}, {
    group = postspace_group,
    pattern = '*',
    command = [[%s/\s\+$//e]]
})

-- colorscheme
local colorscheme =
'tokyonight-night'
-- 'tokyonight-storm'
-- 'gruvbox'
-- 'catppuccin'
-- 'duskfox'
vim.o.background = 'dark'
vim.o.termguicolors = true
vim.cmd.colorscheme(colorscheme)
