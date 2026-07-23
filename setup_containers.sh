#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Podman Imza Ilkesi Kuruluyor ==="
mkdir -p "$HOME/.config/containers"
cp -a "$SCRIPT_DIR/config/containers/policy.json" "$HOME/.config/containers/policy.json"

echo "=== Distrobox Konteyneleri (Fedora & Kali Linux) Olusturuluyor ==="
distrobox assemble create --file "$SCRIPT_DIR/distrobox.ini"

echo "=== Distrobox kurulumu basariyla tamamlandi! ==="
