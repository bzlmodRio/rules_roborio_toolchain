load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
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
        url = "https://github.com/wpilibsuite/opensdk/releases/download/v2023-5/cortexa9_vfpv3-roborio-academic-2023-x86_64-apple-darwin-Toolchain-12.1.0.tgz",
        sha256 = "511a64461bfdec00bacb9abe1470f1c112fc9773b29dbb275b1dc9560b973146",
        build_file_content = filegroup_all,
        patches = [
            "@bazelrio//dependencies/toolchains/2023/2023_5/patches:libc_no_sandboxfs.patch",
            "@bazelrio//dependencies/toolchains/2023/2023_5/patches:libpthread_no_sandboxfs.patch",
        ],
    )
    maybe(
        http_archive,
        "linux",
        url = "https://github.com/wpilibsuite/opensdk/releases/download/v2023-5/cortexa9_vfpv3-roborio-academic-2023-x86_64-linux-gnu-Toolchain-12.1.0.tgz",
        sha256 = "56bd5b53a4149b06fd4cf675dc0596668af47ca8da72c461b7d772ada35cbdc5",
        build_file_content = filegroup_all,
        patches = [
            #"@bazelrio//dependencies/toolchains/2023/2023_5/patches:libc_no_sandboxfs.patch",
            #"@bazelrio//dependencies/toolchains/2023/2023_5/patches:libpthread_no_sandboxfs.patch",
        ],
    )
    maybe(
        http_archive,
        "windows",
        url = "https://github.com/wpilibsuite/opensdk/releases/download/v2023-5/cortexa9_vfpv3-roborio-academic-2023-x86_64-w64-mingw32-Toolchain-12.1.0.zip",
        sha256 = "04049728801e97fa41a8aa0837e40103c89391d0479f106aad6f959bbccd9da5",
        build_file_content = filegroup_all,
    )


def setup_legacy_setup_toolchains_dependencies():
    __setup_toolchains_dependencies(None)

    
deps = module_extension(
    __setup_toolchains_dependencies,
)
