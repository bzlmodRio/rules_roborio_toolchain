workspace(name = "rules_roborio_toolchain")

load("@rules_roborio_toolchain//:maven_deps.bzl", "setup_legacy_setup_toolchains_dependencies")

setup_legacy_setup_toolchains_dependencies()

load("@rules_roborio_toolchain//toolchains:load_toolchains.bzl", "load_toolchains")

load_toolchains()

register_toolchains(
    "@local_roborio//:windows",
    "@local_roborio//:linux",
    "@local_roborio//:macos",
)
