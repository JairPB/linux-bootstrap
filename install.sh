#!/usr/bin/env bash

set -e

echo "Actualizando sistema..."
sudo pacman -Syu --noconfirm

echo "Instalando paquetes oficiales..."
sudo pacman -S --needed --noconfirm $(cat packages.txt)

if ! command -v yay &>/dev/null; then
    echo "Instalando yay..."

    sudo pacman -S --needed git base-devel

    git clone https://aur.archlinux.org/yay.git

    cd yay
    makepkg -si --noconfirm
    cd ..

    rm -rf yay
fi

echo "Instalando paquetes AUR..."
yay -S --needed --noconfirm $(cat aur-packages.txt)

echo "Listo."
