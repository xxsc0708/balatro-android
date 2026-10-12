# Android touch layout

User selected larger cards and buttons for easier touch input.

Use 1.08 card dimensions on Android, reduce room padding from (1, 0.7) to (0.65, 0.4), retain original hand/play/joker/consumable horizontal area widths, and enlarge play/discard and sort controls. Keep aspect fit and the existing coordinate conversion: drawing and hit testing both use TILESIZE * TILESCALE. Desktop dimensions remain unchanged.

Acceptance: Android APK builds with prior video-menu and runtime declaration fixes retained. Device checks: select end cards in an eight-card hand, highlight five cards, play/discard, sort, enter shop, open settings; verify controls visible and touch positions correct. Physical device checks must be done by user.
