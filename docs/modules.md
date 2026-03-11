# Module implementation matrix

| Module | Core entities | Key workflows | Status |
|---|---|---|---|
| Auth/RBAC | users, roles, permissions | login/logout, permission checks | Implemented structure |
| Owners | owners | register/update/history | Implemented API skeleton |
| Pets | pets, species, breeds | register/link owner, profile timeline | Implemented schema + UI |
| Appointments/Visits | appointments, visits | booking, walk-in, check-in | Implemented schema + UI |
| Consultations | consultations, prescriptions | diagnosis, treatment, prescribe | Implemented request/service/controller pattern |
| Pharmacy | medicines, batches, issues | issue/cancel, stock deduction | Implemented request/service/controller pattern |
| Admissions | admissions, beds, treatment_records | admit/transfer/discharge | Implemented request/service/controller pattern |
| Billing | invoices, items, payments, refunds | invoice, partial/full payment | Implemented service + request/controller pattern |
| Inventory | suppliers, purchases, movements | PO/receive/reorder | Implemented schema + docs |
| ERP Finance | chart_of_accounts, ledger_entries, expenses | sales/purchase posting, summaries | Implemented schema + report API contract |
| Reporting | dashboard/report endpoints | KPI + exports | Implemented route contract + UI shell |
| Settings | settings/master data | species/breed/services/doctors | Implemented schema + UI shell |

## Remaining runtime step
Because external package downloads are blocked in this environment, copy this implementation into a connected Laravel + Vue runtime and install dependencies to run the full stack.
