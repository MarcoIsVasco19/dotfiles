#
# ~/.bashrc
#

# source ~/.git-prompt.sh

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

#PROMPT_COMMAND='__git_ps0 "\[\e[33m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]:\[\e[35m\]\W\[\e[0m\]" " \n$ "'
#
#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWCOLORHINTS=1
#export GIT_PS1_SHOWCOLORHINTS=1
#export GIT_PS1_DESCRIBE_STYLE="branch"


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

# ls
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -lathr'

alias t='tmux'
alias vim='nvim'

## terraform
#alias tf='terraform'
#complete -C /opt/homebrew/bin/terraform terraform
#alias tg='terragrunt'
#alias ctg='find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;'
#complete -C /Users/marco.marques/.asdf/shims/terragrunt terragrunt
#alias tm='terramate'
#complete -C /Users/marco.marques/.asdf/shims/terramate terramate

alias kubetools='docker run -it --rm  -v ~/.azure:/root/.azure -v /Users/marco.marques/docker/kubetools:/kubetools -v ~/.kube:/root/.kube --rm --network=host --workdir /kubetools aimvector/kube-tools'
alias repos='cd ~/repos'
alias whatsmyip="curl 'https://api.ipify.org?format=json'"

# kubectl
alias k='kubectl'
alias kctx='kubectx'
complete -o default -F __start_kubectl k
alias cctl='clusterctl'

## KUBECONFIG stuff
#export KUBECONFIG="${KUBECONFIG}:${HOME}/.kube/config:${HOME}/.kube/bks-nonprod.yml"
#kubectl config view --flatten > ~/.kube/combined-config
#cp ~/.kube/combined-config ~/.kube/config


eval "$(starship init bash)"

