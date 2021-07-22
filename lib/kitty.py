import subprocess
from os import environ
from os.path import expanduser

from .abs_package import Package
from .util import is_installed, is_installed_osx_app


class Kitty(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("kitty")

    def get_version(self):
        if is_installed_osx_app('kitty'):
            return "mac app version unsupported"

        output = subprocess.check_output(
            [
                "kitty",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        words = output.split(" ")
        if words[0] == "kitty":
            return words[1].strip()

        # should never be hit
        return None

    def __install(self):
        has_desktop = environ.get("DESKTOP_SESSION")
        print(f'desktop: {has_desktop}')

        source = "https://sw.kovidgoyal.net/kitty/installer.sh"

        subprocess.run(
            [
                "curl",
                "-L",
                source,
                "-o",
                "kitty_install.sh",
            ]
        )

        subprocess.run(
            [
                "sh",
                "kitty_install.sh",
                "launch=n",
            ]
        )

        subprocess.run(
            [
                "ln",
                "-s",
                expanduser("~/.local/kitty.app/bin/kitty"),
                expanduser("~/.local/bin/"),
            ]
        )

        subprocess.run(
            [
                "cp",
                expanduser(
                    "".join(
                        [
                            "~/.local/kitty.app/",
                            "share/applications/kitty.desktop",
                        ]
                    )
                ),
                expanduser("~/.local/share/applications/"),
            ]
        )

        subprocess.run(
            [
                "sed",
                "-i",
                f"s|Icon=kitty|Icon=/home/{self.user}/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g",  # noqa: E501
                expanduser("~/.local/share/applications/kitty.desktop"),
            ]
        )

        subprocess.run(
            [
                "rm",
                "kitty_install.sh",
            ]
        )

    def __uninstall(self):
        subprocess.run(
            [
                "rm",
                "-rf",
                expanduser("~/.local/kitty.app"),
            ]
        )

        subprocess.run(
            [
                "rm",
                "-rf",
                expanduser("~/.local/bin/kitty"),
            ]
        )

        subprocess.run(
            [
                "rm",
                "-rf",
                expanduser("~/.local/share/applications/kitty.desktop"),
            ]
        )

    def linux_install(self):
        self.__install()

    def osx_install(self):
        self.__install()

    def linux_uninstall(self):
        self.__uninstall()

    def osx_uninstall(self):
        self.__uninstall()
