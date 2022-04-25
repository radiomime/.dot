#!/usr/bin/env python3
import subprocess
from .brew import Brew

from .abs_package import AbsPackage
from .util import github_release_metadata, is_installed


class Terraform(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("terraform")

    def get_version(self):
        output = subprocess.check_output(
            [
                "terraform",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "Terraform":
                return words[1][1:]

        # should never be hit
        return None

    def linux_install(self):
        tf_md = github_release_metadata("hashicorp/terraform")
        tf_latest_version = tf_md["tag_name"][1:]

        tf_zip_address = "".join(
            [
                "https://releases.hashicorp.com/terraform/",
                tf_latest_version,
                "/terraform_",
                tf_latest_version,
                "_linux_amd64.zip",
            ]
        )
        self.install_binary_from_zip(
            address=tf_zip_address,
        )

    def linux_uninstall(self):
        subprocess.run(
            [
                "sudo",
                "rm",
                "-f",
                f"{self.path}/terraform",
            ]
        )

    def osx_install(self):

        brew = Brew()
        brew.brew_install(
            pkgs="terraform",
        )

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="terraform",
        )
