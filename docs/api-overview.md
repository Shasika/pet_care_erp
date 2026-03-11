# API Overview

Base: `/api/v1`

## Auth
- `POST /auth/login`
- `POST /auth/logout`
- `GET /auth/me`

## Owners/Pets
- `GET|POST /owners`
- `GET|PUT|DELETE /owners/{owner}`
- `GET|POST /pets`
- `GET|PUT|DELETE /pets/{pet}`

## Appointments/Visits
- `GET|POST /appointments`
- `POST /appointments/{appointment}/check-in`
- `GET|POST /visits`

## Consultation/Prescription
- `GET|POST /consultations`
- `POST /consultations/{consultation}/prescriptions`

## Pharmacy
- `GET|POST /medicines`
- `POST /pharmacy/issues`
- `POST /pharmacy/issues/{issue}/cancel`

## Admissions/Discharges
- `GET|POST /admissions`
- `POST /admissions/{admission}/transfer`
- `POST /admissions/{admission}/discharge`

## Billing
- `GET|POST /invoices`
- `POST /invoices/{invoice}/payments`
- `POST /payments/{payment}/refund`

## Inventory
- `GET|POST /suppliers`
- `GET|POST /purchases`
- `POST /purchases/{purchase}/receive`

## Finance
- `GET /reports/finance-summary`
- `GET /reports/daily-collections`
