import subprocess

from .abs_package import Package
from .rust import Rust
from .util import bin_loc, github_release_metadata, is_installed


class Bandwhich(Package):
    def __init__(self):
        super().__init__()

    def is_installed(self):
        return is_installed("bandwhich")

    def get_version(self):
        # output = subprocess.check_output(
        #     [
        #         "mitmproxy",
        #         "--version",
        #     ]
        # )
        # output = output.decode("utf-8")
        # for line in output.split("\n"):
        #     words = line.split(" ")
        #     if words[0] == "Mitmproxy:":
        #         return words[1]

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
