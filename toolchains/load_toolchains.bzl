load("//toolchains:configure_cross_compiler.bzl", "configure_cross_compiler")

def load_toolchains():
    configure_cross_compiler(
        name = "local_roborio",
        compiler = "roborio",
        bin_subfolder = "roborio-academic/bin",
        bin_prefix = "arm-frc2023-linux-gnueabi-",
        sysroot_subfolder = "roborio-academic/arm-nilrt-linux-gnueabi/sysroot",
        cxx_version = "12",
        sysroot_include_folder = "arm-nilrt-linux-gnueabi",
    )
