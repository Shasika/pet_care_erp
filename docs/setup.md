# Setup

## 1) Prerequisites
- Docker + Docker Compose (recommended)
- OR: PHP 8.3+, Composer, Node 22+, MySQL 8+, Redis

## 2) Clone and configure
```bash
cp backend/.env.example backend/.env
cp frontend/.env.example frontend/.env
```

## 3) Start infrastructure
```bash
docker compose up -d db redis
```

## 4) Install dependencies (connected environment)
```bash
composer install --working-dir=backend
npm install --prefix frontend
```

## 5) Database
- Apply `database/schema.sql`.
- Seed roles/permissions/master-data.

## 6) Run apps
```bash
# Backend
php -S localhost:8000 -t backend/public
# Frontend
npm run dev --prefix frontend
```

## Demo users
- admin@petcare.local / password
- doctor@petcare.local / password
- cashier@petcare.local / password
- pharmacist@petcare.local / password
