return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
        require("markview").setup()

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function(event)
                if vim.bo[event.buf].buftype ~= "" then
                    return
                end
                vim.schedule(function()
                    if vim.api.nvim_buf_is_valid(event.buf) then
                        vim.cmd("Markview splitToggle")
                    end
                end)
            end,
        })
    end,
}
