function _G.get_current_mode()
    local current_mode = vim.api.nvim_get_mode().mode

    local modes = {
        ["n"] = " NORMAL ",
        ["i"] = " INSERT ",
        ["v"] = " VISUAL ",
        ["V"] = " V-LINE ",
        ["\22"] = " V-BLOCK ",
        ["c"] = " COMMAND ",
        ["R"] = " REPLACE ",
        ["t"] = " TERMINAL ",
    }

    return modes[current_mode] or string.format(" %s ", current_mode)
end

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
    callback = function()
        local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

        if branch ~= "" then
            vim.b.git_branch = "  " .. branch .. " "
        else
            vim.b.git_branch = ""
        end
    end
})

vim.opt.statusline = table.concat({
    "%#StatusLineMode#%{v:lua.get_current_mode()}",
    "%* %F",
    "%m%r",
    "%=",
    "%#StatusLineBranch#%{get(b:,'git_branch', '')}",
    "%* %l:%c ",
})
