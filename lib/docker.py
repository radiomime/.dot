import os
from .brew import Brew
import subprocess

import distro
import threading

from .abs_package import Package
from .apt import Apt
from .util import github_release_metadata, is_installed


class Docker(Package):
    def __init__(self):
        super().__init__()
        what = 2

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
            return " ".join(words[3:]).strip()

        # should never be hit
        return None

    def __linux_apt_dependencies(self) -> None:
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

    def __linux_add_apt_key(self) -> None:
        apt = Apt()

        if self.distro == "pop" or self.distro == "ubuntu":
            apt.add_gpg_key("https://download.docker.com/linux/ubuntu/gpg")
        else:
            print(f"Error: unknown distribution: {self.distro}")

    def __linux_add_apt_repo(self) -> None:
        apt = Apt()
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

    def __convenience_script_install(self):
        self.install_from_curled_script("https://get.docker.com")

    def linux_install(self):
        if self.distro == "raspbian":
            self.__convenience_script_install()
        else:
            self.__linux_apt_dependencies()
            self.__linux_add_apt_key()
            self.__linux_add_apt_repo()

            apt = Apt()
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
        print("Log out and log back in to run `docker` commands without sudo")

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

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="docker",
            flags="--cask",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="docker",
            # flags='--cask',
        )
