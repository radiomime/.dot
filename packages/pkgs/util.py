#!/usr/bin/env python3
import platform
import subprocess
from shutil import which
from typing import Literal, Optional

import distro
from pathlib import Path
import requests
from os.path import abspath


def create_dir(path: str) -> None:
    Path(abspath(path)).mkdir(parents=True, exist_ok=True)


def is_installed_osx_app(name) -> bool:
    if get_os() != "osx":
        return False

    try:
        output = subprocess.check_output(
            [
                "ls",
                "/Applications",
            ]
        )
    except subprocess.CalledProcessError as e:
        print(f"*** Unexpected error: {e}")
        return False

    output = output.decode("utf-8")
    apps = output.split("\n")

    # ignore case
    apps = [app.lower() for app in apps]
    name = name.lower()

    if name in apps:
        return True
    elif f"{name}.app".lower() in apps:
        return True
    else:
        return False


def is_installed(name):
    if get_os() == "osx":
        if is_installed_osx_app(name):
            return True
    return which(name) is not None


def bin_loc(name) -> Optional[str]:
    return which(name)


def get_distro() -> str:
    return distro.linux_distribution(full_distribution_name=False)[0]


def get_distro_codename() -> str:
    return distro.linux_distribution()[2]


def get_architecture() -> Literal["x86_64", "armv7l", "arm64", "unknown"]:
    arch = platform.machine()

    if arch == "x86_64":
        return "x86_64"
    elif arch == "armv7l":
        return "armv7l"
    elif arch == "arm64":
        return "arm64"
    else:
        return "unknown"


def get_os() -> Literal["linux", "osx", "windows", "unknown"]:
    os = platform.system()

    if os == "Linux":
        return "linux"
    elif os == "Darwin":
        return "osx"
    elif os == "Windows":
        return "windows"
    else:
        return "unknown"


def github_release_metadata(repoPath):
    response = requests.get(
        "".join(
            [
                "https://api.github.com/repos/",
                repoPath,
                "/releases/latest",
            ]
        )
    ).json()
    return response


def pkgInstalled(name):
    return which(name) is not None


def getPyInterpreter():
    if which("python3") is not None:
        return "python3"
    elif which("python") is not None:
        return "python"
    else:
        print("Expected python to be installed!")
        return None


def getLatestGithubRepo(repoPath):
    response = requests.get(
        "".join(["https://api.github.com/repos/", repoPath, "/releases/latest"])
    ).json()
    return response
