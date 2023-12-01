{ ... }: {
    services."postgresql" = {
        enable = true;
        enableJIT = true;

        ensureUsers = [
            { name = "forgejo"; ensureDBOwnership = true; }
        ];
        ensureDatabases = [ "forgejo" ];
    };
}