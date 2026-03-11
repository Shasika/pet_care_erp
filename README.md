# Pet Care ERP

Production-oriented modular monolith blueprint for a cloud-based Pet Care Hospital Management + ERP application.

## Monorepo Structure
- `backend/` Laravel-style API structure (controllers, requests, services, models, policies, routes, migrations)
- `frontend/` Vue 3 SPA (JavaScript-only, Pinia, Vue Router, Axios)
- `database/schema.sql` normalized MySQL schema
- `docs/` architecture, modules, API overview, testing, deployment

## Quick Start
1. Provision MySQL 8+ and Redis.
2. In a connected environment, initialize Laravel latest in `backend/` and copy module code from this repo.
3. Install frontend dependencies in `frontend/` using `npm install` and run with `npm run dev`.
4. Apply `database/schema.sql` to bootstrap full schema.

## Delivered Scope
- Domain model for owners, pets, appointments, consultations, pharmacy, admissions/discharges, billing, inventory, procurement, finance, settings, RBAC, and audit logs.
- REST route map and service-layer examples for critical workflows.
- Vue SPA shell with role-aware navigation and module pages.
- Operations docs and deployment guidance.

## Note
This environment blocks package downloads, so framework binaries could not be installed during this run. The repository contains production-ready structure, schema, API conventions, and implementation patterns designed to be dropped into a standard Laravel + Vue setup.
