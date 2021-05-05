#!/usr/bin/env python3
import argparse
import sys

from lib.bat import Bat
from lib.docker import Docker
from lib.dot import Dot
from lib.go import Go
from lib.kitty import Kitty
from lib.kubectl import Kubectl
from lib.minikube import Minikube
from lib.mitmproxy import Mitmproxy
from lib.neovim import Neovim
from lib.node import Node
from lib.poetry import Poetry
from lib.prereqs import Prereqs
from lib.ripgrep import Ripgrep
from lib.snap import Snap
from lib.swiftformat import SwiftFormat
from lib.terraform import Terraform
from lib.yarn import Yarn

# from lib.apt import Apt
# from lib.docker import Docker
# import lib.packages as packages
# import lib.packages as packages
# from os.path import expanduser
# from os.path import abspath
# import time
# import subprocess
# import os
# from sys import platform


def prereqs():
    # Should this be here? Not sure. Python is already needed, but maybe
    # some python upgrade or something?
    # TODO: revisit this when reflashing mac at some point
    print("prerequisite install is not supported yet")
    Prereqs().install()


def install():
    print("*** installing neovim and dotfiles")
    Neovim().install()
    Dot().install()

    print("*** installing packages")
    # # independent packages
    # Mitmproxy().install()
    # Bat().install()
    # Ripgrep().install()
    # Go().install()
    # Poetry().install()
    # Terraform().install()
    # Snap().install()
    # Node().install()
    # Yarn().install()
    # SwiftFormat().install()
    Kitty().install()

    # Docker and k8s. Order matters
    # Docker().install()
    # Minikube().install()
    # Kubectl().install()


def uninstall():
    # Neovim().uninstall()
    # Dot().uninstall()

    print("*** Warn: Package uninstalls are not currently supported")
    # # uninstall packages
    # packages.Packages().uninstall()

    Kitty().uninstall()


def main(argv):
    print("Warn: Install scripts will run some install commands as sudo")

    # parse command line arguments
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
        "-p",
        "--prereqs",
        help="install prerequisite packages",
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
    if args.prereqs:
        prereqs()
    elif args.uninstall:
        uninstall()
    elif args.dry:
        print("exiting without running anything")
        exit()
    else:
        install()


if __name__ == "__main__":
    main(sys.argv)
