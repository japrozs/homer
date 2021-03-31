#!/bin/sh
# Copyright 2019 the Homer authors. All rights reserved. MIT license.
# TODO(everyone): Keep this script simple and easily auditable.

set -e

if ! command -v unzip >/dev/null; then
	echo "Error: unzip is required to install Homer (see: https://github.com/japrozs/homer)." 1>&2
	exit 1
fi

homer_uri="https://github.com/japrozs/homer/releases/download/0.01/hm.zip"

homer_install="${HOMER_INSTALL:-$HOME/.homer}"
bin_dir="$homer_install/bin"
exe="$bin_dir/hm"

if [ ! -d "$bin_dir" ]; then
	mkdir -p "$bin_dir"
fi

curl --fail --location --progress-bar --output "$exe.zip" "$homer_uri"
unzip -d "$bin_dir" -o "$exe.zip"
chmod +x "$exe"
rm "$exe.zip"
echo "export PATH=$HOME/.homer/bin:$PATH" >>$HOME/.bash_profile
echo "export PATH=$HOME/.homer/bin:$PATH" >>$HOME/.zshrc
echo "export PATH=$HOME/.homer/bin:$PATH" >>$HOME/.bashrc

echo "Homer was installed successfully to $exe"
if command -v hm >/dev/null; then
	echo "Run 'hm help' to get started"
else
	case $SHELL in
	/bin/zsh) shell_profile=".zshrc" ;;
	*) shell_profile=".bash_profile" ;;
	esac
	echo "Manually add the directory to your \$HOME/$shell_profile (or similar)"
	echo "  export HOMER_INSTALL=\"$homer_install\""
	echo "  export PATH=\"\$HOMER_INSTALL/bin:\$PATH\""
	echo "Run '$exe --help' to get started"
fi