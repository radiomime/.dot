from inspect import getmembers, isclass, isabstract
import pkgs


class PackageFactory(object):
    packages = {}  # key is package name, value is car's class

    def __init__(self) -> None:
        super().__init__()
        self.load_packages()

    def load_packages(self):
        classes = getmembers(pkgs, lambda m: isclass(m) and not isabstract(m))
        for name, _type in classes:
            if isclass(_type) and issubclass(_type, pkgs.AbsPackage):
                self.packages[name] = _type
                # self.packages.update([[name, _type]])

    def get_packages_list(self):
        return self.packages.keys()
