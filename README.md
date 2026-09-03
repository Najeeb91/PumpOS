# PumpOS V16 — Owner Control & Business Intelligence

PumpOS V16 completes the Owner-facing control layer on top of the Salesman and Manager transaction flow.

## Owner Philosophy
See → Control → Decide.

Owner does not enter routine sales, deliveries, meters, dips, NAT, attendance, payroll preparation, or stock movements.

## Owner Areas
- Home — station status, current shift, today's sales, expected cash, bank balance, fuel margin, attention and pending controls.
- Reconciliation — cash variance, shift control status, escalated exceptions, owner decision when required.
- Reports — daily/weekly/monthly business summary, sales, collections, fuel, deliveries and P&L.
- More — Settings & Administration, users/roles, station configuration and audit trail.

## Financial Rules
- Daily/weekly/monthly fuel margin uses realized verified/locked sales margin.
- Operating result = realized fuel margin − actual operating expenses.
- Delivery invoice shortage is recoverable delivery shortage, not P&L loss.
- Bank balance changes only from verified/locked bank transactions.
- Owner decisions are audited and never rewrite the original exception.
- Unknown shortages remain exceptions; owner approval does not disguise the underlying variance.

## Demo Roles
- Owner: 9000000001 / 123456
- Manager: 9000000002 / 123456
- Salesman: 9000000003 / 123456

## Run
```bash
npm install
npm run db:init
npm run db:seed
npm start
```

V16 is an integrated MVP architecture, not a claim of production readiness. Before real financial deployment, add managed PostgreSQL, secrets management, TLS, MFA/OTP, rate limiting, backups, monitoring, migration tooling and full automated integration/E2E tests.
