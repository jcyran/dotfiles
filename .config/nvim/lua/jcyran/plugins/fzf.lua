vim.pack.add({
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons"
	}
})

vim.pack.add({
    {
        src = "https://github.com/ibhagwan/fzf-lua",
    }
})

local fzf = require("fzf-lua")

fzf.setup({
    keymap = {
        builtin = {
            false,
            ["<C-f>"] = "toggle-fullscreen",
            ["<C-r>"] = "toggle-preview-wrap",
        },
        fzf = {
            true
        },
    },

    actions = {
        files = {
            ["default"] = fzf.actions.file_edit,
            ["ctrl-s"] = fzf.actions.file_split,
            ["ctrl-v"] = fzf.actions.file_vsplit,
            ["ctrl-t"] = fzf.actions.file_tabedit,
            ["alt-q"] = fzf.actions.file_tabedit,
        },
    },
})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "FZF find files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "FZF live grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "FZF buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "FZF help tags" })

-- local actions = require("telescope.actions")
-- local builtin = require("telescope.builtin")
--
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- telescope.setup({
--     defaults = {
--         mappings = {
--             i = {
--                 ["<C-k>"] = actions.move_selection_previous,
--                 ["<C-j>"] = actions.move_selection_next,
--                 ["<C-Up>"] = actions.preview_scrolling_up,
--                 ["<C-Down>"] = actions.preview_scrolling_down,
--                 ["<C-Left>"] = actions.preview_scrolling_left,
--                 ["<C-Right>"] = actions.preview_scrolling_right,
--             },
--             n = {
--                 ["<C-k>"] = actions.move_selection_previous,
--                 ["<C-j>"] = actions.move_selection_next,
--                 ["<C-Up>"] = actions.preview_scrolling_up,
--                 ["<C-Down>"] = actions.preview_scrolling_down,
--                 ["<C-Left>"] = actions.preview_scrolling_left,
--                 ["<C-Right>"] = actions.preview_scrolling_right,
--             },
--         },
--     },
-- })
