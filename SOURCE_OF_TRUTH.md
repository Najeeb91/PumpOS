# PumpOS — Source Of Truth

This package is the consolidated PumpOS production candidate.

## Intended Repository

`Najeeb91/PumpOS`

## Runtime

- Vercel serverless deployment
- Neon PostgreSQL
- Node.js / Express API
- Mobile-first single-page UI

## First-Install Flow

Install → Create Owner → Station Details → Products → Tanks → Machines & Nozzles → Optional Team Setup → Station Ready → Owner Dashboard

Owner is mandatory on first install. Manager and Salesman are optional and can be added later through Users & Roles.

## Important

`.env` is not included. Configure the production `DATABASE_URL` and `JWT_SECRET` in Vercel. Never commit database passwords or secrets to GitHub.
