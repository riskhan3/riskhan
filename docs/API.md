# API Documentation

The application interfaces with the backend services using `Dio`. Below is the documentation of the available endpoints as defined in `ApiService`.

## Base URL
- Development: `http://localhost:3000` (or `http://10.0.2.2:3000` for Android emulator)
- Production: `https://riskhan-backend-production.up.railway.app`

## Authentication (`/auth`)

### Login
- **Endpoint**: `POST /auth/login`
- **Body**:
  ```json
  {
    "email": "user@example.com",
    "password": "password123"
  }
  ```
- **Response**: JWT Access Token

### Register
- **Endpoint**: `POST /auth/register`
- **Body**:
  ```json
  {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password123",
    "phone": "08123456789",
    "address": "Jl. Merdeka No. 1"
  }
  ```

### Get Profile
- **Endpoint**: `GET /auth/profile`
- **Headers**: `Authorization: Bearer <token>`
- **Response**: User profile object

## Billing (`/billing`)

### Get Invoices
- **Endpoint**: `GET /billing/invoices`
- **Headers**: `Authorization: Bearer <token>`
- **Response**: List of invoice objects

## Tickets (`/tickets`)

### Get Tickets
- **Endpoint**: `GET /tickets`
- **Headers**: `Authorization: Bearer <token>`
- **Response**: List of support tickets

### Create Ticket
- **Endpoint**: `POST /tickets`
- **Headers**: `Authorization: Bearer <token>`
- **Body**:
  ```json
  {
    "subject": "Internet Slow",
    "description": "Connection is dropping frequently",
    "category": "technical"
  }
  ```
