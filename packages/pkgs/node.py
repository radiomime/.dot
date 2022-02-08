import subprocess

from .abs_package import AbsPackage
from .apt import Apt
from .brew import Brew
from .util import is_installed


class Node(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("node")

    def get_version(self):
        output = subprocess.check_output(
            [
                "node",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        return output[1:].strip()

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="node",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="node",
        )

    def linux_install(self):
        installSource = "https://deb.nodesource.com/setup_current.x"
        self.install_from_curled_script(
            address=installSource,
            run_as_sudo=True,
        )

        apt = Apt()
        apt.update()
        apt.install(["nodejs"])

    def linux_uninstall(self):
        apt = Apt()
        apt.update()
        apt.uninstall(["nodejs"])

    def node_install(self, pkgs):
        if not self.is_installed:
            print("Node is not installed")
            return
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "sudo",
            "npm",
            "install",
            "-g",
        ]
        cmd.extend(pkgs)

        print("installing:", pkgs)
        subprocess.run(cmd)

    def node_uninstall(self, pkgs):
        if not self.is_installed:
            print("Node is not installed")
            return

        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "sudo",
            "npm",
            "uninstall",
            "-g",
        ]
        cmd.extend(pkgs)

        print("uninstalling:", pkgs)
        subprocess.run(cmd)
