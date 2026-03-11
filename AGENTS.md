# AGENTS.md

## Project
Cloud-based Pet Care Hospital Management and ERP system.

## Stack
- Laravel latest
- Vue 3
- JavaScript only
- MySQL
- Tailwind CSS
- Pinia
- Vue Router
- Axios
- Laravel Sanctum
- Redis where helpful

## Architecture
- Modular monolith
- Laravel REST API backend
- Vue SPA frontend
- Thin controllers
- Service-layer business logic
- Form Requests for validation
- API Resources for responses
- Policies / RBAC for authorization
- Transactions for critical workflows
- Audit logging for critical operations

## Business modules
- Auth / RBAC
- Owners
- Pets
- Appointments / Visits
- Consultations / Prescriptions
- Pharmacy
- Admissions / Discharges
- Billing / Payments
- Inventory / Procurement
- ERP / Finance basics
- Reporting
- Settings / Master data

## Rules
- Do not use TypeScript
- Do not use Bootstrap
- Do not use jQuery
- Keep controllers thin
- Use reusable Vue components
- Use consistent API response format
- Add validation for all write endpoints
- Add permission checks for all protected actions
- Add tests for critical flows
- Prefer maintainability over clever abstractions
- Do not leave fake placeholder functionality behind
- Keep the app runnable at all times

## Frontend
- Vue 3 SPA
- Tailwind-based admin UI
- Pinia stores
- Vue Router
- Axios API client with interceptors
- Reusable tables, forms, dialogs, badges, cards
- Loading/error/empty states required

## Backend
- Domain-based modules
- Migrations, factories, seeders
- Clear route grouping
- Services/actions for business logic
- API Resources
- Policies / Gates
- Queue jobs for notifications and heavy tasks

## Quality bar
- Production-ready
- End-to-end workflows must work
- No broken routes or dead buttons
- No incomplete billing if invoices exist
- No incomplete discharge if admissions exist

## Required docs
- README.md
- docs/architecture.md
- docs/modules.md
- docs/api-overview.md
- docs/testing.md
- docs/deployment.md
