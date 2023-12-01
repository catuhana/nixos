let
  meow =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLnivFaWe3dvW8ENzeSlMju6d9y/y1tmGNCbdEMivda meow@NixOS";
  system = 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOIZ2jEFlMcj1Oum35E9GUQbchTeWwHFePDwwX0VGqck root@NixOS";
in { "./users/meow/password.age".publicKeys = [ meow system ]; }
