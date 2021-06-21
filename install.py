#!/usr/bin/env python3
import argparse

from lib import (Bandwhich, Bat, Brew, Docker, Dot, Exa, Fish, Go, Hammerspoon,
                 Kitty, Kubectl, Minikube, Mitmproxy, Neovim, Nerdfonts, Node,
                 Poetry, Pyright, Ripgrep, Rust, Snap, Starship, Terraform,
                 Tldr, Tmux, Watchexec, Yarn)


def install():
    print("*** installing neovim and dotfiles")
    Brew().install()
    Neovim().install()
    Dot().install()

    # print("*** installing packages")
    Mitmproxy().install()
    Nerdfonts().install()
    Bat().install()
    Pyright().install()
    Bandwhich().install()
    Tmux().install()
    Hammerspoon().install()
    Exa().install()
    Rust().install()
    Ripgrep().install()
    Kitty().install()
    Fish().install()
    Tldr().install()
    Starship().install()

    Snap().install()
    Go().install()
    Poetry().install()
    Terraform().install()
    Node().install()
    Yarn().install()
    # Watchexec().install()
    # # SwiftFormat().install()

    # # # Docker and k8s. Order matters.
    # # TODO: minikube should install docker, etc
    Docker().install()

    # Minikube().install()
    # Kubectl().install()


def uninstall():
    Brew().uninstall()
    # print("uninstalling things")
    # Dot().uninstall()

    Mitmproxy().uninstall()
    Go().uninstall()
    # Nerdfonts().uninstall()
    Bandwhich().uninstall()
    Tmux().uninstall()
    Hammerspoon().uninstall()
    Bat().uninstall()
    Pyright().uninstall()
    Exa().uninstall()
    # Rust().uninstall()
    Ripgrep().uninstall()
    Kitty().uninstall()
    Fish().uninstall()
    Tldr().uninstall()
    Starship().uninstall()
    Snap().uninstall()
    Poetry().uninstall()
    Terraform().uninstall()
    Node().uninstall()
    Yarn().uninstall()
    # Minikube().uninstall()
    # Kubectl().uninstall()
    # Watchexec().uninstall()

    # Below are weird to un/reinstall. Good opportunity for an upgrade
    Neovim().uninstall()
    # Docker().uninstall()


def process_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-v", "--verbose", help="increase output verbosity", required=False
    )

    parser.add_argument(
        "-u",
        "--uninstall",
        help="uninstall dotfiles",
        action="store_true",
        required=False,
    )

    parser.add_argument(
        "-d",
        "--dry",
        help="dry run: useful for seeing checking base errors",
        action="store_true",
        required=False,
    )

    parser.add_argument(
        "-a",
        "--add",
        help="add a package or app if supported",
        nargs="+",
        default=None,
    )

    parser.add_argument(
        "-r",
        "--remove",
        help="remove a package or app if supported",
        nargs="+",
        default=None,
    )
    return parser.parse_args()


def main():
    print("WARN: Install scripts will run some install commands as sudo")
    args = process_args()

    if args.add:
        print(args.add)
    elif args.remove:
        print(args.remove)
    elif args.uninstall:
        uninstall()
    elif args.dry:
        print("exiting without running anything")
        exit()
    else:
        install()


if __name__ == "__main__":
    main()
