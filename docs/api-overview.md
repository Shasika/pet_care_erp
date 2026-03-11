# API Overview

Base URL: `/api/v1`
Envelope:
```json
{ "success": true, "message": "...", "data": {}, "meta": {} }
```

## Auth
- POST `/auth/login`
- POST `/auth/logout`
- GET `/auth/me`

## Owners/Pets
- GET/POST `/owners`
- GET/PUT/DELETE `/owners/{id}`
- GET/POST `/pets`
- GET/PUT/DELETE `/pets/{id}`

## Clinical flow
- POST `/appointments`
- POST `/appointments/{id}/check-in`
- POST `/consultations`
- POST `/consultations/{id}/prescriptions`
- POST `/pharmacy/issues`

## Inpatient flow
- POST `/admissions`
- POST `/admissions/{id}/transfer`
- POST `/admissions/{id}/discharge`

## Billing flow
- POST `/invoices`
- POST `/invoices/{id}/payments`
- POST `/payments/{id}/refund`

## Procurement
- GET/POST `/suppliers`
- GET/POST `/purchases`
- POST `/purchases/{id}/receive`

## Reports
- GET `/reports/dashboard`
- GET `/reports/daily-collections`
- GET `/reports/finance-summary`
- GET `/reports/stock-status`
