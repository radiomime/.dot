#!/usr/bin/env python3
from sys import platform
from shutil import which
import requests

def pkgInstalled(name):
    return which(name) is not None

def getSys():
    if platform == "linux" or platform == "linux2":
        return 'linux'
    elif platform == "darwin":
        return 'osx'
        # OS X
    elif platform == "win32":
        return 'windows'
    else:
        return 'unknown'

def getPyInterpreter():
    if which('python3') is not None:
        return 'python3'
    elif which('python') is not None:
        return 'python'
    else:
        print('Expected python to be installed!')
        return None

def getLatestGithubRepo(repoPath):
    response = requests.get("".join([
        "https://api.github.com/repos/",
        repoPath,
        "/releases/latest"
    ])).json()
    return response

def main(argv):
    print('module for common utilities')

if __name__ == "__main__":
    main(sys.argv)
