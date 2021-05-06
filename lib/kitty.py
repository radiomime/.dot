import getpass
import subprocess
from os.path import abspath, expanduser

from .util import getSys


class Kitty:
    def __init__(self):
        self.os = getSys()
        self.user = getpass.getuser()
        self.path = abspath(expanduser("."))

    def install(self):
        print("*** installing kitty")
        if self.os == "linux":
            self.__linux_install()
        else:
            print(f"no install instructions for {self.os}")

    def uninstall(self):
        if self.os == "linux":
            self.__linux_uninstall()
        else:
            print("no uninstall instructions for", self.os)

    def __linux_uninstall(self):
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

    def __linux_install(self):

        # git clone https://github.com/kovidgoyal/kitty && cd kitty

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
                expanduser("~/.local/kitty.app/share/applications/kitty.desktop"),
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
