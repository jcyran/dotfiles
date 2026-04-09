return {
    "sainnhe/gruvbox-material",
    name = "gruvbox material",
    config = function()
        vim.cmd([[let g:gruvbox_material_background = "medium"]])
        vim.cmd([[colorscheme gruvbox-material]])

        -- This is for statusline colors, they need to be loaded after colorscheme
        local function get_hl_color(group_name, attribute)
            return vim.api.nvim_get_hl(0, { name = group_name})[attribute]
        end

        local mode_bg = get_hl_color("Statement", "fg")
        local branch_bg = get_hl_color("String", "fg")
        local box_text_color = get_hl_color("Normal", "bg") or 0x1E1E2E

        vim.api.nvim_set_hl(0, "StatusLineMode", { bg = mode_bg, fg = box_text_color, bold = true })
        vim.api.nvim_set_hl(0, "StatusLineBranch", { bg = branch_bg, fg = box_text_color, bold = true })
    end,
}
