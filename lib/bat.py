import subprocess

from .abs_package import Package
from .util import github_release_metadata, is_installed


class Bat(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("bat")

    def get_version(self):
        output = subprocess.check_output(
            [
                "bat",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        words = output.split(" ")
        if words[0] == "bat":
            return words[1]

        # should never be hit
        return None

    def linux_install(self):
        bat_md = github_release_metadata("sharkdp/bat")
        bat_latest_version = bat_md["name"]

        deb = "".join(
            [
                "https://github.com/sharkdp/bat/releases/download/",
                bat_latest_version,
                "/",
                "bat_",
                bat_latest_version[1:],
                "_amd64.deb",
            ]
        )
        self.install_pkg_from_deb(deb)

    def linux_uninstall(self):
        subprocess.run(
            [
                "sudo",
                "dpkg",
                "--remove",
                "bat",
            ]
        )
