import subprocess


class Pip:
    def install(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "python3",
            "-m",
            "pip",
            "install",
            "--user",
            "--upgrade",
        ]
        cmd.extend(pkgs)

        print("installing:", pkgs)
        subprocess.run(cmd)

    def uninstall(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [pkgs]

        cmd = [
            "python3",
            "-m",
            "pip",
            "uninstall",
            "--user",
        ]
        cmd.extend(pkgs)

        print("removing:", pkgs)
        subprocess.run(cmd)
