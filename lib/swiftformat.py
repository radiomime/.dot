#!/usr/bin/env python3

from .brew import Brew
from .util import getSys, which


# any need for swift-format or swiftlint?
class SwiftFormat:
    def __init__(self):
        self.os = getSys()

    def checkInstall(self):
        return which("swiftformat") is not None

    def install(self):
        print("\n*** installing", type(self).__name__)
        if self.os == "osx":
            self.__osxInstall()
        else:
            print("no install instructions for", self.os)

    def __osxInstall(self):
        print("installing swiftformat for osx")
        brew = Brew()
        brew.update()
        brew.install("swiftformat")
