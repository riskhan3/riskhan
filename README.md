# 🌐 IndiKhan Backend

Backend API untuk aplikasi IndiKhan - Sistem Manajemen Pelanggan ISP.

## 🛠️ Tech Stack

- **Framework:** NestJS 11
- **Database:** PostgreSQL
- **ORM:** Prisma
- **Authentication:** JWT + Passport

## 📋 Prerequisites

Sebelum menjalankan proyek ini, pastikan Anda sudah menginstall:

1. **Node.js** (v18 atau lebih baru)
   ```bash
   node --version
   ```

2. **PostgreSQL** (v14 atau lebih baru)
   - Download: https://www.postgresql.org/download/

3. **npm** atau **yarn**

## 🚀 Setup Instructions

### 1. Clone Repository
```bash
git clone <your-repo-url>
cd indikhan-backend
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Setup Environment Variables
```bash
# Copy file .env.example ke .env
cp .env.example .env

# Edit .env sesuai konfigurasi database Anda
```

Isi file `.env`:
```env
DATABASE_URL="postgresql://USERNAME:PASSWORD@localhost:5432/indikhan?schema=public"
JWT_SECRET="your-super-secret-key"
PORT=3000
```

### 4. Setup Database

```bash
# Buat database di PostgreSQL
# Buka psql atau pgAdmin, lalu jalankan:
CREATE DATABASE indikhan;

# Jalankan migrasi Prisma
npx prisma migrate dev --name init

# (Optional) Buka Prisma Studio untuk melihat data
npx prisma studio
```

### 5. Jalankan Server

```bash
# Development mode (dengan hot-reload)
npm run start:dev

# Production mode
npm run build
npm run start:prod
```

Server akan berjalan di: **http://localhost:3000**

## 📚 API Documentation

Swagger UI tersedia di: **http://localhost:3000/api**

### Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register user baru |
| POST | `/auth/login` | Login, return JWT token |
| GET | `/auth/profile` | Get user profile (Protected) |
| GET | `/billing/invoices` | List user invoices (Protected) |
| POST | `/billing/invoice` | Create invoice (Admin) |
| GET | `/tickets` | List user tickets (Protected) |
| POST | `/tickets` | Create support ticket (Protected) |

## 🗄️ Database Schema

```
User ─────────┬───── Subscription ───── Invoice
              │
              └───── Ticket
```

- **User:** id, email, password, name, phone, address, role
- **Subscription:** packageName, speedMbps, price, status
- **Invoice:** amount, month, year, dueDate, status
- **Ticket:** category, subject, description, status

## 🔧 Troubleshooting

### Error: Connection refused
- Pastikan PostgreSQL sudah running
- Cek DATABASE_URL di file .env

### Error: Database does not exist
```bash
# Buat database manual via psql
psql -U postgres
CREATE DATABASE indikhan;
```

### Error: Prisma Client not generated
```bash
npx prisma generate
```

## 📁 Project Structure

```
indikhan-backend/
├── prisma/
│   └── schema.prisma      # Database schema
├── src/
│   ├── auth/              # Authentication module
│   ├── billing/           # Billing/Invoice module
│   ├── prisma/            # Prisma service
│   ├── tickets/           # Support tickets module
│   ├── users/             # Users module
│   ├── app.module.ts      # Main app module
│   └── main.ts            # Entry point
├── .env.example           # Environment template
├── package.json
└── README.md
```
