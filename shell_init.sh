if [ -z "$1" ]; then
  echo "Usage: $0 <profile-name>"
else 
  PROFILE=$1

  export PATH=$PATH:/nix/var/nix/profiles/default/bin/
  export NIXPKGS_ALLOW_UNFREE=1

  nix run home-manager/release-23.11 switch -- switch --impure --flake .#${PROFILE}

  export PATH=$HOME/.nix-profile/bin:$PATH

fi

