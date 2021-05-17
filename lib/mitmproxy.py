import subprocess

from .abs_package import Package
from .util import github_release_metadata, is_installed


class Mitmproxy(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("mitmproxy")

    def get_version(self):
        output = subprocess.check_output(
            [
                "mitmproxy",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "Mitmproxy:":
                return words[1]

        # should never be hit
        return None

    def linux_install(self):
        mitm_md = github_release_metadata("mitmproxy/mitmproxy")
        mitm_latest_version = mitm_md["tag_name"][1:]

        mitm_tarball_address = "".join(
            [
                "https://snapshots.mitmproxy.org/",
                mitm_latest_version,
                "/mitmproxy-",
                mitm_latest_version,
                "-linux.tar.gz",
            ]
        )

        self.install_pkg_from_tarball(mitm_tarball_address)

    def linux_uninstall(self):
        subprocess.run(
            [
                "sudo",
                "rm",
                "-f",
                f"{self.path}/mitmweb",
                f"{self.path}/mitmproxy",
                f"{self.path}/mitmdump",
            ]
        )
        print("note: not removing ~/.mitmproxy directory")
