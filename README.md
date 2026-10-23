<div align="center">

<img src="assets/raylink.png" width="112" alt="RayLink">

# RayLink

**Fast, private connections on every device.**

اتصال امن و سریع، روی همه‌ی دستگاه‌ها

<br>

[![Windows](https://img.shields.io/badge/Windows-build%2045-0078D4?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI%2BPHBhdGggZmlsbD0iI2ZmZiIgZD0iTTAgMGgxMS40djExLjRIMHpNMTIuNiAwSDI0djExLjRIMTIuNnpNMCAxMi42aDExLjRWMjRIMHpNMTIuNiAxMi42SDI0VjI0SDEyLjZ6Ii8%2BPC9zdmc%2B)](#windows)
[![Android](https://img.shields.io/badge/Android-build%2045-3DDC84?style=for-the-badge&logo=android&logoColor=white)](#android)
[![Linux](https://img.shields.io/badge/Linux-build%2044-E95420?style=for-the-badge&logo=linux&logoColor=white)](#linux)
[![macOS](https://img.shields.io/badge/macOS-coming%20soon-6E6E73?style=for-the-badge&logo=apple&logoColor=white)](#macos) <!--mac-badge-->

<br>

<img src="assets/desktop.png" width="73%" alt="RayLink on Ubuntu, connected over VLESS REALITY">&nbsp;&nbsp;<img src="assets/android.png" width="23%" alt="RayLink on Android, connected">

</div>

<br>

- **One tap to connect.** Paste or scan VLESS (REALITY too), VMess, Trojan, Shadowsocks and SOCKS links, or add a subscription.
- **Tunnel or proxy.** Send the whole device through a system-wide tunnel, or just use the system proxy. A kill switch blocks traffic if the tunnel drops (Always-on VPN on Android).
- **Smart routing.** Automatic, Global or your own rules.
- **Speaks your language.** 11 languages, among them Persian (فارسی) and Arabic (العربية), right to left.
- **Help built in.** Chat with support from inside the app.

## Downloads

| Platform | Download | Size | Works on |
| :-- | :-- | --: | :-- |
| **Windows** | [⬇&nbsp;Installer&nbsp;(.exe)](https://github.com/easyfast2008/RayLink-Build/raw/main/windows/RayLink-1.0.0-45-windows-x64-setup.exe) | 24.9 MB | Windows 10 (1809) or 11, x64 |
| **Android** | [⬇&nbsp;APK](https://github.com/easyfast2008/RayLink-Build/raw/main/android/RayLink-1.0.0-45-android.apk) | 54.9 MB | Android 7.0 or later, ARM (64 and 32-bit) |
| **Linux** | [⬇&nbsp;.deb](https://github.com/easyfast2008/RayLink-Build/raw/main/linux/raylink_1.0.0-44_amd64.deb) | 21.4 MB | Ubuntu 22.04+, Debian 12+, Mint 21+ |
| | [⬇&nbsp;.rpm](https://github.com/easyfast2008/RayLink-Build/raw/main/linux/raylink-1.0.0-44.x86_64.rpm) | 31.0 MB | Fedora 35+, RHEL / Alma / Rocky 9+ |
| | [⬇&nbsp;AppImage](https://github.com/easyfast2008/RayLink-Build/raw/main/linux/RayLink-1.0.0-44-x86_64.AppImage) | 28.2 MB | Most distributions (glibc 2.34+) |
| | [⬇&nbsp;.tar.gz](https://github.com/easyfast2008/RayLink-Build/raw/main/linux/RayLink-1.0.0-44-linux-x64.tar.gz) | 31.3 MB | Most distributions (glibc 2.34+) |
| **macOS** | *Coming soon* | | macOS 12 or later, Apple silicon and Intel <!--mac-row--> |

## Install

### Windows

1. Download the installer and run it.
2. This build isn't code-signed yet, so SmartScreen may say *“Windows protected your PC”*. Click **More info**, then **Run anyway**.
3. Allow the administrator prompt once. It installs the RayLink service, which runs the tunnel and the kill switch.

To update, run a newer installer over it: your servers and settings stay. To remove RayLink, uninstall it from **Settings → Apps**; the service goes with it.

### Android

1. Download the APK on your phone and open it.
2. If Android asks, let your browser or file manager install apps, then tap **Install**.
3. The first time you connect, accept Android's VPN request.

Every build is signed with the same key, so a newer APK installs over this one and keeps your servers. Signing certificate (SHA-256):

```
8F:68:66:76:09:78:78:A5:3D:26:CC:FC:F1:94:C6:12:50:39:E0:1E:C9:9D:77:CA:73:25:D1:58:18:60:DD:B1
```

### Linux

The packages put the app in `/opt/raylink` and install a small system service, `raylinkd`, that runs the tunnel and the kill switch.

**Ubuntu, Debian, Mint**

```bash
sudo apt install ./raylink_1.0.0-44_amd64.deb
```

**Fedora, RHEL**

```bash
sudo dnf install ./raylink-1.0.0-44.x86_64.rpm
```

**Any distribution: AppImage**

```bash
chmod +x RayLink-1.0.0-44-x86_64.AppImage
./RayLink-1.0.0-44-x86_64.AppImage
```

**Any distribution: tarball**

```bash
tar xzf RayLink-1.0.0-44-linux-x64.tar.gz
./raylink/raylink
```

The AppImage and the tarball install the service on first start: they ask for your password once, or show the one `sudo` command to run. If the AppImage won't start, run it with `--appimage-extract-and-run`.

On GNOME the tray icon needs the *AppIndicator and KStatusNotifierItem Support* extension (Ubuntu ships it). Without a tray, closing the window minimizes RayLink.

To remove it, `sudo apt remove raylink` keeps your servers and settings, `sudo apt purge raylink` removes them too. On Fedora: `sudo dnf remove raylink`.

### macOS

<!--mac-install-->
The macOS build is on its way: a DMG for macOS 12 or later, on Apple silicon and Intel.
<!--/mac-install-->

## Verify a download

Each folder has a `SHA256SUMS` file. Check a download against it:

```bash
sha256sum -c --ignore-missing SHA256SUMS      # Linux, in the download folder
shasum -a 256 RayLink-*.dmg                   # macOS: compare with macos/SHA256SUMS
```

```powershell
Get-FileHash .\RayLink-1.0.0-45-windows-x64-setup.exe   # Windows: compare with windows\SHA256SUMS
```

## Builds

| Platform | Version | Build | Date | Notes |
| :-- | :-- | :-- | :-- | :-- |
| Windows | 1.0.0 | 45 | 2026-10-23 | x64 installer, not code-signed yet |
| Android | 1.0.0 | 45 | 2026-10-23 | Universal APK (arm64-v8a, armeabi-v7a), signed |
| Linux | 1.0.0 | 44 | 2026-10-23 | x64, built on Ubuntu 22.04 and tested on Ubuntu 24.04 |
| macOS | | | | Coming soon <!--mac-build--> |

## Support

In the app, open **Support** (in the sidebar on a desktop, the chat bubble on Android), or write to [support@raylink.app](mailto:support@raylink.app).

<br>

<div align="center"><sub>RayLink © 2026 LumenDreams</sub></div>
