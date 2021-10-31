XFCE Panel Settings
---
### Basic Settings:
Mode: Deskbar\
Lock Panel: Yes\
Row size: 33\
Length: 96%\
Automaticly increase length: No\
Adjust Icons size automatically: Yes

### Items/Plugins:
*Disclaimer: to get the same result, you need to edit gtk.css because classes name might be different*

- Whisker Menu
* For Workspace Switcher (use wmctrl package to for the command)
  - Launcher
  - Launcher
  - Launcher
  - Launcher
- Separator (Transparent, Expand)
- Status Tray Plugin (Icon 22px, Arrange Item in single row)
- PulseAudio Plugin
- Generic Monitor (Command: bash /home/username/.config/genmon/datetime.sh, 60.0s, Noto Sans Bold 11)
- Action Buttons (Apparance: Action Buttons, Action: Shutdown)

Another Note: For Workspace Switcher you can just use Workspace Switcher Plugin and set the Workspace name/label to Glyph icon from nerd font, row to 4. and uncomment Line 31-37 & 79-94 in gtk.css
