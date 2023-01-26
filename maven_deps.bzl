load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
    name = "all",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)
"""

def __setup_toolchains_dependencies(mctx):
    # C++
    maybe(
        http_archive,
        "bazelrio_roborio_toolchain_macos",
        url = "https://github.com/wpilibsuite/roborio-toolchain/releases/download/v2022-1/FRC-2022-Mac-Toolchain-7.3.0.tar.gz",
        sha256 = "47d29989d2618c0fc439b72e8d3d734b93952da4136dd05a7648af19662700b7",
        build_file_content = filegroup_all,
        patches = [
            "@rules_roborio_toolchain//patches:libc_no_sandboxfs.patch",
            "@rules_roborio_toolchain//patches:libpthread_no_sandboxfs.patch",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_roborio_toolchain_linux",
        url = "https://github.com/wpilibsuite/roborio-toolchain/releases/download/v2022-1/FRC-2022-Linux-Toolchain-7.3.0.tar.gz",
        sha256 = "b27cde302e46d11524aedf664129bc3ac7df02a78d0f9e4ab3f1feb40d667ab4",
        build_file_content = filegroup_all,
        patches = [
            "@rules_roborio_toolchain//patches:libc_no_sandboxfs.patch",
            "@rules_roborio_toolchain//patches:libpthread_no_sandboxfs.patch",
        ],
    )
    maybe(
        http_archive,
        "bazelrio_roborio_toolchain_windows",
        url = "https://github.com/wpilibsuite/roborio-toolchain/releases/download/v2022-1/FRC-2022-Windows32-Toolchain-7.3.0.zip",
        sha256 = "0c4601cfaaf97612cef34bbfeb8aebc73c6ad3b4e262024cecae75eb8bca8277",
        build_file_content = filegroup_all,
    )

def setup_legacy_setup_toolchains_dependencies():
    __setup_toolchains_dependencies(None)

deps = module_extension(
    __setup_toolchains_dependencies,
)
