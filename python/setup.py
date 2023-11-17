#!/usr/bin/env python
from setuptools import setup, find_packages

setup(
    name='DVDPlayerSimulator',
    version='1.0',
    packages=find_packages(),
    install_requires=[
        'pygame',
    ],
    entry_points={
        'console_scripts': [
            'dvd_simulator = load:main',  
        ],
    },

    author='jobega',
    description='A DVD Player Simulator using Pygame',
    license='MIT',
    keywords='dvd simulator pygame game',
)
