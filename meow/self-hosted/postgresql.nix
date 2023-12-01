{ ... }: {
    services."postgresql" = {
        enable = true;

        ensureDatabases = [ "forgejo" ];
    };
}