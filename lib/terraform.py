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
import getpass

from .util import (
    getPyInterpreter,
    getSys,
    getLatestGithubRepo,
)

# TODO: fix: installing in /usr/bin/root with matt:matt as owner

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

def main(argv):
    print('module for packages')

if __name__ == "__main__":
    main(sys.argv)
