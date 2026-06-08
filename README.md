# gkm's NixOS infrastructure

## Hosts
- void-ptr
- gkm-laptop

## Users
- gkm

### Reading E-mail
```bash

export BW_SESSION="$(bw unlock --raw)" # Unlock the bitwarden vault.
systemctl stop wg-quick-wg0 # Stop the VPN. Can't send mail through it.
mbsync -a # Sync the mail.

aerc # Read the mail.

msmtp-queue -r # Send pending email.
mbsync -a
bw lock
systemctl start wg-quick-wg0
```
