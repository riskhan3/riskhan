# 📱 IndiKhan - Flutter App

Aplikasi mobile untuk pelanggan ISP IndiKhan. Memungkinkan pelanggan untuk melihat paket internet, membayar tagihan, dan membuat tiket dukungan.

## 🛠️ Tech Stack

- **Framework:** Flutter 3.10+
- **State Management:** StatefulWidget (built-in)
- **HTTP Client:** Dio
- **Storage:** Flutter Secure Storage
- **Font:** Manrope (Google Fonts)

## 📚 Documentation

Detailed documentation is available in the `docs/` directory:

- [**System Architecture**](docs/ARCHITECTURE.md) - High-level overview and diagrams.
- [**API Documentation**](docs/API.md) - Backend endpoints and data models.
- [**Design System**](docs/DESIGN_SYSTEM.md) - Colors, typography, and UI guidelines.
- [**Component Hierarchy**](docs/diagrams/component_hierarchy.md) - Widget tree structure.
- [**Navigation Flow**](docs/diagrams/navigation_flow.md) - Screen transition diagram.

## 📋 Prerequisites

Sebelum menjalankan proyek ini, pastikan Anda sudah menginstall:

1. **Flutter SDK** (v3.10 atau lebih baru)
   ```bash
   flutter --version
   ```
   Download: https://docs.flutter.dev/get-started/install

2. **Chrome** (untuk web development)

3. **Android Studio / VS Code** dengan Flutter extension

## 🚀 Setup Instructions

### 1. Clone Repository
```bash
git clone <your-repo-url>
cd indikhan
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Backend URL

Edit file `lib/core/services/api_service.dart`:

```dart
// Untuk development (localhost)
static const String baseUrl = 'http://localhost:3000';

// Untuk production (ganti dengan URL server Anda)
// static const String baseUrl = 'https://api.indikhan.com';
```

### 4. Jalankan Aplikasi

```bash
# Jalankan di Chrome (Web)
flutter run -d chrome

# Jalankan di Android Emulator
flutter run -d android

# Jalankan di iOS Simulator (macOS only)
flutter run -d ios

# List semua devices yang tersedia
flutter devices
```

## 📁 Project Structure

```
indikhan/
├── lib/
│   ├── core/
│   │   ├── services/
│   │   │   └── api_service.dart    # HTTP client & API calls
│   │   ├── theme/
│   │   │   ├── app_colors.dart     # Color palette
│   │   │   ├── app_text_styles.dart # Typography
│   │   │   └── app_theme.dart      # ThemeData
│   │   └── widgets/                # Reusable widgets
│   ├── features/
│   │   ├── auth/                   # Login & Register
│   │   ├── billing/                # Invoice & Payment
│   │   ├── dashboard/              # Home screen
│   │   ├── onboarding/             # Onboarding slides
│   │   ├── profile/                # User profile
│   │   ├── splash/                 # Splash screen
│   │   └── support/                # Report issue
│   └── main.dart                   # App entry point
├── pubspec.yaml                    # Dependencies
└── README.md
```

## 🎨 Design System

### Color Palette (Dark Theme)
| Color | Hex | Usage |
|-------|-----|-------|
| Primary | `#0D968B` | Main accent, buttons |
| Slate 900 | `#0F172A` | Background |
| Slate 800 | `#1E293B` | Cards, surfaces |
| Slate 400 | `#94A3B8` | Secondary text |
| Success | `#22C55E` | Active status, paid |
| Error | `#EF4444` | Overdue, unpaid |

### Typography
- **Font:** Manrope (Google Fonts)
- **Headings:** Bold, 20-28px
- **Body:** Regular, 14-16px
- **Caption:** Regular, 10-12px

## 🔧 Troubleshooting

### Error: Connection refused to backend
- Pastikan backend sudah running di `http://localhost:3000`
- Untuk Android Emulator, gunakan `http://10.0.2.2:3000`

### Error: Flutter SDK not found
```bash
# Tambahkan Flutter ke PATH
export PATH="$PATH:/path/to/flutter/bin"
```

### Error: Dependencies outdated
```bash
flutter pub upgrade
```

## 📱 Screens

1. **Splash Screen** - Logo & loading
2. **Onboarding** - 3 intro slides
3. **Login/Register** - Authentication
4. **Dashboard** - Package info, speed stats, quick actions
5. **Billing** - Invoice list & payment
6. **Profile** - User info & settings
7. **Support** - Report issue form

## 🔗 Backend Integration

Aplikasi ini membutuhkan **indikhan-backend** untuk berjalan. Pastikan backend sudah setup dan running sebelum menggunakan aplikasi.

```bash
# Clone backend
git clone <backend-repo-url>
cd indikhan-backend
npm install
npm run start:dev
```
