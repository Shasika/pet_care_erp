# Setup

## Backend (connected environment)
1. Initialize Laravel latest in `backend/`.
2. Copy `backend/app`, `backend/routes`, and SQL/migrations from this repository.
3. Configure `.env` for MySQL, Redis, Sanctum stateful domains.
4. Run migrations/seeders.

## Frontend
1. `cd frontend`
2. `npm install`
3. `npm run dev`

## Demo data
Seed at least roles: admin, doctor, receptionist, pharmacist, cashier, inventory_manager.
