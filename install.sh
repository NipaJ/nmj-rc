script_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)

vimrc=~/.vimrc

echo "if has(\"unix\")" >> "$vimrc"
echo "    so $script_dir/config.vim" >> "$vimrc"
echo "endif" >> "$vimrc"

if [ "$OSTYPE" = "msys" ]; then
    unix2dos "$vimrc"
fi
