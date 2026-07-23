# 🛡️ Secureblue Dotfiles & Container Workstation Setup

This repository contains my personal dotfiles and automated container workstation configurations specifically tailored for **[Secureblue](https://github.com/secureblue/secureblue)** (a hardened Fedora Atomic Linux distribution).

## 🚀 Highlights & Included Configurations

- **Desktop Environment & Window Manager (Sway WM)**:
  - **Sway WM**: Custom keybindings (`Super + Q` to close windows, `Super + Enter` for Foot terminal).
  - **Waybar**: Modern status bar with system metrics and quicklinks.
  - **Foot Terminal**: Wayland-native terminal configuration.
  - **Rofi & SwayNC**: Application launcher and notification center styling.
  - **Starship & Fastfetch**: Cross-shell prompt and system summary tool.

- **Container Workstations (Distrobox & Podman on Secureblue)**:
  - **Fedora Developer Station**: Complete development suite with `rustup`, `gcc`, `clang`, `go`, `node.js`, `python3`, `git`, `gh`, `ripgrep`, `fd`, `fzf`, `btop`, `tmux`.
  - **Kali Linux**: Security suite configured with `kali-tools-top10` and `kali-linux-headless`.
  - **Podman Signature Policy**: Includes `policy.json` to allow pulling rootless container images smoothly under Secureblue's default signature policies.
  - **Automated Manifest (`distrobox.ini`)**: Managed via `setup_containers.sh` using `distrobox assemble`.

---

## 🛠️ Quick Installation on Secureblue

1. **Clone the repository**:
   ```bash
   git clone https://github.com/b4lol/dotfiles.git ~/Belgeler/Projeler/dotfiles
   cd ~/Belgeler/Projeler/dotfiles
   ```

2. **Run Installer (Deploys Dotfiles, Podman Policy & Distrobox Workstations)**:
   ```bash
   ./install.sh
   ```

---

## 📄 License
GNU General Public License v3.0 (GPL-3.0). Free for personal and commercial use under the terms of the GNU GPLv3.
