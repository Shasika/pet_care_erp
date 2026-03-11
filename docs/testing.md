# Testing

## Automated test plan

### Backend (Pest/PHPUnit)
1. Auth login/logout and protected route access.
2. Permission checks for create/update/delete endpoints.
3. Owner + pet creation validation and relationship integrity.
4. Consultation create/finalize flow.
5. Prescription issue reduces stock and writes stock movement.
6. Admission discharge requires summary and writes discharge record.
7. Invoice payment transitions `issued -> partial -> paid`.
8. Payment refund updates balances and logs audit entries.

### Frontend (Vitest)
1. Router guard redirects unauthenticated users.
2. Axios interceptor normalizes API error messaging.
3. Module pages render loading/empty/error states.

## Manual QA regression checklist
- End-to-end scenario from registration to billing and discharge.
- Low-stock alert generation after dispensing.
- Finance summary alignment with invoice/payment records.
- Print layout verification for invoice/prescription/discharge.
