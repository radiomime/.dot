#!/usr/bin/env python3
import argparse


from package_factory import PackageFactory


def create_arg_parser():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-l", "--list", help="list available packages", action="store_true"
    )

    parser.add_argument(
        "-i",
        "--install",
        help="install a package or app if supported",
        nargs="+",
        default=None,
    )

    parser.add_argument(
        "-d",
        "--delete",
        help="delete a package or app if supported",
        nargs="+",
        default=None,
    )

    parser.add_argument(
        "-r",
        "--reinstall",
        help="reinstall a package or app if supported",
        nargs="+",
        default=None,
    )

    return parser


def main():
    arg_parser = create_arg_parser()
    args = arg_parser.parse_args()
    pkgFactory = PackageFactory()

    if args.install:
        for pkg_name in args.install:
            pkg = pkgFactory.create_instance(pkg_name)
            pkg.install()
    elif args.delete:
        for pkg_name in args.delete:
            pkg = pkgFactory.create_instance(pkg_name)
            pkg.uninstall()
    elif args.reinstall:
        for pkg_name in args.reinstall:
            pkg = pkgFactory.create_instance(pkg_name)
            if pkg.is_installed():
                pkg.uninstall()
            pkg.install()
    elif args.list:
        print(pkgFactory.get_packages_list())
    else:
        arg_parser.print_help()


if __name__ == "__main__":
    main()
