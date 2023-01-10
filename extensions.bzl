load("//toolchains:load_toolchains.bzl", cfg = "load_toolchains")

def _sh_configure_impl(ctx):\
    cfg()

sh_configure = module_extension(implementation = _sh_configure_impl)