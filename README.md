# CachyOS + DMS for 2-in-1 Laptops 💻🔄📱

A customized [Hyprland](https://hypr.land) and [DankMaterialShell (DMS)](https://github.com/AvengeMedia/DankMaterialShell) configuration optimized specifically for **2-in-1 convertible laptops and touchscreen tablet mode**.

---

## ✨ Features at a Glance

- 📱 **Native Touchscreen Gestures**: Fluid 3-finger and 4-finger touchscreen gestures powered by [`hyprgrass`](https://github.com/horriblename/hyprgrass).
- 📜 **Infinite Scrolling Layout**: Niri-style horizontal ribbon workflow where windows glide smoothly across the screen.
- ⌨️ **On-Screen Virtual Keyboard**: Fast, responsive on-screen keyboard using `wvkbd` with a one-tap DankMaterialShell bar widget toggle.
- 🎯 **Keyboard & Gesture Synergy**: Arrow key navigation (`Super + Left/Right`) dynamically scrolls off-screen windows into view.
- 🔄 **Touchpad & Touchscreen Parity**: Consistent 3-finger and 4-finger gestures across both touchpad and touchscreen.

---

## 🖐️ Touchscreen Gestures (hyprgrass)

Configured in [`hypr/touch.lua`](hypr/touch.lua):

| Gesture | Action | Description |
| :--- | :--- | :--- |
| **3-Finger Horizontal Swipe** | `scroll_move` | Smooth 1:1 real-time glide across the window ribbon tape |
| **3-Finger Swipe Up** | `close` | Close the active window / app |
| **3-Finger Swipe Down** | `fullscreen` | Toggle fullscreen mode for the active window |
| **4-Finger Swipe Down** | `spotlight` | Toggle DankMaterialShell Spotlight app launcher |
| **4-Finger Swipe Left / Right** | `workspace e+1 / e-1` | Switch to next / previous workspace |
| **1-Finger Long-Press (Border/Gap)** | `resizeWithBorder` | Long-press on window border or gap to drag and resize |

---

## 🖱️ Touchpad Gestures

Configured in [`hypr/dms/binds-user.lua`](hypr/dms/binds-user.lua):

| Gesture | Action |
| :--- | :--- |
| **3-Finger Horizontal** | Smooth ribbon scrolling (`scale = 2.5`) |
| **3-Finger Swipe Up** | Close active window |
| **3-Finger Swipe Down** | Toggle fullscreen |
| **4-Finger Horizontal** | Switch workspaces |

---

## ⌨️ Virtual Keyboard (`wvkbd`)

For tablet mode without a physical keyboard attached:
- Uses **`wvkbd-deskintl`** for lightweight, fast on-screen typing.
- Toggle it instantly from the DMS top bar widget or via shortcut:
  ```bash
  pkill -RTMIN wvkbd-deskintl || wvkbd-deskintl -L 280 &
  ```

---

## 🧭 Key Navigation & Shortcuts

| Keybinding | Action |
| :--- | :--- |
| `Super + Left` | Focus previous window & **scroll it onto screen** |
| `Super + Right` | Focus next window & **scroll it onto screen** |
| `Super + Equal (=)` | Grow active column width by 5% on the ribbon |
| `Super + Minus (-)` | Shrink active column width by 5% on the ribbon |
| `Super + E` | Open Nautilus file manager |
| `Super + Q` | Close focused window |
| `Super + F` | Toggle maximized window |
| `Super + Shift + F` | Toggle true fullscreen |
| `Super + Space` | Open DMS Spotlight app launcher |

---

## 📂 Repository Structure

```text
├── README.md
└── hypr/
    ├── hyprland.lua         # Core Hyprland configuration (Lua, Hyprland 0.55+)
    ├── touch.lua            # Touchscreen gesture definitions (hyprgrass)
    ├── hyprland-gui.lua     # GUI hooks and settings
    ├── xdph.conf            # XDG Desktop Portal Hyprland config
    ├── plugins/
    │   └── hyprgrass.so     # hyprgrass plugin binary
    └── dms/
        ├── binds.lua        # DMS default keybindings
        ├── binds-user.lua   # User custom overrides & touchpad gestures
        ├── colors.lua       # Material You theme colors
        ├── cursor.lua       # Cursor settings
        ├── layout.lua       # Layout definitions
        ├── outputs.lua      # Display / monitor configurations
        └── windowrules.lua  # Application window rules
```

---

## 🚀 Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ateebkch25/Cachy-OS-DMS-For-2-in-1-Laptops.git
   ```

2. **Copy Hyprland configuration:**
   ```bash
   cp -r Cachy-OS-DMS-For-2-in-1-Laptops/hypr/* ~/.config/hypr/
   ```

3. **Install Dependencies:**
   - [Hyprland](https://github.com/hyprwm/Hyprland) (v0.55+ with Lua configuration support)
   - [DankMaterialShell](https://github.com/AvengeMedia/DankMaterialShell)
   - [hyprgrass](https://github.com/horriblename/hyprgrass) (Touchscreen gesture plugin)
   - [wvkbd](https://github.com/jjsullivan5196/wvkbd) (Virtual keyboard)

4. **Reload Hyprland:**
   ```bash
   hyprctl reload config-only
   ```
