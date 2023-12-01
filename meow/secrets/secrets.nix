let
  tuhana = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKvcTwV2hXqZcPDWxpNjtNPqcS4qRoP365E6sSdAtw/G tuhana@MateBook-D14";

  meow = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLnivFaWe3dvW8ENzeSlMju6d9y/y1tmGNCbdEMivda meow@NixOS";
in
{
  "./users/meow/password.age".publicKeys = [ tuhana meow ];
}
