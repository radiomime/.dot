import getpass
import subprocess
from abc import ABC, abstractmethod

from .util import get_os


class Package(ABC):
    def __init__(self):
        self.os = get_os()
        self.user = getpass.getuser()
        self.path = "/usr/local/bin"

    def __del__(self):
        if self.is_installed():
            print(
                f"*** installed: {self.__class__.__name__}"
                f" version: {self.get_version()}"
            )
        else:
            print(f"*** not installed: {self.__class__.__name__}")

    @abstractmethod
    def is_installed(self):
        pass

    @abstractmethod
    def get_version(self):
        pass

    def install(self):
        print(f"\n*** attempt to install {self.__class__.__name__}")

        if self.is_installed():
            print(f"{self.__class__.__name__} is already installed")
            return

        if self.os == "linux":
            self.linux_install()
        elif self.os == "osx":
            self.osx_install()
        else:
            print("no install instructions for", self.os)

    def uninstall(self):
        print(f"\n*** attempt to uninstall {self.__class__.__name__}")
        if self.os == "linux":
            self.linux_uninstall()
        elif self.os == "osx":
            self.osx_uninstall()
        else:
            print("no uninstall instructions for", self.os)

    def linux_install(self):
        print(f"Linux install not defined for {self.__class__.__name__}")

    def osx_install(self):
        print(f"OSX install not defined for {self.__class__.__name__}")

    def linux_uninstall(self):
        print(f"Linux uninstall not defined for {self.__class__.__name__}")

    def osx_uninstall(self):
        print(f"OSX uninstall not defined for {self.__class__.__name__}")

    def install_pkg_from_tarball(self, address):
        tarball_out = "tmp.tar.gz"
        subprocess.run(
            [
                "curl",
                "-fsSL",
                address,
                "-o",
                tarball_out,
            ]
        )

        subprocess.run(
            [
                "sudo",
                "tar",
                "-xvzf",
                tarball_out,
                "--directory",
                self.path,
            ]
        )

        subprocess.run(
            [
                "rm",
                tarball_out,
            ]
        )

    def install_pkg_from_deb(self, address):
        deb_out = "tmp.deb"

        subprocess.run(
            [
                "curl",
                "-fsSL",
                address,
                "-o",
                deb_out,
            ]
        )

        subprocess.run(
            [
                "sudo",
                "dpkg",
                "-i",
                deb_out,
            ]
        )

        subprocess.run(
            [
                "rm",
                deb_out,
            ]
        )

    def install_binary_from_address(self, address, binary_name):
        subprocess.run(
            [
                "sudo",
                "curl",
                "-fsSL",
                address,
                "-o",
                f"{self.path}/{binary_name}",
            ]
        )
        subprocess.run(
            [
                "sudo",
                "chmod",
                "+x",
                f"{self.path}/{binary_name}",
            ]
        )

    def install_from_curled_script(self, address):
        curled_script = "curled_script.sh"

        subprocess.run(
            [
                "curl",
                "-fsSL",
                address,
                "-o",
                curled_script,
            ]
        )

        subprocess.run(
            [
                "sh",
                curled_script,
            ]
        )

        subprocess.run(
            [
                "rm",
                curled_script,
            ]
        )
