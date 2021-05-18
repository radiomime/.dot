#!/usr/bin/env python3
import subprocess
import time
from os.path import abspath, expanduser

from lib.util import getSys, pkgInstalled

from .abs_package import Package
from .apt import Apt
from .brew import Brew
from .pip import Pip
from .util import github_release_metadata, is_installed


class Neovim(Package):
    def __init__(self):
        super().__init__()

        # self.path = abspath(expanduser("."))
        self.install_path = "/tmp/dot-neovim-" + str(time.time_ns())

        if self.os == "osx" or self.os == "linux":
            configDir = abspath(expanduser("~/.config/nvim"))

            print("Config for nvim at:", configDir)
            subprocess.run(["mkdir", "-pv", configDir])

    def is_installed(self):
        return is_installed("nvim")

    def get_version(self):
        output = subprocess.check_output(
            [
                "nvim",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "NVIM":
                return words[1]

        # should never be hit
        return None

    # def install(self):
    #     # if pkgInstalled("nvim"):
    #     #     print("Neovim is already installed")
    #     #     return

    #     # if self.os == "linux":
    #     #     self.__linuxInstall()
    #     # elif self.os == "osx":
    #     #     self.__osxInstall()
    #     # else:
    #     #     print("no install instructions for", self.os)
    #     #     return

    #     # if pkgInstalled("nvim"):
    #     #     print("Installing providers for neovim")
    #     #     self.__install_providers()

    def linux_install(self):
        print("Installing neovim dependencies")
        apt = Apt()

        apt.update()
        apt.install(
            [
                "ninja-build",
                "gettext",
                "libtool",
                "libtool-bin",
                "autoconf",
                "automake",
                "cmake",
                "g++",
                "xclip",
                "pkg-config",
                "unzip",
            ]
        )

        print("Cloning neovim directory")
        subprocess.run(
            [
                "git",
                "clone",
                "https://github.com/neovim/neovim",
                self.install_path,
            ]
        )

        print("Making neovim")
        subprocess.run(
            [
                "make",
                "--directory",
                self.install_path,
                "CMAKE_BUILD_TYPE=Release",
            ]
        )

        print("Installing neovim")
        subprocess.run(
            [
                "sudo",
                "make",
                "--directory",
                self.install_path,
                "install",
            ]
        )

        print("Installing pip")
        apt.install("python3-pip")
        self.__install_providers()

    def linux_uninstall(self):
        print("Uninstalling nvim binary")
        subprocess.run(
            [
                "sudo",
                "rm",
                "/usr/local/bin/nvim",
            ]
        )

        print("Uninstalling nvim local share")
        subprocess.run(
            [
                "sudo",
                "rm",
                "-rf",
                "/usr/local/share/nvim",
            ]
        )

    def osx_install(self):
        print("installing neovim for osx")
        brew = Brew()

        brew.brew_install(
            pkgs="luajit",
            flags="--HEAD",
        )

        brew.brew_install(
            pkgs="neovim",
            flags="--HEAD",
        )
        # brew install --HEAD luajit
        # brew install --HEAD neovim
        # brew.install('neovim')
        # brew.brew_install(
        #     [
        #         "ninja",
        #         "libtool",
        #         "automake",
        #         "cmake",
        #         "pkg-config",
        #         "gettext",
        #     ]
        # )

        # print("Cloning neovim directory")
        # subprocess.run(
        #     [
        #         "git",
        #         "clone",
        #         "https://github.com/neovim/neovim",
        #         self.install_path,
        #     ]
        # )

        # print("Making neovim")
        # subprocess.run(
        #     [
        #         "make",
        #         "--directory",
        #         self.install_path,
        #         "CMAKE_BUILD_TYPE=Release",
        #     ]
        # )

        # print("Installing neovim")
        # subprocess.run(
        #     [
        #         "sudo",
        #         "make",
        #         "--directory",
        #         self.install_path,
        #         "install",
        #     ]
        # )

        self.__install_providers()

    def osx_uninstall(self):
        brew = Brew()

        brew.brew_uninstall(
            pkgs="luajit",
        )

        brew.brew_uninstall(
            pkgs="neovim",
        )

        brew.brew_link(pkgs="neovim")
        # print("Uninstalling nvim binary")
        # subprocess.run(
        #     [
        #         "sudo",
        #         "rm",
        #         "/usr/local/bin/nvim",
        #     ]
        # )

        # print("Uninstalling nvim local share")
        # subprocess.run(
        #     [
        #         "sudo",
        #         "rm",
        #         "-rf",
        #         "/usr/local/share/nvim",
        #     ]
        # )

    def __install_providers(self):
        print("installing providers")

        pip = Pip()
        pip.pip_install("pynvim")
