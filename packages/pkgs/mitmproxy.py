import subprocess

from .abs_package import AbsPackage
from .brew import Brew
from .pip import Pip
from .util import github_release_metadata, is_installed


class Mitmproxy(AbsPackage):
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

    def __pip_install(self):
        pip = Pip()
        pip.pip_install("mitmproxy")

    def linux_install(self):
        if self.distro == "raspbian":
            self.__pip_install()
            return

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

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="mitmproxy",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="mitmproxy",
        )