import subprocess

from .apt import Apt
from .util import (
    getSys,
    getLatestGithubRepo,
)


class Ripgrep:
    def __init__(self):
        self.os = getSys()
        # self.user = getpass.getuser()
        # self.path = "/usr/local/bin"

    def install(self):
        print("*** installing ripgrep")
        if self.os == "linux":
            self.__linuxInstall()
        else:
            print("no install instructions for", self.os)

    def uninstall(self):
        if self.os == "linux":
            print("no uninstall instructions for", self.os)
        else:
            print("no uninstall instructions for", self.os)

    def __linuxInstall(self):
        ripgrepVersion = getLatestGithubRepo("BurntSushi/ripgrep")["name"]

        repo = "".join(
            [
                "https://github.com/BurntSushi/ripgrep/releases/download/",
                ripgrepVersion,
                "/",
                "ripgrep_",
                ripgrepVersion[:],
                "_amd64.deb",
            ]
        )

        subprocess.run(
            [
                "curl",
                "-fsSL",
                repo,
                "-o",
                "".join("ripgrep_amd64.deb"),
            ]
        )

        subprocess.run(
            [
                "sudo",
                "dpkg",
                "-i",
                "ripgrep_amd64.deb",
            ]
        )

        subprocess.run(
            [
                "rm",
                "ripgrep_amd64.deb",
            ]
        )
