alias g='git'
alias gapa='git add -p'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias gss='git status -s'
alias gcb='git checkout -b'

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history


setopt prompt_subst # allow command substitution in prompt
autoload -Uz compinit && compinit # don't know exactly what is is, but enables tab selections


branch_name() {
 ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3)
 echo $ref
}

git_status() {
  status_line_count=$(git status --porcelain 2>/dev/null | wc -l)
  # [[ status_line_count -gt 0 ]] && echo '✖' || echo '•'
  [[ status_line_count -gt 0 ]] && echo '✗' || echo '♥'
}


# PROMPT='%-50<..<%~%<<> ' # leave 50 characters left for input
PROMPT=' %1~ %F{cyan}$(branch_name) %F{magenta}$(git_status)%f ' # •| dir |• (with colors)

# tab selections
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


# retain current working directory in new tab
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}
