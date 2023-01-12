load(":cc-toolchain-config.bzl", "cc_toolchain_config")
load("@rules_cc//cc:defs.bzl", "cc_toolchain", "cc_toolchain_suite")

compiler_dep="{compiler_repo}"
sysroot_subfolder = "{sysroot}"
cpu="armv7"
wrapper_extension="{wrapper_extension}"

tag = "{}".format(cpu)

cc_toolchain_config_name = "cc-toolchain_config-{}".format(tag)

compiler_files_name = "compiler_files-{}".format(tag)
cc_toolchain_name = "cc-compiler-{}".format(tag)
toolchain_name = "cc-toolchain-{}".format(tag)
cc_toolchain_suite_name = "compiler"

sysroot_everything = "@{}//:all".format(compiler_dep)

toolchain_key = cpu

cxx_builtin_include_directories = [
        "external/{actual_compiler_path}/{sysroot}/usr/lib/gcc/{sysroot_include_folder}/{cxx_version}/include",
        "external/{actual_compiler_path}/{sysroot}/usr/lib/gcc/{sysroot_include_folder}/{cxx_version}/include-fixed",
        "external/{actual_compiler_path}/{sysroot}/usr/include/{sysroot_include_folder}/c++/{cxx_version}",
        "external/{actual_compiler_path}/{sysroot}/usr/include/c++/{cxx_version}",
        "external/{actual_compiler_path}/{sysroot}/usr/include/c++/{cxx_version}/{sysroot_include_folder}",
        "external/{actual_compiler_path}/{sysroot}/usr/include/c++/{cxx_version}/backward",
        "external/{actual_compiler_path}/{sysroot}/usr/include/{sysroot_include_folder}",
        "external/{actual_compiler_path}/{sysroot}/usr/include",
]

cc_toolchain_config(
    name = cc_toolchain_config_name,
    toolchain_identifier = toolchain_name,
    wrapper_extension=wrapper_extension,
    cxx_builtin_include_directories=cxx_builtin_include_directories
)

filegroup(
    name = compiler_files_name,
    srcs = glob(["bin/**"]) + [
        sysroot_everything
    ] ,
)

print("HELLO")
print(cc_toolchain_name)
cc_toolchain(
    name = cc_toolchain_name,
    all_files = compiler_files_name,
    ar_files = compiler_files_name,
    as_files = compiler_files_name,
    compiler_files =  compiler_files_name,
    dwp_files = compiler_files_name,
    linker_files =  compiler_files_name,
    objcopy_files = compiler_files_name,
    strip_files = compiler_files_name,
    supports_param_files = True,
    toolchain_config = cc_toolchain_config_name,
    visibility = ["//visibility:public"],
)

toolchain(
    name = "windows",
    exec_compatible_with = ["@platforms//os:windows"],
    target_compatible_with = ["@rules_roborio_toolchain//constraints/is_roborio:true"],
    toolchain = cc_toolchain_name,
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

toolchain(
    name = "linux",
    exec_compatible_with = ["@platforms//os:linux"],
    target_compatible_with = ["@rules_roborio_toolchain//constraints/is_roborio:true"],
    toolchain = cc_toolchain_name,
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

toolchain(
    name = "macos",
    exec_compatible_with = ["@platforms//os:macos"],
    target_compatible_with = ["@rules_roborio_toolchain//constraints/is_roborio:true"],
    toolchain = cc_toolchain_name,
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

cc_toolchain_suite(
    name = cc_toolchain_suite_name,
    toolchains = {
        toolchain_key: cc_toolchain_name,
    },
    tags = ["manual"],
)