# Pet Care Hospital Management & ERP

A production-oriented modular monolith implementation package for a cloud-based veterinary hospital and ERP platform.

## Tech stack
- Laravel API backend (latest stable target)
- Vue 3 SPA frontend (JavaScript only)
- Tailwind CSS
- Pinia + Vue Router + Axios
- MySQL 8+
- Redis (queue/cache/session)
- Nginx + PHP-FPM

## Repository layout
- `backend/` API application layer patterns (controllers/requests/services/policies/resources/routes)
- `frontend/` Vue SPA shell + reusable components + module pages + print views
- `database/schema.sql` normalized SQL schema with full business scope entities
- `deploy/` Nginx and container deployment assets
- `docs/` architecture, modules, API, testing, deployment, setup
- `api/openapi.yaml` API contract starter

## Implemented business coverage
- Auth/RBAC model tables and permission-driven request patterns
- Owner and pet data lifecycle
- Appointment/visit and consultation scaffolding
- Prescription issue and stock movement design
- Admission/discharge service patterns
- Billing/payment/refund data model with payment status behavior
- Procurement/inventory + finance ledger schema
- Reporting and settings module surfaces

## Local runtime (connected environment)
```bash
cp backend/.env.example backend/.env
cp frontend/.env.example frontend/.env
composer install --working-dir=backend
npm install --prefix frontend
npm run build --prefix frontend
# run migrations/seeders once Laravel runtime is initialized
```

## Container runtime
```bash
docker compose up -d
```

## Important environment note
This execution environment blocks outbound package downloads (Packagist/GitHub/NPM). As a result, dependency installation and full framework boot could not be executed here. All deliverables were expanded to be implementation-ready and deployment-ready once run in a connected environment.
