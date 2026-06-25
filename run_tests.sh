#!/bin/bash
# Test runner for the worktree that ensures correct imports

# Change to worktree directory
cd "$(dirname "$0")"

# Add the src directory to PYTHONPATH
export PYTHONPATH="${PWD}/src:${PWD}:${PYTHONPATH}"

# Resolve Python interpreter: prefer python (honors venv/pyenv), fall back to python3
PYTHON_BIN="${PYTHON_BIN:-$(command -v python || command -v python3 || true)}"
if [[ -z "${PYTHON_BIN}" ]]; then
  echo "error: no python or python3 interpreter found on PATH" >&2
  exit 1
fi

# Run tests with explicit path settings
"${PYTHON_BIN}" -m pytest tests/ "$@"