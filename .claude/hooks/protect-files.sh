#!/bin/bash
# protect-files.sh
#
# PreToolUse hook (Edit|Write): blocks writes to protected files.
# Make executable: chmod +x .claude/hooks/protect-files.sh

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

[ -z "$FILE_PATH" ] && exit 0

BASENAME=$(basename "$FILE_PATH")

# Protected file names — matched exactly so files like .env.example or
# environments.ts stay editable. .env.* variants (e.g. .env.local) are
# blocked too, except *.example templates.
if [[ "$BASENAME" == "package-lock.json" || "$BASENAME" == ".env" ]] ||
  [[ "$BASENAME" == .env.* && "$BASENAME" != *.example ]]; then
  echo "Blocked: $FILE_PATH matches protected file '$BASENAME'" >&2
  exit 2
fi

# Anything inside a .git directory
if [[ "/$FILE_PATH/" == */.git/* ]]; then
  echo "Blocked: $FILE_PATH is inside a .git directory" >&2
  exit 2
fi

exit 0
