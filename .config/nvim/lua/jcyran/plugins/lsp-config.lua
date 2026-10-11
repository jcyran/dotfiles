vim.pack.add({
    {
        src = "https://github.com/mason-org/mason.nvim",
        version = "v2.3.1",
    }
})

require("mason").setup()

local packages = {
    "lua-language-server",
    "pyright",
    "ansible-language-server",
}
local registry = require("mason-registry")

registry.refresh(function()
    for _, pkg_name in ipairs(packages) do
        local pkg = registry.get_package(pkg_name)
        if not pkg:is_installed() then
            pkg:install()
        end
    end
end)

local capabilities = require("blink.cmp").get_lsp_capabilities()
local lspconfig = vim.lsp.config

-- Python virtual environment
local function change_python_venv(client)
    local python_path = vim.fn.exepath("python3")

    local venv_path = vim.fs.find(".venv", {
        path = vim.fn.getcwd(),
        upward = true,
        stop = vim.env.HOME,
    })[1]

    if venv_path and venv_path ~= "" then
        python_path = venv_path .. "/bin/python3"
    end

    client.config.settings.python.pythonPath = python_path
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP Actions",
    callback = function(args)
        local opts = { buffer = args.buf }

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts)

        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "pyright" then
            change_python_venv(client)
        end
    end,
})

lspconfig("*", {
    capabilities = capabilities,
})

vim.lsp.enable({
    "lua_ls",
    "pyright",
    "ansiblels",
})
