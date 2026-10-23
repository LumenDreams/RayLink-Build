#!/bin/sh
# Adds a macOS build to this repo: copies the DMG into macos/, writes
# macos/SHA256SUMS and fills in the macOS badge, download row, install steps
# and build row of the README (the lines marked <!--mac-...-->).
#
#   sh macos/add-build.sh path/to/RayLink-<version>-<N>-macos.dmg
#
# Make the DMG with `sh tool/package_macos.sh N` in RayLink Desktop. Running
# this again with a newer DMG replaces the old one.
set -eu
dmg=${1:?usage: sh macos/add-build.sh path/to/RayLink-<version>-<N>-macos.dmg}
[ -f "$dmg" ] || { echo "no DMG at $dmg" >&2; exit 1; }
here=$(cd "$(dirname "$0")" && pwd)
readme="$(dirname "$here")/README.md"
name=$(basename "$dmg")
case $name in
  RayLink-*-*-macos.dmg) ;;
  *) echo "expected RayLink-<version>-<N>-macos.dmg, got $name" >&2; exit 1 ;;
esac
rest=${name#RayLink-}
rest=${rest%-macos.dmg}
version=${rest%-*}
number=${rest##*-}

# Notarized DMGs open without a Gatekeeper warning; say so either way.
if spctl -a -t open --context context:primary-signature "$dmg" >/dev/null 2>&1; then
  signed="Universal DMG, signed and notarized"
  gatekeeper=
else
  signed="Universal DMG, not notarized"
  gatekeeper="This build isn't notarized yet, so macOS stops it the first time. Open **System Settings → Privacy & Security**, click **Open Anyway** next to RayLink, then open it again."
fi

for old in "$here"/RayLink-*-macos.dmg; do
  if [ -f "$old" ] && [ "$(basename "$old")" != "$name" ]; then rm -f "$old"; fi
done
[ "$dmg" -ef "$here/$name" ] || cp "$dmg" "$here/$name"
(cd "$here" && shasum -a 256 -b "$name" > SHA256SUMS)
size=$(wc -c < "$here/$name" | awk '{ printf "%.1f MB", $1 / 1000000 }')
url="https://github.com/easyfast2008/RayLink-Build/raw/main/macos/$name"

awk -v version="$version" -v number="$number" -v size="$size" -v url="$url" \
  -v signed="$signed" -v gatekeeper="$gatekeeper" -v date="$(date +%F)" '
  /<!--mac-badge-->/ {
    print "[![macOS](https://img.shields.io/badge/macOS-build%20" number "-000000?style=for-the-badge&logo=apple&logoColor=white)](#macos) <!--mac-badge-->"
    next
  }
  /<!--mac-row-->/ {
    print "| **macOS** | [⬇&nbsp;DMG](" url ") | " size " | macOS 12 or later, Apple silicon and Intel <!--mac-row--> |"
    next
  }
  /<!--mac-build-->/ {
    print "| macOS | " version " | " number " | " date " | " signed " <!--mac-build--> |"
    next
  }
  /<!--mac-install-->/ {
    print
    print "1. Download the DMG, open it and drag **RayLink** into **Applications**."
    print "2. Open RayLink. The first time, it asks for your administrator password once to install its service, which runs the tunnel and the kill switch."
    print "3. To find a QR code on the screen, allow RayLink under **System Settings → Privacy & Security → Screen Recording** when it asks."
    if (gatekeeper != "") { print ""; print gatekeeper }
    skip = 1
    next
  }
  /<!--\/mac-install-->/ { skip = 0 }
  !skip { print }
' "$readme" > "$readme.new"
mv "$readme.new" "$readme"

echo "Added $name ($size). Check README.md, then:"
echo "  git add macos README.md && git commit -m \"macOS $version ($number)\" && git push"
