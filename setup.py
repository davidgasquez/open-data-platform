from setuptools import find_packages, setup

setup(
    name="osds",
    packages=find_packages(),
    install_requires=["dagster"],
    extras_require={"dev": ["dagit", "pytest"]},
)
