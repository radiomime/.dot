#!/usr/bin/env python3
import subprocess
import time
from os.path import abspath, expanduser

from .abs_package import AbsPackage
from .apt import Apt
from .brew import Brew
from .pip import Pip
from .util import is_installed


class Neovim(AbsPackage):
    def __init__(self):
        super().__init__()

        # self.path = abspath(expanduser("."))
        self.install_path = "/tmp/dot-neovim-" + str(time.time_ns())

        if self.os == "osx" or self.os == "linux":
            configDir = abspath(expanduser("~/.config/nvim"))

            # print("Config for nvim at:", configDir)
            # subprocess.run(["mkdir", "-pv", configDir])

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
                "--branch",
                "release-0.6",
                "https://github.com/neovim/neovim",
                self.install_path,
            ]
        )
        print("WARNING: installing old neovim release for compatibility!!!")
        print("WARNING: installing old neovim release for compatibility!!!")
        print("WARNING: installing old neovim release for compatibility!!!")
        print("WARNING: installing old neovim release for compatibility!!!")
        print("WARNING: installing old neovim release for compatibility!!!")
        # TODO: fix the above when it makes sense

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

    def osx_dependencies(self):
        Brew().install()

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="neovim",
            # flags="--HEAD",
        )
        self.__install_providers()

    #         print("installing neovim for osx")
    #         print("TODO: Put the commands in comments into code")
    #
    #         # xcode needs to be installed
    #         subprocess.run(
    #             [
    #                 "xcode-select",
    #                 "--install",
    #             ]
    #         )
    #
    #         brew = Brew()
    #         brew.brew_install(
    #             pkgs=[
    #                 "ninja",
    #                 "libtool",
    #                 "automake",
    #                 "cmake",
    #                 "pkg-config",
    #                 "gettext",
    #             ],
    #         )
    #
    #         self.get_git_project(
    #             address="https://github.com/neovim/neovim",
    #             repo_dir_name="neovim",
    #             flags=["--branch", "release-0.5"],
    #             # flags=["--branch", "stable"],
    #         )
    #         # TODO: change back to stable!
    #
    #         subprocess.run(
    #             [
    #                 "make",
    #                 "--directory",
    #                 f"{self.repo_store}/neovim",
    #                 "CMAKE_BUILD_TYPE=Release",
    #             ]
    #         )
    #
    #         subprocess.run(
    #             [
    #                 # "sudo",
    #                 "make",
    #                 "--directory",
    #                 f"{self.repo_store}/neovim",
    #                 "install",
    #             ]
    #         )
    #

    # TODO: fix uninstall for neovim in osx!
    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="neovim",
        )

    #         print("osx uninstall is in a bad state for neovim!!!")
    #         subprocess.run(
    #             [
    #                 "rm",
    #                 "/usr/local/bin/nvim",
    #             ]
    #         )
    #
    #         subprocess.run(
    #             [
    #                 "rm",
    #                 "-rd",
    #                 "/usr/local/share/nvim",
    #             ]
    #         )

    def __install_providers(self):
        print("installing providers")

        pip = Pip()
        pip.pip_install("pynvim")
