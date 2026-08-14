#!/usr/bin/env bash
# Push the legal pages and confirm GitHub Pages is serving them.
#
# Run this AFTER the repo github.com/Mlamoum/chartpedia-legal exists and Pages
# is enabled. Safe to re-run: it pushes whatever is committed and then polls the
# live URLs until they return 200.
set -euo pipefail
cd "$(dirname "$0")"

echo "==> pushing to origin/main"
git push -u origin main

BASE="https://mlamoum.github.io/chartpedia-legal"
echo "==> waiting for Pages to serve (first build can take 1-2 min)"
for i in $(seq 1 40); do
  code=$(curl -s -o /dev/null -w '%{http_code}' "$BASE/terms.html" || true)
  if [ "$code" = "200" ]; then
    echo "==> LIVE after ~$((i*10))s"
    for p in "" terms.html privacy.html; do
      c=$(curl -s -o /dev/null -w '%{http_code}' "$BASE/$p")
      echo "    $c  $BASE/$p"
    done
    exit 0
  fi
  printf '    %ss: HTTP %s\n' "$((i*10))" "$code"
  sleep 10
done
echo "==> still not serving after ~7 min."
echo "    Check Settings > Pages shows: Source=Deploy from a branch, Branch=main, Folder=/ (root)"
exit 1
