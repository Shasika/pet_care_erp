# Testing Strategy

## Backend critical flows
- Auth + RBAC checks
- Owner + Pet creation
- Consultation + prescription issue
- Admission to discharge
- Invoice creation + payment posting
- Stock movement creation on dispensing/receiving

## Frontend
- Smoke tests for route guards and core pages
- Store + API client tests (Vitest)

## Manual QA checklist
1. Login/logout and role constraints
2. Register owner + pet
3. Book appointment and check in
4. Complete consultation and prescribe medicines
5. Dispense medicines and verify stock reduction
6. Admit, add treatment notes, discharge with summary
7. Generate invoice, collect partial/full payment
8. Validate dashboard/report totals
