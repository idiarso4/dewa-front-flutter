# Skansapung Presensi 📱

Aplikasi presensi berbasis Flutter untuk SMKN 1 Punggelan yang menggunakan teknologi face recognition dan GPS untuk pencatatan kehadiran siswa secara akurat dan efisien.

## ✨ Fitur Utama

- 🔐 **Autentikasi Login** - Login dengan email dan password
- 👤 **Face Recognition** - Pencatatan presensi menggunakan teknologi pengenalan wajah
- 📍 **GPS Tracking** - Validasi lokasi saat presensi
- 🗺️ **Peta Interaktif** - Integrasi OpenStreetMap untuk navigasi
- 📊 **Riwayat Presensi** - Lihat riwayat kehadiran harian, bulanan, dan tahunan
- 🔔 **Notifikasi** - Pengingat jadwal presensi
- 📅 **Jadwal Shift** - Sistem shift kerja yang fleksibel
- 📝 **Pengajuan Izin** - Formulir pengajuan cuti/izin
- 🌙 **Mode Gelap/Terang** - UI yang nyaman di mata

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Bahasa**: Dart
- **State Management**: Provider
- **Dependency Injection**: GetIt
- **Networking**: Dio + Retrofit
- **Local Storage**: Shared Preferences
- **Maps**: Flutter OSM Plugin
- **Location**: Geolocator
- **Face Recognition**: Flutter Face API
- **Notifications**: Flutter Local Notifications
- **Code Generation**: Freezed + JSON Serializable

## 📋 Persyaratan Sistem

- Flutter SDK >= 3.4.3
- Dart SDK >= 3.4.3
- Android Studio / VS Code
- Android SDK (untuk development Android)
- iOS Simulator (untuk development iOS, Mac only)

## 🚀 Instalasi & Setup

### 1. Clone Repository
```bash
git clone https://github.com/idiarso4/dewa-front-flutter.git
cd dewa-front-flutter
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Generate Code (Freezed & Retrofit)
```bash
flutter pub run build_runner build
```

### 4. Konfigurasi Backend URL

**URL Backend Default**: `https://presensi.dewakoding.com`

#### Jika Backend URL Berubah:

1. **Buka file**: `lib/core/constant/constant.dart`
2. **Ubah konstanta**: `BASE_URL`
   ```dart
   const String BASE_URL = 'https://presensi.dewakoding.com'; // Ganti dengan URL baru
   ```
3. **Rebuild aplikasi**:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

> ⚠️ **PENTING**: Pastikan URL backend baru sudah benar dan dapat diakses sebelum mengubah konstanta ini.

### 5. Setup untuk Development

#### Android:
- Pastikan Android SDK terinstall
- Setup device emulator atau connect real device
- Enable USB debugging (untuk real device)

#### iOS (Mac only):
- Install Xcode
- Setup iOS Simulator
- Accept Xcode license: `sudo xcodebuild -license accept`

## 🏃‍♂️ Menjalankan Aplikasi

### Development Mode
```bash
flutter run
```

### Build APK (Android)
```bash
flutter build apk --release
```

### Build IPA (iOS)
```bash
flutter build ios --release
```

### Build untuk Web
```bash
flutter build web --release
```

## 📱 Struktur Aplikasi

```
lib/
├── app/
│   ├── data/           # Data layer (API, Models, Repositories)
│   ├── domain/         # Domain layer (Entities, Use Cases, Repositories)
│   ├── module/         # Feature modules (Entities, Use Cases, Repositories)
│   └── presentation/   # Presentation layer (Screens, Notifiers)
├── core/               # Core utilities (Constants, Helpers, DI, etc.)
└── main.dart           # Entry point
```

## 🔧 Konfigurasi Tambahan

### Permission Setup

Aplikasi memerlukan permissions berikut:

#### Android (`android/app/src/main/AndroidManifest.xml`):
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

#### iOS (`ios/Runner/Info.plist`):
```xml
<key>NSCameraUsageDescription</key>
<string>Dibutuhkan untuk face recognition</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Dibutuhkan untuk validasi lokasi presensi</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Dibutuhkan untuk tracking lokasi</string>
```

### Icon Setup
```bash
flutter pub run flutter_launcher_icons:main
```

## 🐛 Troubleshooting

### Build Issues
1. **Clean project**:
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Regenerate code**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Check Flutter doctor**:
   ```bash
   flutter doctor
   ```

### Backend Connection Issues
- Pastikan URL backend dapat diakses
- Check koneksi internet
- Verify API endpoints di backend

### Face Recognition Issues
- Pastikan permission kamera sudah diberikan
- Test pada device dengan kamera yang baik
- Pastikan pencahayaan cukup

## 📊 API Integration

Aplikasi terintegrasi dengan backend melalui REST API dengan endpoints:

- `POST /auth/login` - Login
- `GET /attendance/today` - Presensi hari ini
- `POST /attendance/checkin` - Check-in presensi
- `GET /schedule` - Jadwal shift
- `POST /leave/request` - Pengajuan izin

## 🤝 Contributing

1. Fork repository
2. Create feature branch: `git checkout -b feature/nama-fitur`
3. Commit changes: `git commit -m 'Add nama-fitur'`
4. Push to branch: `git push origin feature/nama-fitur`
5. Create Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Developer

- **Developer**: Idiarso, S.KOm
- **School**: SMKN 1 Punggelan
- **Contact**: [GitHub Issues](https://github.com/idiarso4/dewa-front-flutter/issues)

## 🙏 Acknowledgments

- Flutter Team untuk framework yang powerful
- OpenStreetMap untuk data peta
- Face SDK providers untuk teknologi face recognition
- SMKN 1 Punggelan untuk dukungan project

---

**Versi**: 1.5.1+7
**Terakhir Update**: Oktober 2025
