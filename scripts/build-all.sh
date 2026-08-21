#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

rm -rf site
mkdir -p site

while IFS= read -r workspace; do
  [ -n "$workspace" ] || continue
  case "$workspace" in
    charlas/*)
      slug="${workspace#charlas/}"
      echo "Building $slug"
      bun run --cwd "$workspace" build
      mkdir -p "site/$slug"
      cp -R "$workspace/dist/." "site/$slug/"
      ;;
  esac
done < <(bun -e 'const pkg = await Bun.file("package.json").json(); for (const workspace of pkg.workspaces ?? []) console.log(workspace)')

cp index.html site/index.html
echo "Site assembled in $ROOT_DIR/site"
