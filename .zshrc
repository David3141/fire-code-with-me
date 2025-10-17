alias g='git'
alias gapa='git add -p'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gl='git pull'
alias glg='git log --oneline'
alias gp='git push'
alias gss='git status -s'
alias gst='git status'


# History

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

setopt append_history         # append to the history file, don't clobber it on exit
setopt inc_append_history     # write each command to the history file as it's executed
setopt share_history          # share history across all running zsh sessions
setopt hist_ignore_all_dups   # remove older duplicate entries when a command is re-run
setopt hist_reduce_blanks     # strip extra blanks in commands before saving (helps duplicates rule)
setopt hist_expire_dups_first # when trimming history, expire duplicates before unique entries
setopt hist_verify            # when using history expansion (!), put the command on the prompt for editing


# Zsh Autocompletion

setopt prompt_subst                                    # allow command substitution in prompt
autoload -Uz compinit && compinit                      # load and initialize autocompletion
zstyle ':completion:*' menu select                     # make tab selections interactive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case-insensitive completion


# Prompt

branch_name() {
 ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3,4,5)
 echo $ref
}

git_status() {
  status_line_count=$(git status --porcelain 2>/dev/null | wc -l)
  # [[ status_line_count -gt 0 ]] && echo '✖' || echo '•'
  [[ status_line_count -gt 0 ]] && echo '✗' || echo '♥'
}

PROMPT=' %1~ %F{cyan}$(branch_name) %F{magenta}$(git_status)%f '


# Tools
source <(fzf --zsh)
eval "$(mise activate zsh)"
