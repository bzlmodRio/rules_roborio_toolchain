load(":toolchain.bzl", "create_cross_compile_toolchain")

create_cross_compile_toolchain(compiler_dep="{compiler_repo}", sysroot_subfolder = "{sysroot}", cpu="armv7", wrapper_extension="{wrapper_extension}")