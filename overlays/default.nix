final: prev: {
  ref-rebuild = final.callPackage ../packages/ref-rebuild {};
  ref-sysupdate = final.callPackage ../packages/ref-sysupdate {};
  ref-ykey-check = final.callPackage ../packages/ref-ykey-check {};
  ref-main = final.callPackage ../packages/ref-main {};
  ref-mail = final.callPackage ../packages/ref-mail {};
  ref-mail-sync = final.callPackage ../packages/ref-mail-sync {};
  ref-mail-cd = final.callPackage ../packages/ref-mail-cd {};
  ref-mail-cdv = final.callPackage ../packages/ref-mail-cdv {};
  ref-irc = final.callPackage ../packages/ref-irc {};
}
