{
  writeShellApplication,
  pkgs,
}:
# Need to be careful with the script to not accidentially delete mails.
# For more infos read issue https://github.com/neomutt/neomutt/issues/1515
writeShellApplication {
  name = "ref-mail-cd";

  runtimeInputs = [pkgs.coreutils pkgs.gnused pkgs.fzf];

  text = ''
    folder=$(\
      sed -e '/^#.*/d' "$HOME/.config/neomutt/private-mailboxes" \
      | sed -e 's/^.*=//' \
      | fzf)

    echo "push '<change-folder>=$folder<enter>'"
  '';
}
