# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Scripts and better defaults for shell
for i in $HOME/.dotfiles/scripts/*.sh; do
    . "$i"
done

# User specific environment
export PATH="$HOME/.dotfiles/scripts:$HOME/.local/bin:$HOME/.npm/bin:$HOME/.luarocks/bin:$HOME/.cache/rebar3/bin:$PATH"

# Prompt
PS1="\[\e[0;31m\]┌─╼[\[\e[m\]\w\[\e[0;31m\]] \$SSH_PS1\$CONTAINER_PS1\$GIT_PS1
\$(if [ \$? -eq 0 ]; then echo \"\[\e[0;31m\]└────╼\"; else echo \"\[\e[0;31m\]└╼\"; fi) \[\e[m\]"

PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -n; git_ps1; ssh_ps1; container_ps1"

function git_ps1() {
    if git rev-parse --is-inside-work-tree 1>/dev/null 2>&1; then
        if ! branch=$(git symbolic-ref --short HEAD 2>/dev/null); then
            if ! branch=$(git name-rev HEAD --name-only --no-undefined --tags 2>/dev/null); then
                branch=$(git rev-parse --short HEAD)
            fi
        fi
        if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
            GIT_PS1="[$(tput sgr0)git$(tput setaf 1):$(tput sgr0)${branch:-unknown}*$(tput setaf 1)] "
        else
            GIT_PS1="[$(tput sgr0)git$(tput setaf 1):$(tput sgr0)${branch:-unknown}$(tput setaf 1)] "
        fi
    else
        GIT_PS1=
    fi
}

function ssh_ps1() {
    if [ -n "$SSH_CONNECTION" ]; then
        SSH_PS1="[$(tput sgr0)ssh$(tput setaf 1)] "
    else
        SSH_PS1=
    fi
}

function container_ps1() {
    if [ -e /run/.toolboxenv ]; then
        CONTAINER_PS1="[$(tput sgr0)toolbox$(tput setaf 1)] "
    elif [ -e /run/.containerenv  ]; then
        CONTAINER_PS1="[$(tput sgr0)podman$(tput setaf 1)] "
    elif [ -e /.dockerenv ]; then
        CONTAINER_PS1="[$(tput sgr0)docker$(tput setaf 1)] "
    else
        CONTAINER_PS1=
    fi
}


# Tmux
if [ -n "$(command -v tmux)" ] && [ -z "$TMUX" ]; then
    tmux
fi
