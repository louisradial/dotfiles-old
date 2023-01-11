local actions = require 'telescope.actions'
require'telescope'.setup {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
		mappings = {
			i = {
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
			},
		},
	},
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Enable telescope file browser
-- require('telescope').load_extension 'file_browser'
-- local telescope = require'telescope.builtin'

-- vim.keymap.set('n', '<leader>?', telescope.oldfiles, { desc = '[?] Find recently opened files' })
-- vim.keymap.set('n', '<leader><space>', telescope.buffers, {desc = '[ ] Find existing buffers'})
-- vim.keymap.set('n', '<leader>/', function()
-- telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--winblend = 10,
--previewr = false,
--})
--end, { desc = '[/] Fuzzily search in current buffer]' })
-- vim.keymap.set('n', '<leader>p' function() telescope.git_files { show_untracked = true } end)
--vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
--vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
--vim.keymap.set('n', '<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
--vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
--vim.keymap.set('n', '<leader>sd', telescope.diagnostics, { desc = '[S]earch [D]iagnostics' })
