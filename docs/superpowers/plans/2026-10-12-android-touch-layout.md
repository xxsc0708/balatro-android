# Android touch layout implementation plan

Goal: Larger touch targets without cropping the landscape game.
Architecture: Use Android-only card and UI metrics; retain logical layout and shared render/input scale.
Tech stack: Lua game assets, LOVE 12, GitHub Actions Android Gradle build.

- Update globals.lua with an Android-only 1.08 card factor.
- Update game.lua room padding and preserve horizontal card-area widths using the unscaled base width.
- Update UI_definitions.lua play/discard minimum width/height and sort touch targets.
- Commit changes atomically, build embedded ARM64 APK, download artifact, check archive digest, copy APK to desktop.
- Report device verification remains pending; user should check hand, shop, settings and touch alignment.
