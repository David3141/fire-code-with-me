alias g='git'
alias gapa='git add -p'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gl='git pull'
alias glg='git log --oneline'
alias gp='git push'
alias gss='git status -s'
alias gst='git status'


# history

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history


# autocompletion

setopt prompt_subst # allow command substitution in prompt
autoload -Uz compinit && compinit # don't know exactly what is is, but enables tab selections


# prompt

branch_name() {
 ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
 echo $ref
}

git_status() {
  status_line_count=$(git status --porcelain 2>/dev/null | wc -l)
  # [[ status_line_count -gt 0 ]] && echo '✖' || echo '•'
  [[ status_line_count -gt 0 ]] && echo '✗' || echo '♥'
}

PROMPT=' %1~ %F{cyan}$(branch_name) %F{magenta}$(git_status)%f '
# PROMPT='%-50<..<%~%<<> ' # leave 50 characters left for input


# tab selections

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# retain current working directory in new tab
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}


# Let pkg-config know about openssl for `crystal play` to work
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig

# defaults
# defaults write .GlobalPreferences com.apple.scrollwheel.scaling -1
# revert with: defaults delete .GlobalPreferences com.apple.scrollwheel.scaling

# add haskell or stack packages to PATH
# path+=~/.local/bin

# add postgresql to path
# path+=/Applications/Postgres.app/Contents/Versions/latest/bin

# fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GHCUP
# source /Users/david/.ghcup/env

# rbenv
# eval "$(rbenv init -)"

# [ -f "/Users/david/.ghcup/env" ] && source "/Users/david/.ghcup/env" # ghcup-env
