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
            'dvd_simulator = load:__main__',
        ],
    },
    description='A DVD Player built using Pygame',
    license='MIT',
    keywords='dvd simulator pygame game',
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.9',
        'Topic :: Games/Entertainment',
    ],
)
