# https://github.com/ryanoasis/nerd-fonts
import subprocess

from .abs_package import AbsPackage


class Nerdfonts(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return False

    def get_version(self):
        return None

    def __install(self):
        # clone git repo
        self.get_git_project(
            address="https://github.com/ryanoasis/nerd-fonts.git",
            repo_dir_name="nerd-fonts",
            flags=[
                # "--quiet",
                "--depth",
                "1",
                # "--branch",
                # "feature/stable-codepoints",
            ],
        )

        subprocess.run(
            [
                f"{self.repo_store}/nerd-fonts/install.sh",
                # "--quiet",
                # "FiraCode",
                # "Meslo",
                # "CascadiaCode",
            ]
        )

    def linux_install(self):
        self.__install()

    def osx_install(self):
        self.__install()
