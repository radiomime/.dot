#!/usr/bin/env python3
from sys import platform

import sys
from os.path import expanduser
from os.path import abspath
import time
import subprocess
import os

# import util
from .util import *

class Packages:
    def __init__(self):
        print(getSys())
        print('initializing')

    def install(self):
        print('checking packages')

    def createSymlinks(self):
        for src, dst in self.files.items():
            self.symlink(abspath(expanduser(src)), abspath(expanduser(dst)))

    def removeSymlinks(self):
        for src, dst in self.files.items():
            print('removing symlink at', abspath(expanduser(dst)))
            subprocess.run(['rm', abspath(expanduser(dst))])

def main(argv):
    print('module for packages')

if __name__ == "__main__":
    main(sys.argv)
