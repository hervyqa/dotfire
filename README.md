# Data Sains

![img](img.webp)

Konfigurasi minimalis sistem operasi Nixos dengan KDE Plasma Wayland untuk kebutuhan Data Sains.

## Pemasangan

```sh
git clone git@gitlab.com:hervyqa/nixos-config.git
cd nixos-config
```

Ganti variabel dibawah ini sesuai dengan data Anda di `configuration.nix`.

```nix
name = "hervyqa";
fullname = "Hervy Qurrotul Ainur Rozi";
email = "hervyqa@proton.me";
timezone = "Asia/Jakarta";
defaultLocale = "en_US.UTF-8";
extralocale = "id_ID.UTF-8";
```

Timpa ke direktori `/etc/nixos`.

```sh
sudo cp configuration.nix /etc/nixos/ -rfv
```

## Info Mesin

```sh
➜  nix-info -m
 - system: `"x86_64-linux"`
 - host os: `Linux 5.15.89, NixOS, 22.11 (Raccoon), 22.11.1777.cdead16a444`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Nix) 2.11.1`
 - channels(hervyqa): `""`
 - channels(root): `"nixos-22.11"`
 - nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixos`
```

### Pengaturan

| Konfigurasi                               | Deskripsi                                                                                              |
| :---------------------------------------- | :----------------------------------------------------------------------------------------------------- |
| `vm.swappiness = 10;`                     | Nilai swappines.                                                                                       |
| `tmpOnTmpfs = true;`                      | Pengunaan tmpfs.                                                                                       |
| `defaultUserShell = pkgs.fish;`           | Fish sebagai shell utama.                                                                              |
| `auto-optimise-store = true;`             | Optimasi berkas/direktori nix store agar penggunaan disk yang minimal.                                 |
| `allowUnfree = true;`                     | Perizinan memasang aplikasi nonfree.                                                                   |
| `adb.enable = true;`                      | Menyambungkan perangkat Android.                                                                       |
| `dconf.enable = true;`                    | Mengaktifkan tema GTK.                                                                                 |
| `gamemode.enable = true;`                 | Mengaktifkan layanan `gamemode`.                                                                       |
| `java.enable = true;`                     | Lingkungan java.                                                                                       |
| `kdeconnect.enable = true;`               | Fitur kde connect untuk transfer berkas secara intan.                                                  |
| `light.enable = true;`                    | Pengatur kecerahan dengan cli.                                                                         |
| `mtr.enable = true;`                      | Mengaktifkan perkakas diagnosa jaringan.                                                               |
| `neovim.defaultEditor = true;`            | Penyunting teks cli utama adalah neovim.                                                               |
| `enablePlasmaBrowserIntegration = false;` | Menonaktifkan integrasi firefox dengan plasma                                                          |
| `autoLogin.enable = true;`                | Otomatis login saat pertama kali booting.                                                              |
| `dnscrypt-proxy2.enable = true;`          | Mengaktifkan layanan enkripsi dns.                                                                     |
| `earlyoom.enable = true;`                 | Mengaktifkan layanan jika terjadi limit memori.                                                        |
| `mysql.enable = true;`                    | Mengaktifkan layanan mysql basisdata.                                                                  |
| `pipewire.enable = true;`                 | Mengaktifkan layanan pipewire audio.                                                                   |
| `thermald.enable = true;`                 | Mengaktifkan layanan thermald pengatur suhu.                                                           |
| `tlp.enable = true;`                      | Mengaktifkan layanan tlp manajemen baterai.                                                            |
| `doas.enable = true;`                     | Mengaktifkan program doas pengganti sudo.                                                              |
| `sudo.enable = false;`                    | Menghapus program sudo.                                                                                |
| `power-profiles-daemon.enable = false;`   | Menonaktifkan layanan PPD                                                                              |
| `systemd.oomd.enable = false;`            | Menonaktifkan layanan systemd-oom karena sudah menggunakan earlyoom.                                   |
| `defaultSession = "plasmawayland";`       | Plasms Wayland sebagai sesi utama.                                                                     |
| `bluetooth.hsphfpd.enable = true;`        | Mengaktifkan fitur hsphfpd bluetooth.                                                                  |
| `opengl.extraPackages = amdvlk`           | Menambahkan ekstra paket untuk AMD GPU.                                                                |
| `kernelModules = ["amdgpu"];`             | Menggunakan AMDGPU. Anda bisa menghapusnya di `hardware-configuration.nix` bila tidak menggunakan AMD. |
| `system.stateVersion = "22.11";`          | Versi NixOS yang digunakan.                                                                            |

## Data science

### R

Daftar paket `R` yang terinstall ada di bagian `rstudioWrapper.override`:

```sh
rstudioWrapper.override {
  packages = with rPackages; [
    ...
    ]
  }
```

### Python3

Daftar paket `python3` yang terinstall ada di bagian `python3.withPackages`:

```sh
python3.withPackages (
  ps:
    with ps; [
      ...
    ]
  )
```

### Pemrograman lainnya

Selain `R` dan `python3`, juga sudah terdapat `julia`, `rakudo`, dan `scala`

## IDE

### Spyder

Khusus untuk pemrograman python. Paket ini sudah termasuk di bagian `python3.withPackages` diatas dan sudah terintegrasi dengan pustaka pandas, numpy, matplotlib, scikit-learn, dan lain-lain.

### Neovim

Manajemen plugin neovim menggunakan `coc-nvim`. Daftar plugin yang terinstall ada di bagian `neovim.override`:

```sh
neovim.override {
  ...
    packages.myPlugins = with pkgs.vimPlugins; {
      start = [
        ...
    ]
  }
}
```

### VSCodium

Daftar plugin vscodium yang terinstall (configuration.nix):

```sh
vscode-with-extensions.override {
  vscode = vscodium;
  vscodeExtensions = with vscode-extensions; [
    ...
    ]
  }
```

### Lainnya

Selain `spyder`, `vscodium`, `neovim` juga terdapat aplikasi gui lainnya seperti:

- `dbeaver` pengolah basis data.
- `octaveFull` perhitungan numerik matlab.
- `sqlitebrowser` pengolah basis data sqlite.
- `texstudio` pengolah dokumen `LaTex`.
- `paraview` visualisasi data.
- `wxmaxima` perhitungan numerik.

## Lisensi

MIT License

Copyright (c) 2023 Hervy Qurrotul Ainur Rozi
