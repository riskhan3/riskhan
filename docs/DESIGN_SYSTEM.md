# Design System

IndiKhan uses a specific design system to maintain visual consistency across the application. The design is "Dark Themed" with Slate backgrounds and Teal/Emerald accents.

## Color Palette

The color system is defined in `AppColors` (`lib/core/theme/app_colors.dart`).

### Primary Colors
| Name | Hex | Usage |
|------|-----|-------|
| **Primary** | `#0D968B` | Main brand color, buttons, active states |
| **Primary Light** | `#2DD4BF` | Gradients, highlights |
| **Primary Dark** | `#0F766E` | Pressed states |

### Backgrounds (Slate)
Used for creating depth in the dark theme.

| Name | Hex | Usage |
|------|-----|-------|
| **Slate 900** | `#0F172A` | Main App Background |
| **Slate 800** | `#1E293B` | Cards, Bottom Sheets |
| **Slate 700** | `#334155` | Borders, Dividers |

### Status Colors
| Name | Hex | Usage |
|------|-----|-------|
| **Success** | `#22C55E` | Active, Paid, Online |
| **Error** | `#EF4444` | Overdue, Error, Offline |
| **Warning** | `#EAB308` | Pending, Alert |
| **Info** | `#3B82F6` | Information |

### Gradients
- **Primary Gradient**: Linear form top-left to bottom-right (`Primary` → `PrimaryLight`)
- **Glass Effect**: `Slate800` with 0.7 alpha.

## Typography

The application uses **Manrope** from Google Fonts.

| Style | Size | Weight | Usage |
|-------|------|--------|-------|
| **H1** | 28px | Bold | Main Page Titles |
| **H2** | 24px | Bold | Section Headers |
| **H3** | 20px | SemiBold | Card Titles |
| **H4** | 18px | Bold | Sub-sections |
| **Body Large** | 16px | Normal | Important text |
| **Body** | 14px | Normal | Default text |
| **Caption** | 12px | Normal | Hints, metadata |

## Shadows & Effects

- **Glass Shadow**: Large, soft shadow for floating elements.
- **Card Shadow**: Subtle shadow for elevation in dark mode.
- **Glow Effects**: Used in the Hero Status Card to indicate activity.
