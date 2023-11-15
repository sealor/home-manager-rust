{ config, pkgs, lib, ...}:

let
  createSymlink = localPath: config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/${localPath}";
in
{
  # required settings
  home.username = "stefan";
  home.homeDirectory = "/home/stefan";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    tmux
    rustup
  ];

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    bashrcExtra = builtins.readFile ./bashrc;
  };

  programs.neovim = {
    enable = true;

    defaultEditor = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file.".vimrc".source = createSymlink "vimrc";
  home.file."${config.xdg.configHome}/nvim".source = createSymlink "nvim";
}
