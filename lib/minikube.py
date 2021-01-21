import subprocess

from .util import (
    getSys,
)

from .apt import Apt

# TODO: mac install
# TODO: uninstall
# TODO: mac uninstall

class Minikube:
    def __init__(self):
        print('*** installing minikube')
        self.os = getSys()

        subprocess.run([
            'curl',
            '-sSL',
            ''.join([
                'https://storage.googleapis.com/',
                'minikube/releases/latest/',
                'minikube_latest_amd64.deb',
            ]),
            '-o', 'minikube_latest_amd64.deb'
        ])

    def __del__(self):
        subprocess.run(['rm',
                        'minikube_latest_amd64.deb'])

    def __linuxInstall(self):
        subprocess.run([
            'sudo',
            'dpkg',
            '-i',
            'minikube_latest_amd64.deb'
        ])

    def install(self):
        if self.os == 'linux':
            self.__linuxInstall()
        else:
            print('no install instructions for', self.os)

    def uninstall(self):
        if self.os == 'linux':
            print('no uninstall instructions for', self.os)
        else:
            print('no uninstall instructions for', self.os)
