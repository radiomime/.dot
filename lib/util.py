#!/usr/bin/env python3
import subprocess
from shutil import which
from sys import platform
from typing import Literal, Optional

import requests


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
    if name in apps:
        return True
    elif f"{name}.app" in apps:
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


def get_os() -> Literal["linux", "osx", "windows", "unknown"]:
    if platform == "linux" or platform == "linux2":
        return "linux"
    elif platform == "darwin":
        return "osx"
        # OS X
    elif platform == "win32":
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


def getSys():
    if platform == "linux" or platform == "linux2":
        return "linux"
    elif platform == "darwin":
        return "osx"
        # OS X
    elif platform == "win32":
        return "windows"
    else:
        return "unknown"


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
