# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
if [[ $OSTYPE == "linux-gnu"* ]]; then
  export PATH=$PATH:$HOME/bin:/usr/local/bin
  source "/usr/share/zsh-antigen/antigen.zsh"
elif [[ $OSTYPE == "darwin"* ]]; then
  export PATH=$PATH/opt/homebrew/bin:/opt/homebrew/opt/grep/libexec/gnubin:$HOME/bin:/usr/local/bin
  source $(brew --prefix)/share/antigen/antigen.zsh
fi
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle Aloxaf/fzf-tab
antigen bundle aws

antigen theme romkatv/powerlevel10k

antigen apply

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# fzf configurations
plugins=(fzf git brew docker docker-compose npm)

# fzf setup
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd . --type f --hidden'
export FZF_COMPLETION_TRIGGER='**'
#
_fzf_compgen_path() {
  fd --type f --hidden --follow --exclude ".git" . "$1"
}
#
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$HOME/Vindex" "$HOME/personal"
}
source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias vim=nvim
alias v=nvim
alias fman="compgen -c | fzf | xargs man"

# Pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
