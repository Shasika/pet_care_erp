# Deployment Guide

## Runtime
- Nginx
- PHP-FPM 8.3+
- MySQL 8+
- Redis
- Queue worker and scheduler processes

## Release steps
1. Pull code and set environment values from `.env.example`.
2. Install dependencies: `composer install --no-dev`, `npm ci`.
3. Build frontend assets: `npm run build`.
4. Run DB migrations + seeders.
5. Cache framework artifacts (`config:cache`, `route:cache`).
6. Restart workers and health-check API + SPA endpoints.

## Backup strategy
- Daily full DB backup + binary logs.
- Hourly incremental snapshots for critical ops.
- Keep 30-day retention with tested restore runbook.

## Security controls
- TLS termination at reverse proxy.
- Secure headers in Nginx.
- Rotating app keys/secrets through a secret manager.
- RBAC least privilege and audit-log monitoring.
