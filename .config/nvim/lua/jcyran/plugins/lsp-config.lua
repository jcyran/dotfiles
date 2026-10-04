return {
    "neovim/nvim-lspconfig",
    version = "2.12.0",
    dependencies = {
        {
            "mason-org/mason.nvim",
            version = "2.3.1",
        },
        {
            "mason-org/mason-lspconfig.nvim",
            version = "2.3.0",
        },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "yamlls",
                "ansiblels",
            }
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                local client = vim.lsp.get_client_by_id(args.data.client_id)

                if client and client.name == "pyright" then
                    change_python_venv(client)
                end
            end,
        })

        lspconfig("lua_ls", {
            capabilities = capabilities,
        })

        lspconfig("pyright", {
            capabilities = capabilities,
            root_markers = { ".venv" },
        })

        lspconfig("yamlls", {
            capabilities = capabilities,
            filetypes = { "yaml" },
        })

        lspconfig("ansiblels", {
            capabilities = capabilities,
            filetypes = { "yaml.ansible", "ansible" },
            root_markers = { "roles", "playbooks", "ansible.cfg", ".git" },
        })

        vim.lsp.enable({
            "lua_ls",
            "pyright",
            "yamlls",
            "ansiblels",
        })
    end
}
