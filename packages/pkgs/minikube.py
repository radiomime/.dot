import subprocess
from .brew import Brew

from .abs_package import AbsPackage
from .util import is_installed


class Minikube(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("minikube")

    def get_version(self):
        output = subprocess.check_output(
            [
                "minikube",
                "version",
            ]
        )

        output = output.decode("utf-8")
        words = output.split()
        return words[2][1:]

    def linux_install(self):
        minikube_address = "".join(
            [
                "https://storage.googleapis.com/",
                "minikube/releases/latest/",
                "minikube_latest_amd64.deb",
            ]
        )

        self.install_pkg_from_deb(minikube_address)

    def linux_uninstall(self):
        subprocess.run(
            [
                "sudo",
                "dpkg",
                "--remove",
                "minikube",
            ]
        )

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="minikube",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="minikube",
            # flags='--cask',
        )
