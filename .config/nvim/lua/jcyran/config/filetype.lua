vim.filetype.add({
    extension = {
        yml = function(path, bufnr)
            if string.match(path, "playbook") or string.match(path, "tasks/") or string.match(path, "roles/") then
                return "yaml.ansible"
            end

            return "yaml"
        end,
        yaml = function(path, bufnr)
            if string.match(path, "playbook") or string.match(path, "tasks/") or string.match(path, "roles/") then
                return "yaml.ansible"
            end

            return "yaml"
        end,
        ini = "ini",
        cfg = "ini",
    },
    pattern = {
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    },
})
