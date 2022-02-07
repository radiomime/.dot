import subprocess
from typing import List, Optional, Union

from .abs_package import AbsPackage


class Pip(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        output = subprocess.check_output(
            [
                "python3",
                "-m",
                "pip",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        return "No module named" not in output

    def get_version(self):
        output = subprocess.check_output(
            [
                "python3",
                "-m",
                "pip",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "pip":
                return words[1]

        # should never be hit
        return None

    def pip_install(
        self,
        pkgs: Union[List[str], str],
    ):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: pip is not installed, cannot install: {pkgs}")
            return

        cmd = [
            "python3",
            "-m",
            "pip",
            "install",
            "--user",
            "--upgrade",
        ]
        cmd.extend(pkgs)

        print(f"running pip install: {cmd}")
        subprocess.run(cmd)

    def pip_uninstall(
        self,
        pkgs: Union[List[str], str],
    ):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        if not self.is_installed():
            print(f"ERROR: pip is not installed, cannot uninstall: {pkgs}")
            return

        cmd = [
            "python3",
            "-m",
            "pip",
            "uninstall",
            "--user",
        ]
        cmd.extend(pkgs)

        print(f"running pip uninstall: {cmd}")
        subprocess.run(cmd)
