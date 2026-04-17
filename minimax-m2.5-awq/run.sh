#!/bin/bash
set -e
MOD_DIR="$(pwd)"

# Determine the site-packages path for the Python version in this container
SITE_PACKAGES=$(python3 -c "import site; print(site.getsitepackages()[0])")

echo "--- Installing vetted MiniMaxM2 config plugin into $SITE_PACKAGES ..."
cp -r "$MOD_DIR/minimax_m2_config" "$SITE_PACKAGES/"
# Write the entry-point dist-info so vLLM's plugin loader discovers it
DIST_DIR="$SITE_PACKAGES/minimax_m2_config-1.0.0.dist-info"
mkdir -p "$DIST_DIR"
cat > "$DIST_DIR/METADATA" <<'METADATA'
Metadata-Version: 2.1
Name: minimax-m2-config
Version: 1.0.0
METADATA
cat > "$DIST_DIR/entry_points.txt" <<'EP'
[vllm.general_plugins]
minimax_m2_config = minimax_m2_config:register
EP
echo "=== Done"
