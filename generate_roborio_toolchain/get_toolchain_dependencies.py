import sys
import os

from bazelrio_gentool.deps.cpp_toolchain_dependency import (
    CppToolchainConfig,
    CppPlatformConfig,
)


def get_toolchain_dependencies():

    DEFAULT_ARGS = dict(
        toolchain_version="12.1.0",
        cpp_url="https://github.com/wpilibsuite/opensdk/releases/download/v{release_version_hyphen}/cortexa9_vfpv3-roborio-academic-{year}-x86_64-{platform_config.short_os}-Toolchain-{toolchain_version}{platform_config.ext}",
        cpp_platform_configs=[
            CppPlatformConfig("macos", "apple-darwin", ".tgz"),
            CppPlatformConfig("linux", "linux-gnu", ".tgz"),
            CppPlatformConfig("windows", "w64-mingw32", ".zip"),
        ],
    )

    config = CppToolchainConfig(
        year="2023",
        release_version="2023_7",
        repo_name="rules_roborio_toolchain",
        version="2023-7.4",
        **DEFAULT_ARGS,
    )

    return config
