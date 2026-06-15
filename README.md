# gkm's NixOS infrastructure

## Hosts
- void-ptr
- gkm-laptop

## Users
- gkm

### Reading E-mail

```bash
systemctl stop wg-quick-wg0 # Stop the VPN. Can't send mail through it.
mbsync -a # Sync the mail.

aerc # Read the mail.

msmtp-queue -r # Send pending email.
mbsync -a
systemctl start wg-quick-wg0
```

## Locked in
- Keyboard layout: US Qwerty + Turkish Q
- OS: NixOS
- File system: btrfs
- Snapshots: btrbk
- Backups: restic
- Window manager: sway
- Terminal: foot
- File manager: yazi
- Text editor: neovim
- Program launcher: dmenu
- Web browser: google-chrome
- Polkit agent: lxqt-policykit-agent
- Notification daemon: mako
- Sending email: msmtp
- Email sync: isync
- Email queue: msmtp-queue
- Email encryption: gpg
- QR code generator: qrencode
- QR code reader: zbar
- IRC bouncer: soju
- Container runtime: podman
- Image viewer: imv
- Password manager: Bitwarden, pass
- Media player: mpv
- Fetch: fastfetch
- Version control: git
- Version control UI: lazygit
- Secret management: sops-nix
- Screenshots: grimshot
- RSS reader: newsboat
- Brightness control: brightnessctl
- Remote management: ssh
- IRC client: senpai
- NixOS deployment: nixos-rebuild
- Volume control: wpctl
- Mail user agent: aerc
- Shell: bash
- Bar: waybar
- Office suite: Google docs
- Note taking: Obsidian
- Config structure: den
- Clipboard manager: wl-clip-persist

## To try out
### Ricing
- GTK / Qt theme
- Color scheme
- Cursor theme
- Icon theme

### Secret management
- Encrypt the ssh key somehow
- Encrypt the secure boot key
- Maybe use age keys instead of reusing host/user ssh keys
- FDE

### GUI
- bemenu
- wofi
- swayidle
- swaylock
- Screen capture
- Xdg portal
- Proper subpixel rendering
- Display manager
- Logout dialog
- Make the bitwarden password authentication dialog float
- gpg-agent pinentry

### Shell
- fzf
- Directory jumper
- mosh
- tmux
- direnv + nix-direnv
- devenv
- Calendar / contacts sync

### Audio
- Realtime audio
- Audio routing
- Microphone noise cancellation

### System
- zram
- Deployment strategy
- Impermanence
- Don't forward the SMTP port to wireguard, don't forward reddit to wireguard
