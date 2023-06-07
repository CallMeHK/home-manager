''
PATH=$PATH:/usr/bin
if [[ -d "$HOME/.asdf" ]]
then
	echo "--- asdf already has been installed ---"
else
	echo "--- asdf has not been installed, installing now ---"
	/usr/bin/git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	source "$HOME/.asdf/asdf.sh"

	echo "--- asdf installed, adding completions ---"
	mkdir -p ~/.config/fish/completions
	ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
	echo "--- asdf completions for fish added ---"

	echo "--- installing nodejs ---"
	$HOME/.asdf/bin/asdf plugin-add nodejs
	$HOME/.asdf/bin/asdf install nodejs 18.8.0
	echo "--- nodejs 18.8.0 installed ---"
	$HOME/.asdf/bin/asdf global nodejs 18.8.0
	echo "--- nodejs 18.8.0 set to global ---"
fi
''
