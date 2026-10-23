# RayLink for macOS

The macOS build is coming soon: a DMG for macOS 12 or later, on Apple silicon and Intel.

## Adding the build

On the Mac, in `RayLink Desktop` (branch `Android-Version`):

```sh
# For a signed and notarized release (skip both for an ad-hoc test build):
export RAYLINK_SIGN_IDENTITY="Developer ID Application: <name> (<TEAMID>)"
export RAYLINK_NOTARY_PROFILE=raylink   # made once: xcrun notarytool store-credentials raylink

sh tool/package_macos.sh 46             # 46: the build number
```

That writes `dist/RayLink-1.0.0-46-macos.dmg`. Then, in this repo:

```sh
sh macos/add-build.sh "../RayLink Desktop/dist/RayLink-1.0.0-46-macos.dmg"
git add macos README.md && git commit -m "macOS 1.0.0 (46)" && git push
```

`add-build.sh` copies the DMG here, writes `SHA256SUMS` and fills in the macOS badge, download link, install steps and build row of the main README. Running it again with a newer DMG replaces the old one.
