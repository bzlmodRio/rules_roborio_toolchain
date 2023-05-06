import os
from get_toolchain_dependencies import get_toolchain_dependencies
from bazelrio_gentool.generate_json import generate_json


def main():
    SCRIPT_DIR = os.environ["BUILD_WORKSPACE_DIRECTORY"]
    registry_location = os.path.join(
        SCRIPT_DIR, "..", "..", "..", "bazel-central-registry"
    )

    group = get_toolchain_dependencies()

    module_template = os.path.join(SCRIPT_DIR, "module_config.jinja2")
    module_json_template = None

    os.chdir(SCRIPT_DIR)
    generate_json(registry_location, group, module_json_template, module_template)


if __name__ == "__main__":
    """
    bazel run //:publish
    """
    main()
