import subprocess
from .brew import Brew

from .abs_package import AbsPackage
from .rust import Rust
from .util import bin_loc, is_installed


class Bandwhich(AbsPackage):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("bandwhich")

    def get_version(self):
        output = subprocess.check_output(
            [
                "bandwhich",
                "--version",
            ]
        )
        output = output.decode("utf-8")
        for line in output.split("\n"):
            words = line.split(" ")
            if words[0] == "bandwhich":
                return words[1]

        # should never be hit
        return None

    def linux_install(self):
        rust = Rust()
        rust.cargo_install(["bandwhich"])
        bw_loc = bin_loc("bandwhich")
        if bw_loc is not None:
            subprocess.run(
                [
                    "sudo",
                    "setcap",
                    ",".join(
                        [
                            "cap_sys_ptrace",
                            "cap_dac_read_search",
                            "cap_net_raw",
                            "cap_net_admin+ep",
                        ]
                    ),
                    bw_loc,
                ]
            )

    def linux_uninstall(self):
        rust = Rust()
        rust.cargo_uninstall("bandwhich")

    def osx_install(self):
        brew = Brew()
        brew.brew_install("bandwhich")

    def osx_uninstall(self):
        brew = Brew()
        brew.brew_uninstall("bandwhich")
