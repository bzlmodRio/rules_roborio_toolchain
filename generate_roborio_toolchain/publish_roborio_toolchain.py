import os
from get_toolchain_dependencies import get_toolchain_dependencies
from bazelrio_gentool.generate_json import generate_json


def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    registry_location = os.path.join(SCRIPT_DIR, "..", "..", "bazel-central-registry")
    print(registry_location)
    print(os.path.exists(registry_location))

    group = get_toolchain_dependencies()

    module_template = os.path.join(SCRIPT_DIR, "module_config.jinja2")
    module_json_template = os.path.join(SCRIPT_DIR, "module_config.json.jinja2")
    print(module_json_template)

    os.chdir(SCRIPT_DIR)
    generate_json(registry_location, group, module_json_template, module_template)


if __name__ == "__main__":
    """ 
    bazel run @rules_roborio_toolchain//generate_roborio_toolchain:publish_roborio_toolchain --enable_bzlmod
    """
    main()
