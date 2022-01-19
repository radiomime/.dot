#!/usr/bin/env python3
import argparse

from package_factory import PackageFactory


def create_arg_parser():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-l", "--list", help="list available packages", action="store_true"
    )

    parser.add_argument(
        "-a",
        "--add",
        help="add a package or app if supported",
        nargs="+",
        default=None,
    )

    parser.add_argument(
        "-r",
        "--remove",
        help="remove a package or app if supported",
        nargs="+",
        default=None,
    )
    return parser


def main():
    print("WARN: Install scripts will run some install commands as sudo")
    arg_parser = create_arg_parser()
    args = arg_parser.parse_args()
    pkgFactory = PackageFactory()

    if args.add:
        for pkg_name in args.add:
            pkg = pkgFactory.create_instance(pkg_name)
            pkg.install()
    elif args.remove:
        print(args.remove)
        for pkg_name in args.remove:
            pkg = pkgFactory.create_instance(pkg_name)
            pkg.uninstall()
    elif args.list:
        print(pkgFactory.get_packages_list())
    else:
        arg_parser.print_help()


if __name__ == "__main__":
    main()
