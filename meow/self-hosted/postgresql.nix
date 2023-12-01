{ ... }: {
    services."postgresql" = {
        enabled = true;

        ensureDatabases = [ "forgejo" ];
    };
}