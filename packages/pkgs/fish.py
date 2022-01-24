import subprocess
from typing import Optional

from .abs_package import AbsPackage
from .apt import Apt
from .brew import Brew
from .util import bin_loc, github_release_metadata, is_installed

# TODO: be safe when doing chsh!!


class Fish(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("fish")

    def get_version(self):
        output = subprocess.check_output(
            [
                "fish",
                "--version",
            ]
        )

        output = output.decode("utf-8")
        words = output.split(" ")
        if words[0] == "fish,":
            return words[2].rstrip()

        # should never be hit
        return None

    def __change_shell(self, shell="fish"):
        print(f"***changing shell to {shell}")
        shell = bin_loc(shell)
        if shell:
            subprocess.run(
                [
                    "chsh",
                    "-s",
                    shell,
                ]
            )

    def linux_install(self):
        apt = Apt()
        apt.add_apt_repo("ppa:fish-shell/release-3")
        apt.update()
        apt.install("fish")

        self.__change_shell()

    def linux_uninstall(self):
        apt = Apt()
        apt.uninstall("fish")

        self.__change_shell(shell="bash")

    def osx_install(self):
        brew = Brew()
        brew.brew_install(
            pkgs="fish",
            flags="--HEAD",
        )

        fish_loc = bin_loc("fish")
        print(fish_loc)
        # # subprocess.run([p])
        # if fish_loc is not None:
        #     # subprocess.run([
        #     #     'sudo',
        #     #     'tee'
        #     # ])
        #     ps = subprocess.Popen(
        #         ("echo", fish_loc),
        #         stdout=subprocess.PIPE,
        #     )
        #     output = subprocess.check_output(
        #         (
        #             "sudo",
        #             "tee",
        #             "-a",
        #             "/etc/shells",
        #         ),
        #         stdin=ps.stdout,
        #     )
        #     ps.wait()
        #     print("output")
        #     print(output)
        #     # with open("/etc/shells", "a") as file:
        #     #     file.write(fish_loc)
        #
        #     self.__change_shell()

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall(
            pkgs="fish",
        )

        self.__change_shell(shell="zsh")
