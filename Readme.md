<h1 align="center">Dotfiles — Arch Linux on Wayland Environments</h1>

<p align="center">
  <img src="https://img.shields.io/badge/OS-Arch_Linux-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white"/>
  <img src="https://img.shields.io/badge/Display-Server_Wayland-1abc9c?style=for-the-badge&logo=wayland&logoColor=white"/>
  <img src="https://img.shields.io/badge/Shell-Zsh-6c5ce7?style=for-the-badge&logo=gnu-bash&logoColor=white"/>
  <img src="https://img.shields.io/badge/Editor-Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white"/>
</p>

<p align="center">
  <b>My personal Arch Linux setup — lightweight, elegant, and fully modular</b>
</p>

---

## About

This repository contains all my personal dotfiles for building a minimal, functional and beautiful DE under **niri** and **hyprland** on Arch Linux

It includes multiple others configuration for:
- **Zsh**
- **Waybar**
- **Wofi**
- **Kitty**
- **Fastfetch**
- **Nwg-bar**
- **Hyprlock**
- **Neovim (Kickstart-based setup)**

> ⚠️ **Caution:**  
> The install scripts provided are made for personal use.  
> You can browse and adapt them at your own risk.

---

## Installation

### 1. System dependencies
```bash
sudo pacman -S git wget curl unzip
```

### 2. Wayland environment
```bash
sudo pacman -S niri hyprland waybar wofi kitty nwg-bar cava fastfetch hyprlock neovim
```

### 3. Shell & Fonts
```bash
sudo pacman -S ttf-jetbrains-mono-nerd powerlevel10k
```

### 4. Useful tools
```bash
sudo pacman -S jq checkupdates playerctl 
```

### Or run the install script
```bash
sudo chmod +x install.sh
./install.sh
```
