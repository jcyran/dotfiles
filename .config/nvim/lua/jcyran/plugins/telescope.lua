return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = {
        {
            "nvim-lua/plenary.nvim",
            version = "0.1.4",
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-Up>"] = actions.preview_scrolling_up,
                        ["<C-Down>"] = actions.preview_scrolling_down,
                        ["<C-Left>"] = actions.preview_scrolling_left,
                        ["<C-Right>"] = actions.preview_scrolling_right,
                    },
                    n = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-Up>"] = actions.preview_scrolling_up,
                        ["<C-Down>"] = actions.preview_scrolling_down,
                        ["<C-Left>"] = actions.preview_scrolling_left,
                        ["<C-Right>"] = actions.preview_scrolling_right,
                    },
                },
            },
        })
    end,
}
