{ config, pkgs, ... }:

{
  home.username = "mmk";
  home.homeDirectory = "/home/mmk";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # pkgs.neovim
    # pkgs.zellij

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # programs.neovim = {
  #   enable = true;
  #   extraPackages = with pkgs; lib.attrsets.mapAttrsToList (name: value: pkgs.lib.getAttr value pkgs) (builtins.fromJSON (builtins.readFile ./config/nvim/lsp_servers.json));
  # };


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".config/nvim".source = ./config/nvim;
    # ".config/zellij".source = ./config/zellij;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
