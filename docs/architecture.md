# Architecture

## System overview
Pet Care ERP is designed as a modular monolith: one deployable backend API + one SPA frontend, with strict domain boundaries and shared infrastructure services.

## Backend architecture (Laravel)
- API layer: routes + controllers only for request/response transport.
- Validation/authorization: Form Requests per write endpoint.
- Domain services: workflows (consultation finalization, stock deduction, discharge, invoicing, payment posting).
- Persistence: Eloquent models with foreign keys, indexes, and soft deletes where required.
- Resource layer: API Resources for consistent response envelope and serialization.
- Security: Sanctum session/token auth + RBAC permissions.
- Reliability: transactions for multi-table updates; queue jobs for reminders/alerts.

## Frontend architecture (Vue 3)
- Composition API with JavaScript only.
- Router-based module navigation.
- Pinia stores by module (auth, owners, pets, billing, pharmacy).
- Axios API client with response normalization and centralized error handling.
- Reusable UI primitives: buttons, table cards, state panels.
- UX states mandatory: loading, empty, error.

## Module boundaries
1. Identity/RBAC
2. Owners/Pets
3. Appointments/Visits
4. Consultations/Prescriptions
5. Pharmacy + Stock
6. Admissions/Discharge
7. Billing/Payments/Refunds
8. Procurement/Inventory
9. ERP Finance basics
10. Reporting + Notifications + Settings

## Critical consistency rules
- No stock issue without stock movement.
- No discharge without finalized billing link.
- No payment > invoice balance.
- Every critical mutation writes audit log.
- Every protected route checks permissions.
