import subprocess

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
                    "https://raw.githubusercontent.com/",
                    "Homebrew/install/HEAD/uninstall.sh",
                ]
            )
        )


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
