{ ... }: {
  services.openssh = {
    enable = true;

    banner = ''
                                                __     
                                              /'__`\   
  ___ ___      __    ___   __  __  __      __/\_\L\ \  
/' __` __`\  /'__`\ / __`\/\ \/\ \/\ \    /\_\/_/_\_<_ 
/\ \/\ \/\ \/\  __//\ \L\ \ \ \_/ \_/ \   \/_/_/\ \L\ \
\ \_\ \_\ \_\ \____\ \____/\ \___x___/'     /\_\ \____/
 \/_/\/_/\/_/\/____/\/___/  \/__//__/       \/_/\/___/ 


    '';

    extraConfig = ''
      ClientAliveInterval 600
      ClientAliveCountMax 3
    '';

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
