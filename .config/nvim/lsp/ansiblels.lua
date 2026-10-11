return {
    cmd = { "ansible-language-server", "--stdio" },
    filetypes = { "yaml.ansible", "ansible" },
    root_markers = { "roles", "playbooks", "ansible.cfg", ".git" },
}
