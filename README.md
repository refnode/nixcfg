![CI](https://github.com/refnode/nixcfg/workflows/CI/badge.svg)
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
├── users                  # user's $HOME configs
└── ci.nix                 # the nix develop env used during CI/CD runs
```

## MacBook Setup

The repo provides a nix-darwin configuration that embeds a home-manager
configuration. To bootstrap the configuration for the first time (after the
Nix Installer Run was performed) it's required to enter the target dir of this
flake and to execute the following command:

```bash
nix run nix-darwin -- switch --flake '.#'

```

After the first run if nix-darwin, the nix-darwin tools are direct accessible
with the terminal. For rebuilds after configuration changes it's only
to run

```bash
darwin-rebuild switch --flake $HOME/path/to/flake-dir
```

## CI/CD

For CI/CD workflows the repo provides a nix developer shell environment to
run custom checks as required. To execute the CI/CD dev shell, execute

```bash
nix develop '.#ci'
```

## Git pre-commit checks

The repository provides pre-configured git pre-commit checks.
To enable these checks you need call the nix developer shell one time as
show in the previous CI/CD example or non-interactive by calling an executable.

```bash
nix develop '.#ci' --command true
```

During regular commits, pre-commit only performs checks on file staged for
commit. To perform a pre-commit check on all file, execute

```bash
nix develop '.#ci' --command pre-commit run --all-files
```
