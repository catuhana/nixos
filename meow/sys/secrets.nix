{ ... }: {
  age.secrets.meow-password = {
    file = ../../secrets/users/meow/password.age;
    owner = "meow";
  };
}
