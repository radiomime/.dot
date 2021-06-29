# https://github.com/ryanoasis/nerd-fonts
import subprocess

from .abs_package import Package

# from .util import github_release_metadata, is_installed


class Nerdfonts(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return False

    def get_version(self):
        return None

    def __clone_repo(self) -> None:
        print("CLONE TO A CONFIG DIRECTORY")
        self.get_git_project(
            address="https://github.com/ryanoasis/nerd-fonts.git",
            repo_dir_name="nerd-fonts",
            flags=[
                # "--quiet",
                "--depth",
                "1",
            ],
        )

    def __install(self):
        self.__clone_repo()

        # subprocess.run(
        #     [
        #         "git",
        #         "clone",
        #         "--quiet",
        #         "--depth",
        #         "1",
        #         "https://github.com/ryanoasis/nerd-fonts.git",
        #         "nerd-fonts",
        #     ]
        # )

        # subprocess.run(
        #     [
        #         "./nerd-fonts/install.sh",
        #         "Meslo",
        #     ]
        # )

        # subprocess.run(
        #     [
        #         "./nerd-fonts/install.sh",
        #         "FiraCode",
        #     ]
        # )

        # subprocess.run(
        #     [
        #         "rm",
        #         "-rf",
        #         "nerd-fonts",
        #     ]
        # )

    def linux_install(self):
        self.__install()

    def osx_install(self):
        self.__install()
