{ config, pkgs, ... }:
{

  programs.tofi = {
    enable = true;
    settings = {
      anchor = "top";
      width = "100%";
      height = 20;
      horizontal = true;
      prompt-text = " run: ";
      min-input-width = 120;
      result-spacing = 15;
      padding-top = 0;
      padding-bottom = 0;
      padding-left = 0;
      padding-right = 0;
      border-width = 0;
      outline-width = 0;
    };
  };
}
