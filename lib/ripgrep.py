import subprocess

from .abs_package import Package
from .util import github_release_metadata, is_installed


class Ripgrep(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("rg")

    def get_version(self):
        output = subprocess.check_output(
            [
                "rg",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "ripgrep":
                return words[1]

        # should never be hit
        return None

    def linux_install(self):
        ripgrep_md = github_release_metadata("BurntSushi/ripgrep")
        ripgrep_latest_version = ripgrep_md["name"]

        deb = "".join(
            [
                "https://github.com/BurntSushi/ripgrep/releases/download/",
                ripgrep_latest_version,
                "/",
                "ripgrep_",
                ripgrep_latest_version[:],
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
                "ripgrep",
            ]
        )
