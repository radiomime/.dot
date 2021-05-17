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

    def linux_install(self):
        subprocess.run(
            [
                "git",
                "clone",
                "--quiet",
                "--depth",
                "1",
                "https://github.com/ryanoasis/nerd-fonts.git",
                "nerd-fonts",
            ]
        )

        subprocess.run(
            [
                "./nerd-fonts/install.sh",
                "Meslo",
            ]
        )

        subprocess.run(
            [
                "rm",
                "-rf",
                "nerd-fonts",
            ]
        )
