load(":cc-toolchain-config.bzl", "cc_toolchain_config")
load("@rules_cc//cc:defs.bzl", "cc_toolchain", "cc_toolchain_suite")


def create_cross_compile_toolchain(compiler_dep, cpu, sysroot_subfolder, wrapper_extension):
    fail()
