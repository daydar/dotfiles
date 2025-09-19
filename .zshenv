# ZDOTDIR=$HOME/.config/zsh

# XDG Base Directory settings
export XDG_DATA_HOME="$HOME/.local/share" # Specifies the base directory for user-specific data files. These files can be larger or application-specific, like shared application data.
export XDG_CONFIG_HOME="$HOME/.config" # Specifies the base directory for user-specific configuration files. This helps organize app configurations, moving them out of the home directory into ~/.config/.
export XDG_STATE_HOME="$HOME/.local/state" # Specifies the base directory for storing user-specific state data, which is different from cache (persistent information related to the current state of apps).
export XDG_CACHE_HOME="$HOME/.cache" # Specifies the base directory for user-specific non-essential cache files.
export XDG_RUNTIME_DIR="/run/user/$UID" # Specifies the directory for storing user-specific runtime files (such as sockets and temporary files). This directory is usually created dynamically and is system-specific. The value should point to a location like /run/user/$UID (where $UID is the user ID of the current user).

# zsh
SHELL_SESSIONS_DISABLE=1

# Pyenv environment variables
# export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
# export PATH="$PYENV_ROOT/bin:$PATH"
# export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

# Jenv environment variables
export JENV_SHELL=zsh
export JENV_LOADED=1

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

# Python
export KERAS_HOME="${XDG_STATE_HOME}/keras"

# Go
export GOPATH="$XDG_DATA_HOME"/go

# .NET
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
    
# NuGet
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages

# Node
export N_PREFIX=$XDG_CACHE_HOME

# Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

#OPENAI
if [[ -f "$HOME/.secrets" ]]; then
  source "$HOME/.secrets"
fi

export OPENAI_API_KEY="$OPENAI_API_KEY"

# ruby bundler
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle

# CLI Tools
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"


. "/Users/deniz/.local/share/cargo/env"
