let
  gkm = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEOlcxrG2x0tS38ouWo//gPDWtqRGiltzIjLyXmdPTaO";
  void-ptr = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQX7n25x/DQrIrV+OqmrjyUaXPaEaG6X39ocjpG85+S";
  gkm-laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILrW7Y8f1p5EQMXKwYuYdXEia0cFUNs1Mgghutf3KdIJ";
in
{
  "wg0-void-ptr.age" = {
    publicKeys = [
      gkm
      void-ptr
    ];
    armor = true;
  };
  "wg0-gkm-laptop.age" = {
    publicKeys = [
      gkm
      gkm-laptop
    ];
    armor = true;
  };
}
