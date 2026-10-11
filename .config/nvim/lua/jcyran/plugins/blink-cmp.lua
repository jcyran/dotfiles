vim.pack.add({
    {
        src = "https://github.com/saghen/blink.cmp",
        version = "v1.10.2",
    }
})

require("blink.cmp").setup({
    keymap = { preset = "default" },
    appearance = {
        nerd_font_variant = "mono",
    },
    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
        },
    },
    signature = {
        enabled = true,
    },
})
