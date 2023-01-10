load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """

filegroup(
    name = "tools",
    srcs = glob(["roborio-academic/bin/arm-frc2023-linux-gnueabi-*"]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "includes",
    srcs = glob([
        "roborio-academic/arm-nilrt-linux-gnueabi/sysroot/usr/lib/**",
        "roborio-academic/arm-nilrt-linux-gnueabi/sysroot/usr/include/**",
    ]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "everything",
    srcs = [":tools", ":includes"],
    visibility = ["//visibility:public"],
)
 """

def __setup_toolchains_dependencies(mctx):
    # C++
    maybe(
        http_archive,
        "roborio-compiler-macos",
        url = "https://github.com/wpilibsuite/opensdk/releases/download/v2023-7/cortexa9_vfpv3-roborio-academic-2023-x86_64-apple-darwin-Toolchain-12.1.0.tgz",
        sha256 = "345bcbbc81958ad91dc87f51a94f1a709fdd7001b7f2995eaa016c04822f6d17",
        build_file_content = filegroup_all,
    )
    maybe(
        http_archive,
        "roborio-compiler-linux",
        url = "https://github.com/wpilibsuite/opensdk/releases/download/v2023-7/cortexa9_vfpv3-roborio-academic-2023-x86_64-linux-gnu-Toolchain-12.1.0.tgz",
        sha256 = "f3d48103c311e07e4da5e6f2cae426d34d582b627c342f20407530f8cb1c93a1",
        build_file_content = filegroup_all,
    )
    maybe(
        http_archive,
        "roborio-compiler-windows",
        url = "https://github.com/wpilibsuite/opensdk/releases/download/v2023-7/cortexa9_vfpv3-roborio-academic-2023-x86_64-w64-mingw32-Toolchain-12.1.0.zip",
        sha256 = "36b94b972fd017f6fd15a57ddbaa20e18616d72f7de16d9c81c03a1e58cb8475",
        build_file_content = filegroup_all,
    )


def setup_legacy_setup_toolchains_dependencies():
    __setup_toolchains_dependencies(None)

    
deps = module_extension(
    __setup_toolchains_dependencies,
)
