{ config, pkgs, lib, ...}:
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
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraConfig = builtins.readFile ./vimrc;
    extraLuaConfig = builtins.readFile ./vim.lua;
    plugins = with pkgs.vimPlugins; [
      vim-lastplace vim-nix vim-gitgutter

      lsp-zero-nvim mason-nvim nvim-cmp nvim-lspconfig mason-lspconfig-nvim cmp-nvim-lsp luasnip

      (nvim-treesitter.withPlugins(p: with p; [
        awk bash c diff dockerfile dot go gomod html java javascript json make markdown nix org python rust sql typescript terraform toml vue yaml
      ])) # faster than nvim-treesitter.withAllGrammars
    ];
  };
}
