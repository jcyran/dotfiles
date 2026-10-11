return {
    cmd = { "lua-language-server" },
    filetype = { "lua" },
    root_markers = { ".luarc.json", ".git", },
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}
