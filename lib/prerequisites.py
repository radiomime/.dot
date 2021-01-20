#!/usr/bin/env python3

class Prereqs:
    def __init__(self):
        print('*** installing prerequisites')
        self.os = getSys()

    def install(self)
        if self.os == 'linux':
            self.linuxInstall()
        if self.os == 'osx':
            self.osxInstall()
        else:
            print('no install instructions for', self.os)

    def linuxInstall(self):
        print('no prereqs defined for linux')

    def osxInstall(self):
        print('no prereqs defined for osx')
