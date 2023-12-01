{ lib, ... }: {
    services."postgresql" = {
        enable = true;
        enableJIT = true;

        authentication = lib.mkForce ''
            local   all             all                                     trust
            host    all             all             127.0.0.1/32            trust
            host    all             all             ::1/128                 trust
        '';


        ensureUsers = [
            { name = "forgejo"; ensureDBOwnership = true; }
        ];
        ensureDatabases = [ "forgejo" ];
    };
}