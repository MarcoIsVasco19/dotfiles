# Only run on macOS

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

[ -f /opt/homebrew/etc/bash_completion ] && . /opt/homebrew/etc/bash_completion


# ASDF
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
#. "/opt/homebrew/opt/asdf/libexec/asdf.sh"

#. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash"
#. "/opt/homebrew/opt/asdf/etc/bash_completion.d/asdf"
