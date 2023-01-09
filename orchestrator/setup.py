"""
Setup file for the orchestrator package.
"""

from setuptools import find_packages, setup

setup(
    name="orchestrator",
    packages=find_packages(exclude=["orchestrator_tests"]),
    install_requires=[
        "dagster",
    ],
    extras_require={"dev": ["dagit", "pytest"]},
)
