# PumpOS Deployment Checklist

## Recommended Test Deployment
1. Create a managed PostgreSQL database.
2. Run `db/schema.sql` against that database.
3. Deploy this project to Vercel.
4. Set `DATABASE_URL`, `JWT_SECRET`, and `NODE_ENV=production` in Vercel Environment Variables.
5. Open the deployment URL on iPhone Safari.
6. On a fresh database, PumpOS opens the first-install Owner onboarding automatically.

## Important
This package is deployment-ready for the application layer, but it still needs a real managed PostgreSQL database and production secrets. Do not use the development database credentials or development JWT secret for real station data.

## Local Test
```bash
npm install
npm run db:init
npm start
```
Then open `http://localhost:3000`.
