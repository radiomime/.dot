import subprocess

import requests

from .abs_package import Package
from .util import bin_loc, is_installed


class Kubectl(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("kubectl")

    def get_version(self):
        output = subprocess.check_output(
            [
                "kubectl",
                "version",
                "--client",
                "--short",
            ]
        )

        output = output.decode("utf-8")
        words = output.split()
        return words[2][1:]

    def linux_install(self):
        latest_release = requests.get(
            "".join(
                [
                    "https://storage.googleapis.com/",
                    "kubernetes-release/release/stable.txt",
                ]
            )
        ).text

        address = "".join(
            [
                "https://storage.googleapis.com/",
                "kubernetes-release/release/",
                latest_release,
                "/bin/linux/amd64/kubectl",
            ]
        )
        self.install_binary_from_address(
            address=address,
            binary_name="kubectl",
        )

    def linux_uninstall(self):
        kubectl_loc = bin_loc("kubectl")
        if kubectl_loc is not None:
            subprocess.run(
                [
                    "sudo",
                    "rm",
                    kubectl_loc,
                ]
            )
