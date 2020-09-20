#!/usr/bin/env python3
from sys import platform

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

def main(argv):
    print('module for common utilities')

if __name__ == "__main__":
    main(sys.argv)
