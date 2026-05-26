#!/usr/bin/env bash

xx_failed() {
    echo -e "\e[31mFailed.\e[0m"
    exit 1
}

pln() {
    printf "\e[34m%b\e[0m\n" "$1"
}

pl() {
    printf "\e[34m%b\e[0m" "$1"
}

pln "Installing eiedouno's caelestia config.\n"

cd "$(dirname "$0")" || xx_failed
pln "[Info] Using $PWD as resource directory."

pln "\e[35m[PRMT] Create a hyprland config backup? (y/n)"
read -rn1 ans
if [[ "$ans" == "y" ]]; then
    pln "\e[2K\e[1G[Info] Saving backup to $HOME/.config/hypr.bak"
    mkdir -p "$HOME/.config/hypr.bak" || xx_failed
    cp -rf "$HOME/.config/hypr" "$HOME/.config/hypr.bak"
else
    printf "\e[2K\e[1G\e[35m[PRMT] Denied, passing\e[0m"
    sleep 0.3
    printf "\e[35m.\e[0m"
    sleep 0.3
    printf "\e[35m.\e[0m"
    sleep 0.3
    printf "\e[35m.\e[0m"
    sleep 0.3
    pln ""
fi

pl "[Info] Copying hypr dotfiles..."
cp -rf "./hyprland" "$HOME/.config/hypr"
pln "\e[32m Done."

pl "[Info] Installing hyprstart..."
cp -f "./hyprstart" "/usr/local/bin/hyprstart"
pln "\e[32m Done."

pln "[PRMT] Override fastfetch.conf? (y/n)"
read -rn1 ans
if [[ "$ans" == "y" ]]; then
    pln "\e[2K\e[1G[Info] Saving backup to $HOME/.config/fastfetch.bak"
    mkdir -p "$HOME/.config/fastfetch.bak" || xx_failed
    cp -rf "$HOME/.config/fastfetch" "$HOME/.config/fastfetch.bak"
else
    printf "\e[2K\e[1G\e[35m[PRMT] Denied, passing...\e[0m"
fi

pln "\n\n\e[32mFinished installing. A restart is required to complete the changes.\n\n\e[35m[PRMT] Restart now? (y/n)"
read -rn1 ans
if [[ "$ans" == "y" ]]; then
    systemctl soft-reboot || xx_failed
else
    printf "\e[2K\e[1G\e[35m[PRMT] Denied, passing...\e[0m"
fi

pln "\n\e[1m\e[32mFinished."
