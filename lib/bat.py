import subprocess

from .util import getLatestGithubRepo, getSys


#
# TODO: mac install
# TODO: uninstall
# TODO: mac uninstall
#
class Bat:
    def __init__(self):
        self.os = getSys()

    def install(self):
        print("*** installing bat")
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
        batVersion = getLatestGithubRepo("sharkdp/bat")["name"]

        repo = "".join(
            [
                "https://github.com/sharkdp/bat/releases/download/",
                batVersion,
                "/",
                "bat_",
                batVersion[1:],
                "_amd64.deb",
            ]
        )

        subprocess.run(
            [
                "curl",
                "-fsSL",
                repo,
                "-o",
                "".join("bat_amd64.deb"),
            ]
        )

        subprocess.run(
            [
                "sudo",
                "dpkg",
                "-i",
                "bat_amd64.deb",
            ]
        )

        subprocess.run(
            [
                "rm",
                "bat_amd64.deb",
            ]
        )
