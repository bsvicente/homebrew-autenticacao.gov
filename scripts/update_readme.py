#!/usr/bin/env python3
"""Regenerate the version block in README.md from the casks in Casks/.

The block sits between the markers below. Everything outside the markers is
hand-written and left untouched.
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
README = ROOT / "README.md"
CASKS = ROOT / "Casks"
START = "<!-- casks:start -->"
END = "<!-- casks:end -->"
PINNED_RE = re.compile(r"^autenticacao-gov@(\d+(?:\.\d+)*)\.rb$")


def cask_version(path: Path) -> str:
    """Return the marketing version (the part before the comma) of a cask."""
    match = re.search(r'^\s*version "([^"]+)"', path.read_text(encoding="utf-8"), re.M)
    if not match:
        sys.exit(f"error: no version found in {path}")
    return match.group(1).split(",")[0]


def version_key(version: str) -> tuple:
    return tuple(int(part) for part in version.split("."))


def build_block() -> str:
    latest = cask_version(CASKS / "autenticacao-gov.rb")

    pinned = []
    for path in CASKS.glob("autenticacao-gov@*.rb"):
        match = PINNED_RE.match(path.name)
        if match:
            pinned.append(match.group(1))
    pinned.sort(key=version_key, reverse=True)

    lines = [
        f"Latest stable: **{latest}** (`brew install --cask autenticacao-gov`).",
        "",
        "| Version | Install |",
        "|---|---|",
    ]
    lines += [f"| {v} | `brew install --cask autenticacao-gov@{v}` |" for v in pinned]
    return "\n".join(lines)


def main() -> None:
    text = README.read_text(encoding="utf-8")
    pattern = re.compile(re.escape(START) + r".*?" + re.escape(END), re.S)
    if not pattern.search(text):
        sys.exit(f"error: markers {START} / {END} not found in README.md")

    block = f"{START}\n{build_block()}\n{END}"
    README.write_text(pattern.sub(lambda _: block, text, count=1), encoding="utf-8")


if __name__ == "__main__":
    main()
