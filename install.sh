#!/usr/bin/env bash
set -euo pipefail

readonly REPO="preon-solutions/preon-brand-identity"
readonly BRANCH="main"
readonly RAW_BASE="https://raw.githubusercontent.com/${REPO}/${BRANCH}"
readonly SKILL_NAME="preon-brand"
readonly CURSOR_SKILLS_DIR="${HOME}/.cursor/skills"
readonly TARGET_SKILL_DIR="${CURSOR_SKILLS_DIR}/${SKILL_NAME}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR=""
LOCAL_SKILL_DIR=""

usage() {
  cat <<EOF
Install the Preon brand Cursor skill (and optional project rule).

Usage:
  ./install.sh [--project PATH]

Options:
  --project PATH   Also install the Preon rule in a product repo
  -h, --help       Show this help

Examples:
  ./install.sh
  ./install.sh --project ../preon-website
  curl -fsSL https://raw.githubusercontent.com/${REPO}/${BRANCH}/install.sh | bash
EOF
}

log() {
  printf '==> %s\n' "$*"
}

fail() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

resolve_local_skill_dir() {
  if [[ -f "${SCRIPT_DIR}/.cursor/skills/${SKILL_NAME}/SKILL.md" ]]; then
    LOCAL_SKILL_DIR="${SCRIPT_DIR}/.cursor/skills/${SKILL_NAME}"
    return 0
  fi

  if [[ -f "${PWD}/.cursor/skills/${SKILL_NAME}/SKILL.md" ]]; then
    LOCAL_SKILL_DIR="${PWD}/.cursor/skills/${SKILL_NAME}"
    return 0
  fi

  LOCAL_SKILL_DIR=""
}

download_skill_file() {
  local relative_path="$1"
  local destination="$2"
  local url="${RAW_BASE}/${relative_path}"

  mkdir -p "$(dirname "${destination}")"
  curl -fsSL "${url}" -o "${destination}"
}

install_skill_from_local() {
  log "Installing skill from local repo: ${LOCAL_SKILL_DIR}"
  mkdir -p "${TARGET_SKILL_DIR}"
  cp "${LOCAL_SKILL_DIR}/SKILL.md" "${TARGET_SKILL_DIR}/SKILL.md"
  cp "${LOCAL_SKILL_DIR}/tokens.md" "${TARGET_SKILL_DIR}/tokens.md"
}

install_skill_from_remote() {
  log "Downloading skill from GitHub: ${REPO}"
  mkdir -p "${TARGET_SKILL_DIR}"
  download_skill_file ".cursor/skills/${SKILL_NAME}/SKILL.md" "${TARGET_SKILL_DIR}/SKILL.md"
  download_skill_file ".cursor/skills/${SKILL_NAME}/tokens.md" "${TARGET_SKILL_DIR}/tokens.md"
}

install_skill() {
  resolve_local_skill_dir

  if [[ -n "${LOCAL_SKILL_DIR}" ]]; then
    install_skill_from_local
  else
    install_skill_from_remote
  fi

  log "Skill installed at ${TARGET_SKILL_DIR}"
}

install_project_rule_from_local() {
  local rules_dir="${PROJECT_DIR}/.cursor/rules"
  local source_rule="${SCRIPT_DIR}/.cursor/rules/preon-brand-template.mdc"

  if [[ ! -f "${source_rule}" && -f "${PWD}/.cursor/rules/preon-brand-template.mdc" ]]; then
    source_rule="${PWD}/.cursor/rules/preon-brand-template.mdc"
  fi

  [[ -f "${source_rule}" ]] || fail "Rule template not found in local repo."

  mkdir -p "${rules_dir}"
  cp "${source_rule}" "${rules_dir}/preon-brand.mdc"
}

install_project_rule_from_remote() {
  local rules_dir="${PROJECT_DIR}/.cursor/rules"

  mkdir -p "${rules_dir}"
  download_skill_file ".cursor/rules/preon-brand-template.mdc" "${rules_dir}/preon-brand.mdc"
}

install_project_rule() {
  [[ -n "${PROJECT_DIR}" ]] || return 0

  PROJECT_DIR="$(cd "${PROJECT_DIR}" && pwd)"
  [[ -d "${PROJECT_DIR}" ]] || fail "Project directory not found: ${PROJECT_DIR}"

  log "Installing project rule in ${PROJECT_DIR}"

  if [[ -n "${LOCAL_SKILL_DIR}" || -f "${SCRIPT_DIR}/.cursor/rules/preon-brand-template.mdc" || -f "${PWD}/.cursor/rules/preon-brand-template.mdc" ]]; then
    install_project_rule_from_local
  else
    install_project_rule_from_remote
  fi

  log "Rule installed at ${PROJECT_DIR}/.cursor/rules/preon-brand.mdc"
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --project)
        [[ $# -ge 2 ]] || fail "--project requires a path"
        PROJECT_DIR="$2"
        shift 2
        ;;
      -h | --help)
        usage
        exit 0
        ;;
      *)
        fail "Unknown option: $1 (use --help)"
        ;;
    esac
  done
}

main() {
  parse_args "$@"
  install_skill
  install_project_rule

  cat <<EOF

Preon brand install complete.

Skill:
  ${TARGET_SKILL_DIR}

Next step in Cursor:
  Ask the agent to create Preon-branded UI or copy and mention the preon-brand skill.

Docs and assets:
  https://github.com/${REPO}
EOF

  if [[ -n "${PROJECT_DIR}" ]]; then
    printf '\nProject rule:\n  %s/.cursor/rules/preon-brand.mdc\n' "${PROJECT_DIR}"
  fi
}

main "$@"
