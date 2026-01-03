{
  inputs,
  pkgs,
  system,
  ...
}:
{
  home.packages = with pkgs; [
    (pkgs.php82.withExtensions (
      { enabled, all }:
      [
        # core
        enabled.curl
        enabled.fileinfo
        enabled.mbstring
        enabled.openssl
        enabled.sodium
        enabled.zip

        # MySQL / MariaDB
        enabled.mysqli
        enabled.pdo
        enabled.pdo_mysql

        # PostgreSQL
        enabled.pgsql
        enabled.pdo_pgsql

        # SQLite
        enabled.sqlite3
        enabled.pdo_sqlite
      ]
    ))

    pkgs.php82Packages.composer
  ];
}
