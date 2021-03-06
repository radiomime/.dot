import subprocess

from .abs_package import Package
from .util import is_installed


class Minikube(Package):
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
