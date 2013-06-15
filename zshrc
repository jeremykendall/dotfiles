export EDITOR=vim

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="kendall"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias hig="history | grep --color"
alias gsu="git submodule init"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/mysql/bin

# Keychain is an app that reduces ssh-agent processes running, and also allow you to only enter your key password once.
# Every ssh tunnel will share the same ssh-agent dramatically reducing resource usage on your machine.
# Below we also use Keychain to automatically register you ssh keys
function get_ssh_key_files() {
  local list= 
  for keyfile in $(/usr/bin/egrep -c 'BEGIN.+PRIVATE KEY' ~/.ssh/* | grep :1 | cut -d: -f1); do 
    ssh-keygen -l -f ${keyfile}.pub &>/dev/null && list="${list} ${keyfile}"
  done
  echo $list
}

# set up public key via public key setup function
eval $(keychain --eval --agents ssh,gpg --inherit any $(get_ssh_key_files))
alias proj="cd /Volumes/data_devo/devo/current"
alias jgrep="grep -r -n --color"
alias gsu="git submodule update --init"
alias hig="history | grep --color"
alias vu='vagrant up'
