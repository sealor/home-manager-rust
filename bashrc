. ~/.nix-profile/etc/profile.d/hm-session-vars.sh

# load bash completions for installed packages
for FILE in ~/.nix-profile/share/bash-completion/completions/*; do
  . $FILE
done
