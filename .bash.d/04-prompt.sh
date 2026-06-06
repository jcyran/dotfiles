# bash_prompt

get_git_branch() {
    local branch=$(git branch --show-current 2>/dev/null)

    if [ -n "$branch" ]; then
        echo " git:($branch)"
    fi
}

BLACK="\[\e[30m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
PURPLE="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"
RESET="\[\e[0m\]"

PS1="┌$PURPLE\u $YELLOW\w$GREEN\$(get_git_branch)\n$RESET└─$BLUE>$RESET "
