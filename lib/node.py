#!/usr/bin/env python3
from sys import platform
import json
import sys
from os.path import expanduser
from os.path import abspath
from shutil import which
import time
import subprocess
import os
import requests
import getpass

from .util import (
    getPyInterpreter,
    getSys,
    getLatestGithubRepo,
)

class Node:
    def __init__(self):
        print('I should install node!!!')
        print('I should also install npm')
        print('I should also install useful global npm packages')
        # Install n, for instance
        # update && upgrade node && npm
