# Deployment

## Recommended stack
- Nginx
- PHP-FPM 8.3+
- MySQL 8+
- Redis
- Supervisor for queues

## Steps
1. Build frontend assets (`npm ci && npm run build`).
2. Install backend deps (`composer install --no-dev --optimize-autoloader`).
3. Run migrations and seeders.
4. Cache config/routes/views.
5. Start queue workers and scheduler.

## Operational practices
- Daily DB backups
- Weekly restore drill
- Log retention policy
- Monitor queue depth, API latency, DB locks
