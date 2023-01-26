load("//toolchains:configure_cross_compiler.bzl", "configure_cross_compiler")

def load_toolchains():
    configure_cross_compiler(
        name = "local_roborio",
        compiler = "roborio",
        bin_subfolder = "frc2022/roborio/bin",
        bin_prefix = "arm-frc2022-linux-gnueabi-",
        sysroot_subfolder = "frc2022/roborio/arm-frc2022-linux-gnueabi",
        cxx_version = "7.3.0",
        sysroot_include_folder = "arm-frc2022-linux-gnueabi",
    )
