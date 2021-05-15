import subprocess

from .abs_package import Package
from .snap import Snap
from .util import github_release_metadata, is_installed


class Bpytop(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("bpytop")

    def get_version(self):
        output = subprocess.check_output(
            [
                "bpytop",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "bpytop":
                return words[2]

        # should never be hit
        return None

    def linux_install(self):
        snap = Snap()
        snap.snap_install("bpytop")

    def linux_uninstall(self):
        snap = Snap()
        snap.snap_uninstall("bpytop")
