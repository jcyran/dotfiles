# bash_functions

# reverse-search using fzf
fzf_history() {
    local selected=$(fc -ln 1 | sed 's/^\s\+//;1!G;h;$!d' | \
        fzf --no-sort --height ~60% --layout reverse)

    if [[ -n selected ]]; then
        READLINE_LINE="$selected"
        READLINE_POINT=${#selected}
    fi
}

# git checkout using fzf
fgitcheck() {
    git rev-parse --is-inside-work-tree >/dev/null || return
    local selected=$(git for-each-ref --format='%(refname:short)' refs/heads | \
        fzf --height 30% --layout reverse)

    git checkout $selected
}

bind -x '"\C-R": fzf_history'
