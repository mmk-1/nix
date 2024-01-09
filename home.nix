{ config, pkgs, ... }:

{
  home.username = "mmk";
  home.homeDirectory = "/home/mmk";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  # home.packages = [
    # pkgs.neovim
    # pkgs.zellij
  # ];

  # programs.neovim = {
  #   enable = true;
  #   # extraPackages = with pkgs; lib.attrsets.mapAttrsToList (name: value: pkgs.lib.getAttr value pkgs) (builtins.fromJSON (builtins.readFile ./config/nvim/lsp_servers.json));
  # };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
