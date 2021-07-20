#!/usr/bin/env python3
import subprocess

from .abs_package import Package
from .apt import Apt
from .util import is_installed


class Poetry(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("poetry")

    def get_version(self):
        output = subprocess.check_output(
            [
                "poetry",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "Poetry":
                return words[2]

        # should never be hit
        return None

    def linux_install(self):
        apt = Apt()
        apt.install("python3-venv")

        self.run_from_curled_python_script(
            address="".join(
                [
                    "https://raw.githubusercontent.com/",
                    "python-poetry/poetry/master/get-poetry.py",
                ]
            ),
            args=["-y"],
        )

    def linux_uninstall(self):
        self.run_from_curled_python_script(
            address="".join(
                [
                    "https://raw.githubusercontent.com/",
                    "python-poetry/poetry/master/get-poetry.py",
                ]
            ),
            args=[
                "-y",
                "--uninstall",
            ],
        )
    def osx_install(self):
        self.run_from_curled_python_script(
            address="".join(
                [
                    "https://raw.githubusercontent.com/",
                    "python-poetry/poetry/master/get-poetry.py",
                ]
            ),
            args=["-y"],
        )

    def osx_uninstall(self):
        self.run_from_curled_python_script(
            address="".join(
                [
                    "https://raw.githubusercontent.com/",
                    "python-poetry/poetry/master/get-poetry.py",
                ]
            ),
            args=[
                "-y",
                "--uninstall",
            ],
        )
