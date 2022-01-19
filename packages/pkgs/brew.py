import subprocess
from typing import List, Optional, Union

from .abs_package import AbsPackage
from .util import is_installed


class Brew(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("brew")

    def get_version(self):
        output = subprocess.check_output(
            [
                "brew",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "Homebrew":
                return words[1]

        # should never be hit
        return None

    def osx_install(self):
        # TODO: make sure this runs with bash!!!
        # TODO: zsh gives errors

        self.install_from_curled_script(
            "".join(
                [
                    "https://raw.githubusercontent.com/",
                    "Homebrew/install/HEAD/install.sh",
                ]
            )
        )

    def osx_uninstall(self):
        self.install_from_curled_script(
            address="".join(
                [
                    "https://raw.githubusercontent.com/",
                    "Homebrew/install/HEAD/uninstall.sh",
                ]
            )
        )

    def brew_update(
        self,
        pkgs: Union[List[str], str] = [],
    ):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: brew is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "brew",
            "update",
        ]

        if pkgs.__len__() > 0:
            cmd.extend(pkgs)
        # cmd.extend(pkgs)

        print(f"brew updating {pkgs}")
        subprocess.run(cmd)

    def brew_link(
        self,
        pkgs: Union[List[str], str],
    ):
        self.brew_update()
        self.brew_upgrade()

        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: brew is not installed, cannot link: {pkgs}")
            return

        cmd = [
            "brew",
            "link",
        ]
        cmd.extend(pkgs)

        print(f"running brew link: {cmd}")
        subprocess.run(cmd)

    def brew_upgrade(
        self,
        pkgs: Union[List[str], str] = [],
    ):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: brew is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "brew",
            "upgrade",
        ]

        if pkgs.__len__() > 0:
            cmd.extend(pkgs)
        # cmd.extend(pkgs)

        print(f"brew upgrading {pkgs}")
        subprocess.run(cmd)

    def brew_install(
        self,
        pkgs: Union[List[str], str],
        flags: Optional[Union[List[str], str]] = None,
    ):
        self.brew_update()
        self.brew_upgrade()

        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: brew is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "brew",
            "install",
        ]
        cmd.extend(pkgs)

        # add flags to command if they exist
        if isinstance(flags, list) or isinstance(flags, str):
            if isinstance(flags, str):
                flags = [flags]

            cmd.extend(flags)

        print(f"running brew install {cmd}")
        subprocess.run(cmd)

    def brew_uninstall(self, pkgs: Union[list, str]):
        # self.brew_update()
        # self.brew_upgrade()

        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: brew is not installed, cannot uninstall: {pkgs}")
            return

        cmd = [
            "brew",
            "uninstall",
        ]
        cmd.extend(pkgs)

        print(f"brew uninstalling {pkgs}")
        subprocess.run(cmd)
