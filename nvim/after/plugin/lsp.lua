require('neodev').setup()
local lsp = require 'lsp-zero'

lsp.preset 'recommended'
lsp.ensure_installed({
	'sumneko_lua',
	'pyright',
	'rust_analyzer',
})

lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			},
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            }
		}
	}
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(cmp_select),
    ["<CR>"] =  cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    }),
    ["<Right>"] = cmp.mapping.scroll_docs(4),
    ["<Left>"] = cmp.mapping.scroll_docs(-4),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "",
		warn = "",
		hint = "",
		info = ""
	}
})

lsp.on_attach(function(_, bufnr)
	local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float(nil, {focusable = false}) end, opts)
	-- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set({'v', 'n'}, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		update_in_insert = true,
		signs = true,
		virtual_text = true,
	}
)

local rust_lsp = lsp.build_options('rust_analyzer', {
	settings = {
		["rust-analyzer"] = {
			inlayHints = {locationLinks = false },
		},
	},
})

lsp.setup()

require 'rust-tools'.setup( { server = rust_lsp })

-- vim.diagnostic.config({
-- 	virtual_text = true,
-- 	update_in_insert = true,
-- 	underline = true,
-- 	signs = true,
-- })

require('fidget').setup()
