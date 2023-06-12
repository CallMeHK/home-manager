PATH=$PATH:/usr/bin
echo "--- checking for asdf... ---"
if [[ -d "$HOME/.asdf" ]]
then
	echo "--- asdf already has been installed ---"
	source "$HOME/.asdf/asdf.sh"
else
	echo "--- asdf has not been installed, installing now ---"
	/usr/bin/git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
	source "$HOME/.asdf/asdf.sh"


	echo "--- asdf installed, adding completions ---"
	if [[ -d "$HOME/.config/fish/completions" ]]
	then
		echo "--- asdf completions for fish already exists ---"
	else
		mkdir -p ~/.config/fish/completions
		ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
		echo "--- asdf completions for fish added ---"
	fi
fi

echo "--- checking for nodejs... ---"
if [ -x "$(command -v node)" ]
then
	echo "--- nodejs already installed ---"
else
	echo "--- installing nodejs ---"
	$HOME/.asdf/bin/asdf plugin-add nodejs
	$HOME/.asdf/bin/asdf install nodejs 18.8.0
	echo "--- nodejs 18.8.0 installed ---"
	$HOME/.asdf/bin/asdf global nodejs 18.8.0
	echo "--- nodejs 18.8.0 set to global ---"
fi
