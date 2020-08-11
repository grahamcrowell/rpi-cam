#!/usr/bin/env python
# pylint: disable=missing-docstring
import os
import sys

import rpi_cam

try:
    from setuptools import setup, find_namespace_packages
except ImportError:
    from distutils.core import setup

if sys.argv[-1] == 'publish':
    os.system('python setup.py sdist upload')
    sys.exit()

REQUIRES = list(open('requirements.txt').readlines())
README = open('README.md').read()

setup(
    name='rpi_cam',
    # setup_requires=['setuptools_scm'],
    # use_scm_version=True,
    description='rpi',
    long_description=README,
    author=rpi_cam.__author__,
    author_email=rpi_cam.__email__,
    url='https://github.com/gcrowell/rpi_cam',
    packages=find_namespace_packages(include=['.', 'rpi_cam', 'rpi_cam.*']),
    package_dir={'rpi_cam': 'rpi_cam'},
    include_package_data=True,
    install_requires=REQUIRES,
    zip_safe=False,
    keywords='raspberry pi',
    classifiers=[
        # https://pypi.org/pypi?%3Aaction=list_classifiers
        'Development Status :: 2 - Pre-Alpha',
        'Intended Audience :: Developers',
        'Natural Language :: English',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: Implementation :: PyPy',
    ],
    entry_points={
        'console_scripts': [
            'rpi-cam=rpi_cam.command_line:main'
        ]
    })  # yapf: disable