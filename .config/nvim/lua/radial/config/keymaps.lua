local map = vim.keymap.set

-- map('n', '<leader>w', ':w<CR>')
map('n', '<C-q>', ':q<CR>', { desc = '[Q]uit nvim'})
map('n', '<leader>q', ':bd<CR>', { desc = '[Q]uit current buffer'})
map('n', '<leader><Right>', ':bnext<CR>', {desc = 'Move to the next buffer'})
map('n', '<leader><Left>', ':bprev<CR>', {desc = 'Move to the previous buffer'})

-- Convenience things
map("n", "0", "^")
map("n", "-", "0")
map("n", "j", "gj")
map("n", "k", "gk")

-- insert blank line
map('n', '<leader>o', 'o<Esc>', { desc = 'Insert new line below the cursor and exit Insert mode'})
map('n', '<leader>O', 'O<Esc>', { desc = 'Insert new line above the cursor and exit Insert mode'})


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
-- map('x', '<leader>p', [["\_dP]])
-- map({'n', 'v'}, '<leader>d', [[\"_d]])

-- yank to clipboard, maintains previous copied text
-- map({'n', 'v'}, '<leader>y', [[\"+y]])
-- map({'n, v'}, '<leader>Y', [[\"+Y]])

-- quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace current word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace current [W]ord' })

-- indenting
map('n', '<leader>if', "gg=G''", { desc = '[I]ndent [F]ile' })

-- windows specific
if vim.loop.os_uname().sysname == "Windows_NT" then
  map('n', '<C-z>', '<nop>')
  map('i', '<C-z>', '<nop>')
  map('v', '<C-z>', '<nop>')
  map('s', '<C-z>', '<nop>')
  map('x', '<C-z>', '<nop>')
  map('c', '<C-z>', '<nop>')
  map('o', '<C-z>', '<nop>')
end
