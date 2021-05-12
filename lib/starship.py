import subprocess

from .abs_package import Package
from .util import bin_loc, github_release_metadata, is_installed


class Starship(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("starship")

    def get_version(self):
        output = subprocess.check_output(
            [
                "starship",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "starship:":
                return words[1]

        # should never be hit
        return None

    def linux_install(self):
        self.install_from_curled_script("https://starship.rs/install.sh")

    def linux_uninstall(self):
        starship_loc = bin_loc("starship")
        if starship_loc:
            subprocess.run(
                [
                    "sh",
                    "rm",
                    starship_loc,
                ]
            )
