import subprocess

from .util import (
    pkgInstalled,
    getSys,
)

class Brew:
    def __init__(self):
        self.os = getSys()
        if( self.os != 'osx'):
            print('Homebrew not on osx? Hmm.')

        if not pkgInstalled('brew'):
            print('Homebrew doesn\'t seem to be installed.')

    def update(self):
        subprocess.run([
            'brew',
            'update',
        ])

    def upgrade(self):
        subprocess.run([
            'brew',
            'upgrade',
        ])

    def install(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [ pkgs ]

        cmd = [
            'brew',
            'install',
        ]
        cmd.extend(pkgs)

        print('installing:', pkgs)
        subprocess.run(cmd)

    def uninstall(self, pkgs):
        if not isinstance(pkgs, list):
            pkgs = [ pkgs ]

        cmd = [
            'brew',
            'uninstall',
        ]
        cmd.extend(pkgs)

        print('installing:', pkgs)
        subprocess.run(cmd)
