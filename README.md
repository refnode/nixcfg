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

## Getting started

### Install Nix

There are two ways to install Nix on your system. The way the Nix project
explains it on the [Nix Download page](https://nixos.org/download/), and the
[Determinate Systems Nix Installer](https://github.com/DeterminateSystems/nix-installer).

Both ways are fine, but I prefer the Determinate Systems Nix Installer which
is written Rust and in my opinion gives you a bit more control through the
installation process.

To install Nix on your target system (without relying on the installer shell
script), perform the following steps:

```bash
# Download the installer for your CPU Arch/OS from the
# [release page](https://github.com/DeterminateSystems/nix-installer/releases)

# Rename the downloaded binary to `nix-installer` and move it to $HOME/bin
# (just for the readme consistency)

# Make the installer binay executable
chmod 0755 ~/bin/nix-installer

# On macOs remove the quarantine flag if need
xattr -d com.apple.quarantine ~/bin/nix-installer

# Install Nix on your target system and if needed, you can directly pass
# extra config parameters with --extra-conf. These extra conf parameters get
# joined together into the config file /etc/nix/nix.conf.
# A typical use case is the binary cache in restricted environments

# Install Nix without extra conf
~/bin/nix-installer install

# Install Nix with a substituters extra conf
~/bin/nix-installer install --extra-conf 'substituters = http://cache.example.com/'
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

## Development

### Nix Developer Shell

This repo defines a nix shell environment with the tools required to perform
changes to the repo. All needed is a working Nix installation.

To enter the nix shell, cd into the nix repo and then execute the default
shell as defined in `shell.nix`.

```bash
nix develop
```

### Automate using the Nix Developer Shell

To automate using the Nix Developer Shell, [direnv](https://direnv.net) is
recommended. Nix provides a great integration for the used shell and direnv
in the Home Manager project. To let direnv know that it should use the
shell definition provided by this Flake, the `.envrc` file is needed with
the content `use flake`.

### Git pre-commit checks

Git pre-commit checks uses the [Git Hooks Mechanism](https://git-scm.com/book/ms/v2/Customizing-Git-Git-Hooks)
to call an executable before committing changes to you local git repository.

This enables you to define some checks you like to perform, eg. to prevent you
committing secrets, malformed source code or other stuff you don't like to see
in the repo.

As a lot of checks are probably similar for many developers, the project
[pre-commit.com](https://pre-commit.com) provides a flexible tooling to declare
and integrate checks for this Git Hook.

The Nix Developer Shell in this repo integrates the pre-commit.com tooling and
uses activate some checks for the pre-commit stage.

It's automatically activated entering the nix shell the first time and can be
manual prepared performing a command in the nix shell.

```bash
# Executing a command in the subshell to trigger the pre-commit shell activation
nix develop --command true
```

During regular commits, pre-commit only performs checks on file staged for
commit. A check on all files in the repo can be executed with the followin
command:

```bash
nix develop --command pre-commit run --all-files
```

### CI/CD

The nix shell is quite useful for regular development tasks. It becomes more
useful when it is used with CI/CD workflows. In contrast to the almost
interactive nix shell usage during development task, during a CI/CD workflow
you need to call tools non-interactive inside the nix shell. This is done
with the `--command` flag, given the tool you want to execute in the shell.

```bash
nix develop --command some-custom-check
```
