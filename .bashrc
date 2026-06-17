#
# ~/.bashrc

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
alias cctl='clusterctl'
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

if command -v kubectl >/dev/null 2>&1; then
  for bash_completion in \
    /opt/homebrew/etc/profile.d/bash_completion.sh \
    /usr/local/etc/profile.d/bash_completion.sh \
    /opt/homebrew/etc/bash_completion \
    /usr/local/etc/bash_completion \
    /usr/share/bash-completion/bash_completion \
    /etc/bash_completion
  do
    if [ -r "${bash_completion}" ]; then
      source "${bash_completion}"
      break
    fi
  done

  if declare -F _get_comp_words_by_ref >/dev/null 2>&1; then
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
  fi
fi

## KUBECONFIG stuff
export KUBECONFIG_SOURCES="${HOME}/.kube/config:${HOME}/.kube/wur-config:${HOME}/.kube/mzansi-k8s.yml"
export KUBECONFIG="${HOME}/.kube/combined-config"

kubeconfig-rebuild() {
  local current_context

  current_context="$(kubectl config current-context 2>/dev/null || true)"
  KUBECONFIG="${KUBECONFIG_SOURCES}" kubectl config view --flatten > "${KUBECONFIG}"

  if [ -n "${current_context}" ]; then
    kubectl config use-context "${current_context}" >/dev/null 2>&1 || true
  fi
}


eval "$(starship init bash)"

# opencode
export PATH=/home/adm_m075/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
