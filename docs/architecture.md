# Architecture

## Style
Modular monolith with Laravel REST API backend and Vue 3 SPA frontend.

## Backend Layers
- Controllers: transport only
- Form Requests: validation + authorization
- Services: business logic + transactions
- Policies: RBAC guardrails
- Resources: response normalization
- Models: relational data access

## Frontend Layers
- Router + layout shell
- Pinia stores per domain
- Axios client with interceptors
- Reusable UI primitives (tables/forms/cards/dialogs)

## Cross-cutting
- Audit log for critical actions
- Queue/scheduler for reminders + alerts
- Stock and billing operations wrapped in transactions
- Consistent API envelope:
```json
{ "success": true, "message": "", "data": {}, "meta": {} }
```
