#!/usr/bin/env bash
# ==============================================================================
# 🛡️ Secureblue Dotfiles & Container Workstation Installer
# License: GNU General Public License v3.0 (GPL-3.0)
# ==============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "======================================================================"
echo "  🛡️  Secureblue Dotfiles & Workstation Setup (GPL-3.0)"
echo "======================================================================"
echo -e "${NC}"

# 1. Podman Imza Ilkesi (Signature Policy) Kurulumu
echo -e "${BLUE}[1/4] Podman imza ilkesi kuruluyor...${NC}"
mkdir -p "$HOME/.config/containers"
if [ -f "$SCRIPT_DIR/config/containers/policy.json" ]; then
    cp -a "$SCRIPT_DIR/config/containers/policy.json" "$HOME/.config/containers/policy.json"
    echo -e "${GREEN}✓ ~/.config/containers/policy.json güncellendi.${NC}"
fi

# 2. Dotfiles & Masaustu Kisayollari Senkronizasyonu
echo -e "${BLUE}[2/4] Dotfiles ve uygulama yapılandırmaları kopyalanıyor...${NC}"

# .config klasorlerini kopyala
mkdir -p "$HOME/.config"
if [ -d "$SCRIPT_DIR/config" ]; then
    cp -a "$SCRIPT_DIR"/config/* "$HOME/.config/"
    echo -e "${GREEN}✓ ~/.config/ dizini güncellendi.${NC}"
fi

# Ana dizin ayar dosyalari (bashrc, zshrc, gtkrc-2.0)
[ -f "$SCRIPT_DIR/bashrc" ] && cp -a "$SCRIPT_DIR/bashrc" "$HOME/.bashrc" && echo -e "${GREEN}✓ ~/.bashrc güncellendi.${NC}"
[ -f "$SCRIPT_DIR/zshrc" ] && cp -a "$SCRIPT_DIR/zshrc" "$HOME/.zshrc" && echo -e "${GREEN}✓ ~/.zshrc güncellendi.${NC}"
[ -f "$SCRIPT_DIR/gtkrc-2.0" ] && cp -a "$SCRIPT_DIR/gtkrc-2.0" "$HOME/.gtkrc-2.0" && echo -e "${GREEN}✓ ~/.gtkrc-2.0 güncellendi.${NC}"

# Uygulama kisayollari ve simgeler (Mullvad vb.)
mkdir -p "$HOME/.local/share/applications" "$HOME/.local/share/icons"
if [ -d "$SCRIPT_DIR/local/share/applications" ]; then
    cp -a "$SCRIPT_DIR"/local/share/applications/* "$HOME/.local/share/applications/" 2>/dev/null || true
fi
if [ -d "$SCRIPT_DIR/local/share/icons" ]; then
    cp -a "$SCRIPT_DIR"/local/share/icons/* "$HOME/.local/share/icons/" 2>/dev/null || true
fi

# Masaustu veritabani ve simge onbellegini guncelle
gtk-update-icon-cache -f "$HOME/.local/share/icons/hicolor" 2>/dev/null || true
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
echo -e "${GREEN}✓ Masaüstü kısayolları ve simgeleri güncellendi.${NC}"

# 3. Distrobox Konteynerlerini (Fedora Dev Station & Kali Linux) Olustur
echo -e "${BLUE}[3/4] Distrobox konteynerleri (Fedora Dev & Kali Linux) oluşturuluyor...${NC}"
if command -v distrobox >/dev/null 2>&1; then
    distrobox assemble create --file "$SCRIPT_DIR/distrobox.ini"
    echo -e "${GREEN}✓ Distrobox konteynerleri kuruldu ve yapılandırıldı.${NC}"
elif command -v flatpak-spawn >/dev/null 2>&1; then
    flatpak-spawn --host distrobox assemble create --file "$SCRIPT_DIR/distrobox.ini"
    echo -e "${GREEN}✓ Distrobox konteynerleri kuruldu (host üzerinden).${NC}"
else
    echo -e "${YELLOW}! Distrobox komutu bulunamadı. Lütfen distrobox kurulu olduğundan emin olun.${NC}"
fi

# 4. Sway Masaustu Yapilandirmasini Canli Yenile
echo -e "${BLUE}[4/4] Masaüstü ortamı yenileniyor...${NC}"
if command -v swaymsg >/dev/null 2>&1; then
    swaymsg reload 2>/dev/null || true
elif command -v flatpak-spawn >/dev/null 2>&1; then
    flatpak-spawn --host swaymsg reload 2>/dev/null || true
fi

echo -e "${CYAN}"
echo "======================================================================"
echo "  🎉 Kurulum Tamamlandı!"
echo "======================================================================"
echo -e "${NC}"
echo -e "Konteynerlere erişmek için:"
echo -e "  - ${YELLOW}distrobox enter fedora${NC}  (Fedora Geliştirici İstasyonu)"
echo -e "  - ${YELLOW}distrobox enter kali${NC}    (Kali Linux Sızma Testi Ortamı)"
echo -e ""
