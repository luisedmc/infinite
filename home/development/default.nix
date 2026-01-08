{ config, pkgs, ... }:

let
  php = pkgs.php82.buildEnv {
    extensions =
      { enabled, all }:
      enabled
      ++ (with all; [
        curl
        fileinfo
        mbstring
        mysqli
        openssl
        pdo_mysql
        pdo_pgsql
        pdo_sqlite
        pgsql
        sodium
        sqlite3
        zip
      ]);
  };
in
{
  home.packages = [
    php
    pkgs.php82Packages.composer
  ];
}
