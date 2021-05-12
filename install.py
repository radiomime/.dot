#!/usr/bin/env python3
import argparse
import sys

# import lib
from lib import (Bat, Docker, Dot, Fish, Kitty, Mitmproxy, Neovim, Ripgrep,
                 Starship, Tldr)

# from lib.docker import Docker
# from lib.dot import Dot
# from lib.go import Go
# from lib.kitty import Kitty
# from lib.kubectl import Kubectl
# from lib.minikube import Minikube
# from lib.mitmproxy import Mitmproxy
# from lib.neovim import Neovim
# from lib.node import Node
# from lib.poetry import Poetry
# from lib.ripgrep import Ripgrep
# from lib.snap import Snap
# from lib.swiftformat import SwiftFormat
# from lib.terraform import Terraform
# from lib.yarn import Yarn


def install():
    print("*** installing neovim and dotfiles")
    Neovim().install()
    Dot().install()

    print("*** installing packages")
    Mitmproxy().install()
    Bat().install()
    Ripgrep().install()
    Kitty().install()
    Fish().install()
    Tldr().install()
    Starship().install()

    # Go().install()
    # Poetry().install()
    # Terraform().install()
    # Snap().install()
    # Node().install()
    # Yarn().install()
    # SwiftFormat().install()

    # # Docker and k8s. Order matters
    Docker().install()

    # Minikube().install()
    # Kubectl().install()


def uninstall():
    print("uninstalling things")
    Dot().uninstall()

    Mitmproxy().uninstall()
    Bat().uninstall()
    Ripgrep().uninstall()
    Kitty().uninstall()
    Fish().uninstall()
    Tldr().uninstall()
    Starship().uninstall()

    # Below are weird to un/reinstall. Good opportunity for an upgrade
    # Neovim().uninstall()
    # Docker().uninstall()

    # print("*** Warn: Package uninstalls are not currently supported")
    # uninstall packages
    # packages.Packages().uninstall()


def main(argv):
    print("Warn: Install scripts will run some install commands as sudo")

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

    args = parser.parse_args()
    if args.uninstall:
        uninstall()
    elif args.dry:
        print("exiting without running anything")
        exit()
    else:
        install()


if __name__ == "__main__":
    main(sys.argv)
