import getpass
import subprocess
from abc import ABC, abstractmethod
from typing import List, Optional

from os.path import abspath
from pathlib import Path

from .util import get_architecture, get_distro, get_distro_codename, get_os, create_dir


class AbsPackage(ABC):
    def __init__(self):
        self.os = get_os()
        self.architecture = get_architecture()
        self.distro = get_distro()
        self.distro_codename = get_distro_codename()
        self.user = getpass.getuser()
        self.path = "/usr/local/bin"

        # TODO: is there a better spot for this?
        self.repo_store = abspath("./.repos")

        # create necessary directories
        create_dir(self.repo_store)

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
            self.linux_dependencies()
            self.linux_install()
        elif self.os == "osx":
            self.osx_dependencies()
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

    def linux_dependencies(self):
        pass

    def osx_dependencies(self):
        pass

    def linux_uninstall(self):
        print(f"Linux uninstall not defined for {self.__class__.__name__}")

    def osx_uninstall(self):
        print(f"OSX uninstall not defined for {self.__class__.__name__}")

    def sysinfo(self):
        print(self.os)
        print(self.architecture)
        print(self.distro)
        print(self.distro_codename)
        print(self.user)
        print(self.path)
        print(self.repo_store)

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

    def install_binary_from_address(
        self,
        address: str,
        binary_name: str,
    ) -> None:
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

    def install_from_curled_script(
        self,
        address: str,
        run_as_sudo: bool = False,
    ) -> None:
        curled_script = "curled_script.sh"

        # get script
        subprocess.run(
            [
                "curl",
                "-fsSL",
                address,
                "-o",
                curled_script,
            ]
        )

        # prepend with sudo if necessary
        cmd = []
        if run_as_sudo:
            cmd.extend(["sudo"])

        # execute script with sh
        cmd.extend(
            [
                "sh",
                curled_script,
            ]
        )
        subprocess.run(cmd)

        # clean script location
        subprocess.run(
            [
                "rm",
                curled_script,
            ]
        )

    def run_from_curled_python_script(
        self,
        address: str,
        args: List[str] = [],
    ) -> None:
        curled_script = "curled_script.py"

        subprocess.run(
            [
                "curl",
                "-fsSL",
                address,
                "-o",
                curled_script,
            ]
        )

        cmd = [
            "python3",
            curled_script,
        ]
        cmd.extend(args)
        subprocess.run(cmd)

        subprocess.run(
            [
                "rm",
                curled_script,
            ]
        )

    def install_binary_from_zip(
        self,
        address: str,
    ) -> None:
        zip_out = "tmp.zip"
        subprocess.run(
            [
                "curl",
                "-fsSL",
                address,
                "-o",
                zip_out,
            ]
        )

        subprocess.run(
            [
                "sudo",
                "unzip",
                zip_out,
                "-d",
                self.path,
            ]
        )

        subprocess.run(
            [
                "rm",
                zip_out,
            ]
        )

    def get_git_project(
        self,
        address: str,
        repo_dir_name: str,
        flags: Optional[List[str]] = None,
    ) -> None:
        local_repo_loc = f"{self.repo_store}/{repo_dir_name}"
        cmd = ["git"]
        if Path(local_repo_loc).exists():
            cmd.extend(["-C", local_repo_loc, "pull"])
        else:
            cmd.extend(["clone"])

            # add flags to command if they exist
            if isinstance(flags, list):
                cmd.extend(flags)

            cmd.append(address)
            cmd.append(local_repo_loc)

        # print(f"running git clone {cmd}")
        subprocess.run(cmd)
