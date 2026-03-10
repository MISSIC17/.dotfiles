# SwayNC Styling Guide

A comprehensive reference for styling SwayNC (Sway Notification Center) elements based on your configuration files.

## Table of Contents
1. [File Structure](#file-structure)
2. [Understanding the Two CSS Files](#understanding-the-two-css-files)
3. [CSS Class Reference](#css-class-reference)
4. [Common Styling Tasks](#common-styling-tasks)
5. [Debugging & Inspection](#debugging--inspection)
6. [Color Management](#color-management)

---

## File Structure

```
~/.config/swaync/
├── config.json          # Main configuration file
├── style.css            # Your custom styles (copy from /etc/xdg/swaync/style.css)
└── configSchema.json    # Optional schema for validation
```

**Important Commands:**
- Reload config: `swaync-client --reload-config` or `swaync-client -R`
- Reload CSS only: `swaync-client -rs`
- Open GTK Inspector: `GTK_DEBUG=interactive swaync`

---

## Understanding the Two CSS Files

### 1. **Notification Floating Windows** (First CSS File)
Controls the appearance of popup notifications that appear when you receive a notification.

**Key Elements:**
- `.floating-notifications.background` - Container for floating notifications
- `.notification-row` - Individual notification row wrapper
- `.notification-background` - Background of each notification
- `.notification` - The notification content container
- `.notification.critical` - Critical urgency notifications
- `.notification-content` - Inner content wrapper
- `.notification-action` - Action buttons within notifications
- `.close-button` - The X button to close notifications
- `.image` - Notification icon/image
- `.summary` - Notification title/summary
- `.body` - Notification body text
- `.text-button` - Text-based buttons

### 2. **Control Center** (Second CSS File)
Controls the notification center panel that opens when you toggle it.

**Key Elements:**
- `.control-center` - Main control center container
- `.blank-window` - Transparent background window
- `.notification-row` - Notification rows in the center
- `.notification-background` - Background for each notification
- `.notification-group` - Grouped notifications container
- `.notification-group-headers` - Header text for groups
- `.notification-group-icon` - Icon for notification groups
- `.notification-group-collapse-button` - Collapse/expand button
- `.notification-group-close-all-button` - Close all in group button

**Widgets (Control Center):**
- `.widget-title` - Title widget with "Notifications" text
- `.widget-dnd` - Do Not Disturb toggle
- `.widget-buttons-grid` - Grid of custom buttons
- `.widget-mpris` - Media player controls
- `.widget-mpris-player` - Individual player container
- `.widget-mpris-album-art` - Album artwork
- `.widget-mpris-title` - Song title
- `.widget-mpris-subtitle` - Artist name
- `.widget-volume` - Volume slider widget
- `.widget-label` - Custom label widget
- `.widget-menubar` - Menu bar widget

---

## CSS Class Reference

### Notification States
```css
.notification                  /* Normal notification */
.notification.critical         /* Critical urgency */
.notification.low             /* Low urgency */
.notification.normal          /* Normal urgency */
```

### Interactive Elements
```css
.notification-action          /* Action buttons */
.notification-action:hover    /* Hovered action button */
.notification-action:active   /* Clicked action button */
.close-button                 /* Close button */
.close-button:hover          /* Hovered close button */
.close-button:active         /* Clicked close button */
```

### Widget-Specific Classes
```css
/* Do Not Disturb Widget */
.widget-dnd > switch              /* The switch element */
.widget-dnd > switch:hover        /* Hovered switch */
.widget-dnd > switch:checked      /* Active/on state */
.widget-dnd > switch slider       /* The slider knob */

/* Buttons Grid Widget */
.widget-buttons-grid > flowbox > flowboxchild > button       /* Individual buttons */
.widget-buttons-grid > flowbox > flowboxchild > button:hover /* Hovered button */

/* Toggle Buttons */
.widget-buttons-grid button.toggle          /* Toggle button */
.widget-buttons-grid button.toggle.active   /* Active toggle button */

/* Volume Widget */
.widget-volume scale              /* The slider track */
.widget-volume scale trough       /* The unfilled portion */
.widget-volume scale highlight    /* The filled portion */
.widget-volume scale slider       /* The draggable knob */
.widget-volume scale slider:hover /* Hovered slider knob */
.widget-volume scale slider:active/* Dragging slider knob */
```

### Custom Widget Identifiers
When you add custom widgets in `config.json`, you can target them specifically:
```json
// In config.json
"widgets": ["title#MyTitle", "dnd", "notifications"]
```
```css
/* In style.css */
.MyTitle { /* Your custom styles */ }
```

---

## Common Styling Tasks

### 1. Change Notification Background

**Floating Notifications:**
```css
.floating-notifications.background .notification-background {
  background: rgba(38, 28, 48, 0.92);
  border: 1px solid rgba(255, 255, 255, 0.12);
  border-radius: 24px;
}
```

**Control Center:**
```css
.control-center .notification-row .notification-background {
  background-color: rgb(30, 22, 40);
  border-radius: 16px;
}
```

### 2. Style Action Buttons

**Floating Notifications:**
```css
.floating-notifications .notification-action {
  background-color: rgb(30, 22, 40);
  border-radius: 8px;
  margin: 6px;
}

.floating-notifications .notification-action:hover {
  background-color: rgb(42, 34, 56);
  border: 1px solid rgba(255, 255, 255, 0.12);
}
```

**Control Center:**
```css
.control-center .notification-action {
  background: rgba(138, 180, 248, 0.6);
  border-radius: 12px;
}

.control-center .notification-action:hover {
  background: rgb(138, 180, 248);
}
```

### 3. Customize Control Center Panel
```css
.control-center {
  background: rgba(38, 28, 48, 0.45);
  border-radius: 24px;
  border: 1px solid rgba(255, 255, 255, 0.12);
  margin: 18px;
  padding: 12px;
}
```

### 4. Style Critical Notifications
```css
/* Floating */
.floating-notifications .notification.critical {
  border: 2px solid rgb(90, 140, 255);
}

/* Control Center */
.control-center .notification.critical {
  color: rgb(255, 100, 100);
}
```

### 5. Customize Text Appearance
```css
.summary {
  font-weight: 800;
  font-size: 1rem;
  color: rgb(255, 245, 250);
}

.body {
  font-size: 0.8rem;
  color: rgb(255, 245, 250);
}
```

### 6. Style Widget Buttons
```css
.widget-buttons-grid > flowbox > flowboxchild > button {
  margin: 4px 10px;
  padding: 6px 12px;
  background: transparent;
  border-radius: 8px;
}

.widget-buttons-grid > flowbox > flowboxchild > button:hover {
  background: rgb(66, 56, 88);
}
```

### 7. Customize Media Player Widget
```css
.widget-mpris {
  background: rgb(38, 28, 48);
  border-radius: 16px;
  margin: 20px 6px;
}

.widget-mpris-album-art {
  border-radius: 16px;
}

.widget-mpris-title {
  font-weight: 700;
  font-size: 1rem;
}
```

### 8. Style Volume Slider
```css
.widget-volume scale trough {
  min-height: 8px;
  border-radius: 12px;
  background: rgba(160, 130, 160, 0.3);
}

.widget-volume scale highlight {
  background: rgb(138, 180, 248);
}

.widget-volume scale slider {
  background: rgb(138, 180, 248);
  border-radius: 50%;
}

.widget-volume scale slider:hover {
  background: rgb(100, 140, 220);
}
```

---

## Debugging & Inspection

### 1. Open GTK Inspector
```bash
GTK_DEBUG=interactive swaync
```
This opens a live inspector where you can:
- See all CSS classes applied to elements
- Test CSS changes in real-time
- View the widget hierarchy
- Check computed styles

### 2. Enable Debug Messages
```bash
G_MESSAGES_DEBUG=all swaync
```
Shows all debug output including notification details.

### 3. Test CSS Changes
After modifying `style.css`:
```bash
swaync-client -rs
```
This reloads only the CSS without restarting the daemon.

### 4. Inspect Notification Properties
```bash
G_MESSAGES_DEBUG=all swaync
```
When notifications appear, you'll see their properties (app-name, summary, body, urgency, etc.) printed to the terminal.

---

## Color Management

### Using CSS Variables

**Define colors at the top of your file:**
```css
@define-color primary rgb(138, 180, 248);
@define-color background rgba(38, 28, 48, 0.92);
@define-color surface rgb(30, 22, 40);
@define-color hover rgb(42, 34, 56);
@define-color text rgb(255, 245, 250);
```

**Use them throughout:**
```css
.control-center {
  background: @background;
  border: 1px solid @primary;
}

.notification-action:hover {
  background: @hover;
  color: @text;
}
```

### Using Alpha/Transparency
```css
/* Method 1: rgba() */
background: rgba(38, 28, 48, 0.92);

/* Method 2: alpha() function with variable */
background: alpha(@surface, 0.45);

/* Method 3: Define transparent colors */
@define-color transparent-bg rgba(30, 20, 40, 0.75);
```

### Common Color Properties
```css
/* Backgrounds */
background: /* solid color */
background-color: /* solid color */

/* Borders */
border: 1px solid @primary;
border-color: @primary;

/* Text */
color: @text;

/* Shadows */
box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.6);
```

---

## Quick Reference Hierarchy

```
Floating Notifications:
└── .floating-notifications.background
    └── .notification-row
        └── .notification-background
            ├── .close-button
            └── .notification (.critical, .low, .normal)
                ├── .image
                ├── .notification-content
                │   ├── .summary
                │   └── .body
                └── .notification-action

Control Center:
└── .control-center
    ├── .widget-title
    │   └── button (clear all)
    ├── .widget-dnd
    │   └── switch
    ├── .widget-buttons-grid
    │   └── flowbox > flowboxchild > button
    ├── .widget-mpris
    │   └── .widget-mpris-player
    │       ├── .widget-mpris-album-art
    │       ├── .widget-mpris-title
    │       └── .widget-mpris-subtitle
    ├── .widget-volume
    │   └── scale
    │       ├── trough
    │       ├── highlight
    │       └── slider
    └── .notification-row
        └── .notification-background
            └── .notification
```

---

## Tips & Best Practices

1. **Always use variables** for colors to maintain consistency
2. **Test with GTK Inspector** before making permanent changes
3. **Use `swaync-client -rs`** to quickly test CSS changes
4. **Keep specificity in mind** - more specific selectors override general ones
5. **Use transitions** for smooth hover effects: `transition: 200ms;`
6. **Check both files** when styling - floating vs control center
7. **Use border-radius** consistently for a cohesive design
8. **Remember hover states** - they improve user experience
9. **Test all urgency levels** (low, normal, critical) for consistency
10. **Consider accessibility** - ensure sufficient contrast for text

---

## Example: Complete Color Scheme Change

To change your entire theme, update these variables:

```css
/* Dark Purple Theme */
@define-color primary rgb(138, 180, 248);          /* Accent color */
@define-color background rgba(38, 28, 48, 0.92);   /* Main background */
@define-color surface rgb(30, 22, 40);             /* Surface/card background */
@define-color hover rgb(42, 34, 56);               /* Hover states */
@define-color text rgb(255, 245, 250);             /* Primary text */
@define-color text-dim rgb(160, 130, 160);         /* Secondary text */
@define-color border rgba(255, 255, 255, 0.12);    /* Borders */
@define-color error rgb(255, 100, 100);            /* Critical/error */
```

Then reload: `swaync-client -rs`

---

## Config.json Widget Configuration

When adding widgets to your control center, you define them in `config.json`:

```json
{
  "widgets": [
    "title",
    "dnd",
    "notifications",
    "mpris",
    "volume",
    "buttons-grid"
  ],
  "widget-config": {
    "title": {
      "text": "Notifications",
      "clear-all-button": true,
      "button-text": "Clear All"
    },
    "dnd": {
      "text": "Do Not Disturb"
    },
    "buttons-grid": {
      "actions": [
        {
          "label": "󰐊",
          "command": "systemctl poweroff"
        }
      ]
    }
  }
}
```

Each widget gets the CSS class `.widget-{name}` which you can then style in your CSS file.
