import os
import subprocess

import distro

from .abs_package import Package
from .apt import Apt
from .util import github_release_metadata, is_installed


class Docker(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("docker")

    def get_version(self):
        output = subprocess.check_output(
            [
                "docker",
                "--version",
            ]
        )
        output = output.decode("utf-8")

        words = output.split(" ")
        if words[0] == "Docker":
            return " ".join(words[2:]).strip()

        # should never be hit
        return None

    def linux_install(self):
        # apt dependencies
        apt = Apt()
        apt.uninstall(
            [
                "docker",
                "docker-engine",
                "docker.io",
                "containerd",
                "runc",
            ]
        )

        apt.update()
        apt.install(
            [
                "apt-transport-https",
                "ca-certificates",
                "curl",
                "gnupg-agent",
                "software-properties-common",
            ]
        )

        # add official docker gpg key
        apt.add_gpg_key("https://download.docker.com/linux/ubuntu/gpg")

        apt.add_apt_repo(
            " ".join(
                [
                    "deb [arch=amd64]",
                    "https://download.docker.com/linux/ubuntu",
                    distro.linux_distribution()[2],
                    "stable",
                ]
            )
        )

        apt.install(
            [
                "docker-ce",
                "docker-ce-cli",
                "containerd.io",
            ]
        )

        # compose
        compose_version = github_release_metadata("docker/compose")["name"]

        address = "".join(
            [
                "https://github.com/docker/compose/releases/download/",
                compose_version,
                "/docker-compose-",
                os.uname().sysname,
                "-",
                os.uname().machine,
            ]
        )

        self.install_binary_from_address(address, "docker-compose")

        self.__add_user()

    def __add_user(self):
        subprocess.run(["sudo", "usermod", "-aG", "docker", self.user])

    def linux_uninstall(self):

        apt = Apt()
        apt.uninstall(
            [
                "docker-ce",
                "docker-ce-cli",
                "containerd.io",
            ]
        )

        subprocess.run(
            [
                "sudo",
                "rm",
                "-rf",
                "/var/lib/docker",
                "/var/lib/containerd",
            ]
        )

        # Compose
        subprocess.run(
            [
                "sudo",
                "rm",
                f"{self.path}/docker-compose",
            ]
        )
