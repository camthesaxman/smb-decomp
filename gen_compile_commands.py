#!/usr/bin/env python3

from pathlib import Path
import json


def main():
    cmds = []
    script_dir = Path(__file__).parent.resolve()
    for src_path in (script_dir / "src").iterdir():
        if not src_path.suffix == ".c":
            continue

        command = (
            "/usr/bin/cc "
            f"-I {script_dir} -I {script_dir / 'include'} "
            "-m32 -std=c99 "
            "-D __GNUC__ -D NONMATCHING -D MATHUTIL_C_ONLY "
            f"-c {src_path} -o {src_path.with_suffix('.o')}"
        )
        cmds.append(
            {
                "directory": str(script_dir),
                "command": command,
                "file": str(src_path),
            }
        )

    with open(script_dir / "compile_commands.json", "w") as f:
        json.dump(cmds, f, indent=4)


if __name__ == "__main__":
    main()
