{ ... }: {
  home.file = {
    ".ssh/authorized_keys".source = ../dotfiles/authorized_keys;
  };
}
