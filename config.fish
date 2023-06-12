set fish_greeting # Disable greeting
fish_add_path fish_add_path ~/.nix-profile/bin
bass source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
 
 
source ~/.asdf/asdf.fish
alias hm="home-manager "
alias hms="home-manager switch"
alias hme="cd ~/.config/home-manager/ && nvim && cd -"
alias manh="man 5 home-configuration.nix"
 
alias source_fish="source ~/.config/home-manager/config.fish"
