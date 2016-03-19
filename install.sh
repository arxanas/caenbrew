#!/bin/sh
set -euo pipefail

readonly CAENBREW_DIR="$HOME/.local"
readonly PIP='/usr/um/python-2.7/bin/pip'

# Assume that the user is using bash.
readonly BASHRC="$HOME/.bashrc"
readonly BASHRC_MARKER='# Added by Caenbrew.'

main() {
    install_caenbrew
    add_local_dir_to_path
    echo "$(tput setaf 2)✓$(tput sgr0) Caenbrew successfully installed."
    echo '  You may have to restart your terminal.'
}

install_caenbrew() {
    # Note -- `pip install --user` functions assuming that the user has the
    # directory `~/.local`. We would have to add `~/.local` to our PATH to use
    # Caenbrew. But we need to do that anyways because Caenbrew installs all of
    # its packages to `~/.local` as well.
    mkdir -p "$CAENBREW_DIR"
    "$PIP" install --user caenbrew
}

add_local_dir_to_path() {
    touch "$BASHRC"
    if ! grep -q "$BASHRC_MARKER" "$BASHRC"; then
	# Note: we need to put ~/.local/bin *before* the rest of our PATH,
	# because there may be old CAEN executables of the same name in our
	# PATH. We need to make sure our newer ones take precedence.
        echo '' >>"$BASHRC"
        echo "$BASHRC_MARKER" >>"$BASHRC"
        echo 'export PATH="$HOME/.local/bin:$PATH"' >>"$BASHRC"
    fi
}

main