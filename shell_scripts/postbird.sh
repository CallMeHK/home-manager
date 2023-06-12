if [[ ! -d "$HOME/.postbird" ]]
then
  echo "--- postbird is not installed ---"
  echo "--- adding ~/.postbird directory ---"
  mkdir $HOME/.postbird
  echo "--- downloading postbird... ---"
  
else
  echo "--- postbird is already installed ---"
fi
