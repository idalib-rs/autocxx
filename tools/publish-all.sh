#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

MANIFESTS=(
  parser/Cargo.toml
  engine/Cargo.toml
  macro/Cargo.toml
  Cargo.toml
  gen/build/Cargo.toml
)

for manifest in "${MANIFESTS[@]}"; do
  echo "Publishing $manifest"
  cargo publish --manifest-path "$ROOT/$manifest" "$@"
done
