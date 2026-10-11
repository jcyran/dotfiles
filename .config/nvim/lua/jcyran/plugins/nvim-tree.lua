vim.pack.add({
    {
        src = "https://github.com/nvim-tree/nvim-web-devicons",
    }
})

vim.pack.add({
    {
        src = "https://github.com/nvim-tree/nvim-tree.lua",
        version = "v1.18.0",
    }
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 45,
        side = "right",
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

local function toggle_or_focus_tree()
    local api = require("nvim-tree.api")

    if api.tree.is_visible() then
        if vim.bo.filetype == "NvimTree" then
            api.tree.close()
        else
            api.tree.focus()
        end
    else
        api.tree.open()
    end
end

vim.keymap.set("n", "<C-n>", toggle_or_focus_tree, { desc = "Toggle or Focus NvimTree" })

-- Default keymap
-- vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>", {})
