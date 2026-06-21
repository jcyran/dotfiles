# bash_prompt

BLACK="\[\e[30m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
PURPLE="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"
RESET="\[\e[0m\]"

get_git_branch() {
    local branch=$(git branch --show-current 2>/dev/null)

    if [ -z "$branch" ]; then
        return
    fi

    local symbols=""

    if ! git diff --quiet 2>/dev/null; then
        symbols+="*"
    fi

    if ! git diff --cached --quiet 2>/dev/null; then
        symbols+="+"
    fi

    if [ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]; then
        symbols+="?"
    fi

    if [ -n "$symbols" ]; then
        echo "  $branch ($symbols)"
    else
        echo "  $branch"
    fi
}

PS1="┌${PURPLE}\u ${YELLOW}\w${GREEN}\$(get_git_branch)\n${RESET}└─${BLUE}>${RESET} "
