import subprocess
from typing import List, Optional, Union

from .abs_package import Package
from .util import getSys, github_release_metadata, is_installed, pkgInstalled


class Brew(Package):
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
            "".join(
                [
                    "sudo",
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
        self.brew_update()
        self.brew_upgrade()

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


# class Brew:
#     def __init__(self):
#         self.os = getSys()
#         if self.os != "osx":
#             print("Homebrew not on osx? Hmm.")

#         if not pkgInstalled("brew"):
#             print("Homebrew doesn't seem to be installed.")

#     def update(self):
#         subprocess.run(
#             [
#                 "brew",
#                 "update",
#             ]
#         )

#     def upgrade(self):
#         subprocess.run(
#             [
#                 "brew",
#                 "upgrade",
#             ]
#         )

#     def install(self, pkgs):
#         if not isinstance(pkgs, list):
#             pkgs = [pkgs]

#         cmd = [
#             "brew",
#             "install",
#         ]
#         cmd.extend(pkgs)

#         print("installing:", pkgs)
#         subprocess.run(cmd)

#     def uninstall(self, pkgs):
#         if not isinstance(pkgs, list):
#             pkgs = [pkgs]

#         cmd = [
#             "brew",
#             "uninstall",
#         ]
#         cmd.extend(pkgs)

#         print("installing:", pkgs)
#         subprocess.run(cmd)
