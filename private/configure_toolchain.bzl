

def __configure_toolchain_impl(repository_ctx):
    BINARIES = [
        "ar",
        "cpp",
        "gcc",
        "gcov",
        "ld",
        "nm",
        "objdump",
        "strip",
    ]

    substitutions = {
        "{sep}": "/",
        "{compiler_repo}": "rules_roborio_toolchain~override~deps~windows",
        "{bin_subfolder}": "roborio-academic/bin",
        "{sysroot_subfolder}": "roborio-academic/arm-nilrt-linux-gnueabi/sysroot",
        "{binary_prefix}": "arm-frc2023-linux-gnueabi-",
        "{tool_platform_suffix}": "",
    }
    
    if repository_ctx.os.name.startswith("windows"):
        substitutions["{command_prefix}"] = "@echo off\n"
        substitutions["{wrapper_extension}"] = ".bat"
        substitutions["{sep}"] = "\\"
        substitutions["{tool_platform_suffix}"] = ".exe"
        substitutions["{bin_subfolder}"] = substitutions["{bin_subfolder}"].replace("/", "\\")
        substitutions["{arg_passthrough}"] = "%*"
    else:
        fail("Unknown os " + repository_ctx.os.name)

    print(repository_ctx.os.name)

    for binary in BINARIES:
        bin_substitution = dict(substitutions)
        bin_substitution["{binary_target}"] = binary
        repository_ctx.template(
            "bin/" + binary + substitutions["{wrapper_extension}"],
            repository_ctx.path(Label("@rules_roborio_toolchain//private:command_wrapper.tpl")),
            substitutions = bin_substitution,
        )
        
    repository_ctx.template(
        "toolchain_config.bzl",
        repository_ctx.path(Label("@rules_roborio_toolchain//private:toolchain_config.bzl.tpl")),
        substitutions = substitutions,
    )
    repository_ctx.template(
        "BUILD.bazel",
        repository_ctx.path(Label("@rules_roborio_toolchain//private:BUILD.tpl")),
        substitutions = substitutions,
    )


__configure_toolchain = repository_rule(
    configure = True,
    implementation = __configure_toolchain_impl,
)

def configure_toolchain(name = "local_roborio", register = True):
    print("Configuring toolchain...")
    __configure_toolchain(name = name)

    if register:
        fail("Not supported")


