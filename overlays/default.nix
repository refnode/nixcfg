final: prev: {
  ref-rebuild = final.callPackage ../packages/ref-rebuild {};
  ref-sysupdate = final.callPackage ../packages/ref-sysupdate {};
  ref-main = final.callPackage ../packages/ref-main {};
}
