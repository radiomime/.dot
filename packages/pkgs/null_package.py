from .abs_package import AbsPackage

# from .util import is_installed


class NullPackage(AbsPackage):
    # TODO: do any of these actually need a constructor?
    def __init__(self, pkg_name='nullpackage'):
        super().__init__()
        self.pkg_name = pkg_name

    def is_installed(self):
        return False

    def get_version(self):
        return None

    def __del__(self):
        pass
