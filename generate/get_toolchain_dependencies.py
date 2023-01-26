import sys
import os

from bazelrio_gentool.deps.cpp_toolchain_dependency import (
    CppToolchainConfig,
    CppPlatformConfig,
)


def get_toolchain_dependencies():

    DEFAULT_ARGS = dict(
        toolchain_version="7.3.0",
        cpp_url="https://github.com/wpilibsuite/roborio-toolchain/releases/download/v{release_version_hyphen}/FRC-{year}-{platform_config.short_os}-Toolchain-7.3.0{platform_config.ext}",
        cpp_platform_configs=[
            CppPlatformConfig("macos", "Mac", ".tar.gz"),
            CppPlatformConfig("linux", "Linux", ".tar.gz"),
            CppPlatformConfig("windows", "Windows32", ".zip"),
        ],
    )

    config = CppToolchainConfig(
        year="2022",
        release_version="2022-1",
        repo_name="rules_roborio_toolchain",
        version="2022-1",
        **DEFAULT_ARGS,
    )

    return config
