#!/bin/zsh

main() {
  echo "installing python"

  if [[ $OSTYPE =~ ^darwin ]]; then
    brew install python3
    pip3 install --upgrade pip
  fi
  if [[ $OSTYPE =~ ^linux ]]; then
    sudo apt-get install python3 pip
  fi

  echo "installing python modules"

  # add modules, if you want any other modules
  local modules
  modules=(
    virtualenv
    jedi
    yapf
    flake8
    notebook
    neovim

    # may need to use `sudo -H pip3 install inkscape-figures`
    # https://github.com/gillescastel/inkscape-figures/issues/28
    inkscape-figures
  )
  for module in $modules; do
    pip3 install $module
  done
}

main $@
