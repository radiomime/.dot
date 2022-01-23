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
                self.packages[name.lower()] = _type

    def get_packages_list(self):
        return " ".join(self.packages.keys())

    def create_instance(self, pkg_name):
        pkg_name = pkg_name.lower()
        if pkg_name in self.packages:
            return self.packages[pkg_name]()
        else:
            return self.packages["nullpackage"](pkg_name)
