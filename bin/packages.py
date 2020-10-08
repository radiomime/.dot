#!/usr/bin/env python3
from sys import platform
import json
import sys
from os.path import expanduser
from os.path import abspath
from shutil import which
import time
import subprocess
import os
import requests

from .util import (
    getPyInterpreter,
    getSys,
    getLatestGithubRepo
)

class Node:
    def __init__(self):
        print('I should install node!!!')
        print('I should also install npm')
        print('I should also install useful global npm packages')
        # Install n, for instance
        # update && upgrade node && npm

class Go:
    def __init__(self):
        print('*** performing actions for Go package')
        self.os = getSys()

    def checkInstall(self):
        return which('go') is not None

    def install(self):
        if not self.checkInstall():
            subprocess.run(['sudo',
                            'snap',
                            'install',
                            'go',
                            '--classic'
                            ])
            subprocess.run(['go', 'version'])
        self.update()

    def update(self):
        if self.checkInstall():
            subprocess.run(['sudo', 'snap', 'refresh', 'go'])

    def uninstall(self):
        if self.checkInstall():
            subprocess.run(['sudo',
                            'snap',
                            'remove',
                            'go'])

class Poetry:
    def __init__(self):
        print('*** performing actions for Poetry package')

        self.pyInterpreter = getPyInterpreter()


        subprocess.run(['curl',
                        '-sSL',
                        'https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py',
                        '-o', 'get-poetry.py'])
        self.os = getSys()

    def aptDependencies(self):
        #TODO: add this? Should this be here?
        subprocess.run(['sudo',
                        'apt',
                        'install',
                        'python3-venv'])

    def checkInstall(self):
        return which('poetry') is not None

    def install(self):
        if not self.checkInstall():
            subprocess.run([self.pyInterpreter,
                            'get-poetry.py', '-y'])
            subprocess.run(['poetry', '--version'])
        self.update()

    def update(self):
        if self.checkInstall():
            subprocess.run(['poetry', 'self', 'update'])

    def uninstall(self):
        if self.checkInstall():
            subprocess.run([self.pyInterpreter,
                            'get-poetry.py',
                            '--uninstall'])

    def __del__(self):
        subprocess.run(['rm',
                        'get-poetry.py'])

class Terraform:
    # TODO: clean up some of this functionality
    def __init__(self):
        print('*** performing actions for Terraform package')

        self.os = getSys()
        self.latestVersion = getLatestGithubRepo('hashicorp/terraform')['name'][1:]
        self.binaryZip = 'latest-terraform.zip'
        self.path = '/usr/local/bin'

    def checkInstall(self):
        return which('terraform') is not None

    def linuxInstall(self):
        print('getting terraform package')
        # https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip
        # latest = getLatestGithubRepo('hashicorp/terraform')
        # version = latest['name'][1:]

        location = "".join([
            'https://releases.hashicorp.com/terraform/',
            self.latestVersion,
            '/terraform_',
            self.latestVersion,
            '_linux_amd64.zip'
        ])

        subprocess.run([
            'wget',
            '-O',
            self.binaryZip,
            location
        ])

        subprocess.run([
            'unzip',
            self.binaryZip
        ])

        subprocess.run([
            'sudo',
            'mv',
            'terraform',
            self.path,
        ])
        subprocess.run([
            'rm',
            self.binaryZip
        ])

    def install(self):
        # Install will also update
        if self.os is 'linux':
            self.linuxInstall()
        else:
            print('no install instructions for OS')

        if self.checkInstall():
            subprocess.run([
                'terraform',
                '-install-autocomplete'
            ])

    def uninstall(self):
        print("untested unistall of terraform!")
        if self.checkInstall():
            subprocess.run([
                'rm',
                "".join([
                    self.path,
                    'terraform'
                ])
            ])

class Packages:
    def __init__(self):
        self.os = getSys()

    def uu(self):
        print('updating and upgrading packages')
        subprocess.run(['sudo', 'apt', 'update', '-y'])

    def install(self):
        print('not updating and upgrading packages')
        # self.uu();

        Poetry().install()
        Go().install()
        Terraform().install()

    def uninstall(self):
        Poetry().uninstall()
        Go().uninstall()
        Terraform().uninstall()

def main(argv):
    print('module for packages')

if __name__ == "__main__":
    main(sys.argv)
