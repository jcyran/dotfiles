vim.pack.add({
    {
        src = "https://github.com/OXY2DEV/markview.nvim",
        version = "v28.3.0",
    }
})

require("markview").setup()

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.cmd("Markview Stop")
    end,
})
