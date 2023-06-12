PATH=$PATH:/usr/bin
FISH_PATH="$HOME/.nix-profile/bin/fish" 
if [ "$SHELL" == "$FISH_PATH" ]
then
	echo "--- fish is already the default shell ---"
	exit 0
fi

if [ -x "$(command -v /usr/bin/chsh)" ]
then
	echo "--- chsh found ---"
	if cat /etc/shells | grep -q "$FISH_PATH" 
	then
		echo "--- fish found in /etc/shells ---"
	else
		echo "--- fish not found in /etc/shells ---"
		echo "--- adding fish to /etc/shells, asking for sudo ---"
		echo "$FISH_PATH" | sudo tee -a /etc/shells
	fi

	echo "--- setting fish to default shell, asking for sudo ---"
	chsh -s $FISH_PATH
	echo "--- this script will run chsh until linux is rebooted ---"
else
	echo "--- chsh not found ---"
	echo "--- install chsh with native pkg manager to set fish as default shell ---"
fi
