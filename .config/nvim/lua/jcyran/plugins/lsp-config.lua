return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "rust_analyzer",
            }
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = vim.lsp.config

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP Actions",
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end,
        })
        local on_attach = function(client, bufrn)
        end

        -- virtual environment detection
        local get_python_path = function(workspace)
            if vim.env.VIRTUAL_ENV then
                return vim.env.VIRTUAL_ENV .. "/bin/python"
            end

            for _, pattern in ipairs({ "venv", ".venv", "env", ".env" }) do
                local match = vim.fn.glob(workspace .. "/" .. pattern)
                if match ~= '' then
                  return match .. "/bin/python"
                end
            end

            return "python3"
        end

        lspconfig("lua_ls", {
            capabilities = capabilities,
        })

        lspconfig("pyright", {
            capabilities = capabilities,
            settings = {
                pyright = {
                    python = {
                        pythonPath = get_python_path(vim.fn.getcwd())
                    }
                }
            }
        })

        lspconfig("rust_analyzer", {
            capabilities = capabilities,
            filetypes = {"rust"},
        })

        vim.lsp.enable({
            "lua_ls",
            "pyright",
            "rust_analyzer",
        })
    end
}
