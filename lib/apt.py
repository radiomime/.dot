import os
import subprocess


class Apt:
    # def __init__(self):
    #     self.user = getpass.getuser()

    def update(self):
        print("*** apt update")
        subprocess.run(
            [
                "sudo",
                "apt-get",
                "-qq",
                "update",
            ]
        )

    def upgrade(self):
        print("*** apt upgrade")
        subprocess.run(
            [
                "sudo",
                "apt-get",
                "-qq",
                "upgrade",
            ]
        )

    def install(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "sudo",
            "apt-get",
            "-qq",
            "install",
            "-y",
        ]
        cmd.extend(pkgs)

        print("installing:", pkgs)
        subprocess.run(cmd)

    def uninstall(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "sudo",
            "apt-get",
            "-qq",
            "remove",
            "-y",
        ]
        cmd.extend(pkgs)

        print("removing:", pkgs)
        subprocess.run(cmd)

    def add_gpg_key(self, link):
        print("adding gpg key from:", link)
        subprocess.run(["curl", "-fsSL", link, "-o", "gpg-key-to-add"])

        subprocess.run(["sudo", "apt-key", "add", "gpg-key-to-add"])

        subprocess.run(["rm", "gpg-key-to-add"])

    def gpg_fingerprint(self, last8):
        subprocess.run(
            [
                "sudo",
                "apt-key",
                "fingerprint",
                last8,
            ]
        )

    def add_apt_repo(self, repo):
        subprocess.run(
            [
                "sudo",
                "add-apt-repository",
                "-y",
                repo,
            ],
            stdout=open(os.devnull, "wb"),
        )
