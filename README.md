[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# nixcfg

My personal Nix configurations to operate my infrastructure.

This configuration may be an inspirations for you, but I highly recommend you
to NOT copy this repo and try to use it as a base for your own use cases.
It reflects my personal requirements.

I'm not an expert in the Nix ecosystem. I did a lot of experiments, faced a
lot of errors, read a lot of the documentation and inspired myself with the
nix configurations from other people in the community.

This repo reflects my growing knowledge on Nix, so it may not be as elegant
as you expect. There is for sure a lot of space for improvements and it
will change over time as I learn more and have more practical experience.

If have a suggestion to improve something, feel free to open an
[issue](https://github.com/refnode/nixcfg/issues/new).

## The Layout

```bash
.
├── hosts                  # host specific configs in subdir per host
├── lib                    # high level nix functions used in this repo
├── modules                # reusable parts of nix config used in this repo
├── overlays               # customizations on existing nixpkgs used in this repo
├── packages               # my packages
├── templates              # templates as starting points
└── users                  # user's $HOME configs
```
