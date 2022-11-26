load("//private:configure_toolchain.bzl", cfg = "configure_toolchain")

def _sh_configure_impl(ctx):
    cfg(register = False)

sh_configure = module_extension(implementation = _sh_configure_impl)