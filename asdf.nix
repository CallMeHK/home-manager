''
if [[ -d "$HOME/.asdf" ]]
then
	echo "--- asdf already has been installed ---"
else
	echo "--- asdf has not been installed, installing now ---"
	/usr/bin/git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	echo "--- asdf installed, adding completions ---"
	mkdir -p ~/.config/fish/completions
	ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
	echo "--- asdf completions for fish added ---"
fi
''
