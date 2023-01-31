return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    keys = {
        { '<leader>ex', '<cmd>NvimTreeToggle<CR>', desc = 'File [Ex]plorer' },
    },
    config = function()
        local status_ok, nvim_tree = pcall(require, "nvim-tree")
        if not status_ok then
            return
        end

        local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
        if not config_status_ok then
            return
        end

        local tree_cb = nvim_tree_config.nvim_tree_callback
        nvim_tree.setup({
            view = {
                width = 30,
                side = "right",
                mappings = {
                    list = {
                        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                        { key = "h", cb = tree_cb "close_node" },
                        { key = "v", cb = tree_cb "vsplit" },
                    },
                },
            },
            sync_root_with_cwd = true,
            open_on_setup = false,
            ignore_buffer_on_setup = true,
            update_focused_file = {
                enable = true,
                update_cwd = false,
            },
            filters = { custom = { "^.git$" } },
            renderer = {
                root_folder_modifier = ":t",
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
        })
    end
}
