
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Path to your oh-my-zsh installation. 
# Placed here since it is for interactive shell session
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="robbyrussell"
# ZSH_THEME="passion"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="TRUE"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git
  # pyenv
  zsh-bat
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
)

#This line initializes pyenv by evaluating its startup script
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# personal aliases
## Configs
alias gitconfig="open ~/.config/git/config"
alias sshconfig="open ~/.ssh/config"
alias zshconfig="open ~/.zshrc"
alias zshenv="open ~/.zshenv"
alias listPath="tr ':' '\n' <<< '$PATH'"

## Servers
alias yasmaServer="ssh -t yasmaServer"

## CLI tools
alias lg="lazygit"
alias e="eza -l -a --icons"
# alias fzf="fzf --height 40% --layout reverse --border --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"

alias di="docker images [--format] | docker-color-output"
alias dps="docker ps [-a] [--format] | docker-color-output"
alias dcps="docker compose ps | docker-color-output"
alias ds="docker stats [--no-stream] | docker-color-output"

# jenv initialize
eval export PATH="/Users/deniz/.jenv/shims:${PATH}"
unset JAVA_HOME
unset JDK_HOME

# 1. Find the latest version of jenv
JENV_VERSION=$(ls /opt/homebrew/Cellar/jenv | sort -V | tail -n 1)
# 2. Set the source path dynamically based on the latest version
source "/opt/homebrew/Cellar/jenv/$JENV_VERSION/libexec/libexec/../completions/jenv.zsh"

jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

# This defines a function in your shell called jdk. 
# When you type jdk followed by a version number in the terminal, 
# this function gets executed.
jdk() {
  version=$1
  unset JAVA_HOME;
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}


# zsh plugins

source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOMEBREW_PREFIX/share/zsh-you-should-use/you-should-use.plugin.zsh

# keybindings

# bindkey "^[[A" history-substring-search-up
# bindkey "^[[B" history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# zsh
zstyle ':autocomplete:*' delay 0.2  # seconds (float)
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"


if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/takuya.omp.json)"

# uv python package manager
eval "$(uv generate-shell-completion zsh)"

export PATH="$HOME/go/bin:$PATH"
