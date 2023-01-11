local map = vim.keymap.set
vim.g.mapleader = ' '

-- map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>bq', ':bd<CR>')
map('n', '<leader><Right>', ':bnext<CR>')
map('n', '<leader><Left>', ':bprev<CR>')

-- Convenience things
map("n", "0", "^")
map("n", "-", "0")
map("n", "j", "gj")
map("n", "k", "gk")

-- visual selection move up/down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- cursor kept in place
map('n', 'J', "mzJ`z")
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- delete/paste over text without losing previous copied text
map('x', '<leader>p', [["\_dP]])
map({'n', 'v'}, '<leader>d', [[\"_d]])

-- yank to clipboard, maintains previous copied text
map({'n', 'v'}, '<leader>y', [[\"+y]])
-- map({'n, v'}, '<leader>Y', [[\"+Y]])

-- quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- indenting
map('n', '<leader>if', "gg=G''", { desc = '[I]ndent [F]ile' })

-- nvim-tree
map('n', '<leader>ex', ':NvimTreeToggle<CR>', { desc = 'File [Ex]plorer' })

-- telescope
local telescope = require'telescope.builtin'

map('n', '<leader>?', telescope.oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader><space>', telescope.buffers, {desc = '[ ] Find existing buffers'})
map('n', '<leader>/', function()
    telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewr = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })
-- map('n', '<leader>p' function() telescope.git_files { show_untracked = true } end)
map('n', '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- file browser
-- map('n', '<leader>fb', ':Telescope file_browser<CR>')
