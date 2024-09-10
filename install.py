import os
import re

# Find directories
repo_dir = os.path.dirname(os.path.realpath(__file__))
home_dir = os.path.expanduser("~")
vimrc_path = os.path.join(home_dir, ".vimrc")

# Remove previously added hooks
def vimrc_remove_hooks():
    if os.path.isfile(vimrc_path):
        with open(vimrc_path, "r") as f:
            lines = f.readlines()

        # Find previous hooks.
        remove_ranges = []
        for idx, line in enumerate(lines):
            m = re.search(r"\" NMJ_RC_HOOK_DONT_TOUCH_([0-9]+)", line)
            if m:
                remove_ranges.append((idx, int(m[1])))

        # Remove previous hooks
        for line_idx, offset in reversed(remove_ranges):
            del lines[line_idx:line_idx + offset + 1]

        with open(vimrc_path, "w") as f:
            f.writelines(lines)

# Hook .vimrc
def vimrc_add_hook():
    if os.path.isfile(vimrc_path):
        with open(vimrc_path, "r") as f:
            lines = f.readlines()
    else:
        lines = []

    # Build hook
    config_path = os.path.join(repo_dir, "config.vim")
    hook = [f"so {config_path}\n"]

    # For windows make sure we have also git-shell path injected
    if os.name == "nt":
        config_path = config_path.replace("\\", "/")
        config_path = config_path.replace("C:/", "/c/")

        # Indent previous hook
        hook = [f"    {x}" for x in hook]

        # Add git-shell handling
        hook = [
            "if has(\"unix\")\n",
            f"    so {config_path}\n",
            "else\n",
            *hook,
            "endif\n",
        ]

    # Make sure there's new line separating previous content
    if len(lines) != 0:
        hook.append("\n")

    lines = [
        f"\" NMJ_RC_HOOK_DONT_TOUCH_{len(hook)}\n",
        *hook,
        *lines,
    ]

    with open(vimrc_path, "w") as f:
        f.writelines(lines)

# Run install
if __name__ == '__main__':
    vimrc_remove_hooks()
    vimrc_add_hook()

