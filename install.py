#!/usr/bin/env python3
import argparse
import sys

# import lib.util as util
import lib.dot as dot

# import lib.docker as docker
from lib.docker import Docker
from lib.minikube import Minikube
from lib.kubectl import Kubectl
from lib.bat import Bat
from lib.go import Go
from lib.snap import Snap
from lib.poetry import Poetry
from lib.terraform import Terraform
from lib.node import Node
from lib.yarn import Yarn
from lib.mitmproxy import Mitmproxy
from lib.prereqs import Prereqs

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


def neovim():
    # install neovim
    # neo = dot.Neovim(util.getSys())
    neo = dot.Neovim()
    neo.createConfigDir()
    if not neo.checkInstall():
        print('Installing neovim')
        neo.installRequirements()
        neo.install()
        # neo.createConfigDir()
    else:
        print('Neovim is already installed')

    return neo

def pkgs():
    print('*** installing packages')

    # independent packages
    Mitmproxy().install()
    Bat().install()
    Go().install()
    Poetry().install()
    Terraform().install()
    Snap().install()
    Node().install()
    Yarn().install()

    # Docker and k8s. Order matters
    Docker().install()
    Minikube().install()
    Kubectl().install()

def prereqs():
    print('installing prereqs')
    Prereqs().install()

def install():
    # install neovim
    neo = neovim()

    # symlink dotfiles
    # dots = dot.Dotfiles(neo.getConfigDir())
    # dots.createSymlinks()

    # pkgs()


def uninstall():
    # Uninstall NeoVim
    # neo = dot.Neovim(util.getSys())
    print('*** not actually uninstalling neovim')
    print('uninstall neovim files?? still need to do')
    # neo.uninstall()

    # # remove symlinks to dotfiles
    # dots = dot.Dotfiles(neo.getConfigDir())
    # dots.removeSymlinks()

    # # uninstall packages
    # packages.Packages().uninstall()

def main(argv):
    print('Warn: Install scripts will run some install commands as sudo')

    # parse command line arguments
    parser = argparse.ArgumentParser()

    parser.add_argument("-v", "--verbose",
                        help="increase output verbosity",
                        required=False)

    parser.add_argument("-u", "--uninstall",
                        help="uninstall dotfiles",
                        action='store_true',
                        required=False)

    parser.add_argument("-p", "--prereqs",
                        help="install prerequisite packages",
                        action='store_true',
                        required=False)

    args = parser.parse_args()
    if args.prereqs:
        prereqs()
    elif args.uninstall:
        uninstall()
    else:
        install()


if __name__ == "__main__":
    main(sys.argv)
