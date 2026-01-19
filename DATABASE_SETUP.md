# Panduan Instalasi PostgreSQL untuk Windows

Ikuti langkah-langkah ini untuk menginstall database PostgreSQL di laptop Anda.

## 1. Download Installer
1. Buka link ini: [Download PostgreSQL untuk Windows](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads).
2. Klik tombol **Download** pada baris versi terbaru (misalnya versi 16 atau 15).

## 2. Proses Instalasi
1. Buka file `.exe` yang sudah didownload.
2. Klik **Next** pada layar awal.
3. **Installation Directory**: Biarkan default (klik Next).
4. **Select Components**: Pastikan semua dicentang (PostgreSQL Server, pgAdmin 4, Stack Builder, Command Line Tools). Klik Next.
5. **Data Directory**: Biarkan default (klik Next).
6. **Password** (PENTING!):
   - Masukkan password (misal: `root` atau `123456`).
   - **CATAT password ini!** Anda akan membutuhkannya untuk file `.env`.
   - Konfirmasi password, lalu klik Next.
7. **Port**: Biarkan default `5432`. Klik Next.
8. **Advanced Options**: Biarkan default (Locale). Klik Next.
9. Terus klik **Next** sampai proses instalasi dimulai.
10. Tunggu sampai selesai, lalu klik **Finish**. (Jika muncul kotak centang "Stack Builder", hilangkan centang saja, tidak perlu dijalankan sekarang).

## 3. Buat Database IndiKhan
Setelah install selesai, kita perlu membuat database kosong bernama `indikhan`.

1. Tekan tombol **Windows**, cari dan buka aplikasi **pgAdmin 4**.
2. Di sebelah kiri, klik **Servers** > **PostgreSQL 16**.
3. Masukkan password yang tadi Anda buat.
4. Klik kanan pada **Databases** > **Create** > **Database...**
5. Di kolom "Database", ketik: `indikhan`
6. Klik **Save**.

## 4. Update Project Backend
1. Kembali ke VS Code.
2. Buka file `.env` di folder `indikhan-backend`.
3. Update baris `DATABASE_URL` sesuai password Anda:

```env
# Ganti PASSWORD_ANDA dengan password yang Anda buat di langkah 2 tadi.
DATABASE_URL="postgresql://postgres:PASSWORD_ANDA@localhost:5432/indikhan?schema=public"
```

Contoh jika password Anda adalah `123456`:
```env
DATABASE_URL="postgresql://postgres:123456@localhost:5432/indikhan?schema=public"
```

## 5. Finalisasi
Buka terminal VS Code di folder `indikhan-backend`, lalu jalankan:

```bash
npx prisma generate
```

Jika sukses, database Anda siap digunakan!
