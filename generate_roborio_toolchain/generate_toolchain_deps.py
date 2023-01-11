
import os
from generate_roborio_toolchain.get_toolchain_dependencies import get_toolchain_dependencies

from bazelrio_gentool.generate_toolchain import generate_toolchain
# from bazelrio_gentool.generate_module_project_files import generate_module_project_files, MandetoryDependencySettings
# from bazelrio_gentool.clean_existing_version import clean_existing_version
# from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, render_template



def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "dependencies")

    group = get_toolchain_dependencies()
    print(group)

    generate_toolchain(REPO_DIR, group)

    # rules_roborio_toolchain_dep = MandetoryDependencySettings.Setting(0, True)
    # rules_bazelrio_dep = MandetoryDependencySettings.Setting(0, True)

    # mandetory_dependencies = MandetoryDependencySettings(
    #     bcr_branch = "main",
    #     rules_roborio_toolchain=rules_roborio_toolchain_dep,
    #     rules_bazelrio=rules_bazelrio_dep,
    # )

    # # clean_existing_version(REPO_DIR)
    # generate_module_project_files(REPO_DIR, group, mandetory_dependencies)
    # generate_group(output_dir, group)
    
if __name__ == "__main__":
    main()
