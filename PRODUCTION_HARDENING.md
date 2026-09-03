# PumpOS V18 — Production Hardening

## Purpose
Harden the PumpOS MVP for controlled production deployment without changing the locked product workflow.

## Security gates
- Use a strong randomly generated JWT secret.
- Never commit `.env` or production credentials.
- Use HTTPS in production.
- Restrict CORS to the actual PumpOS origin.
- Use least-privilege PostgreSQL credentials.
- Enable PostgreSQL backups and test restoration.
- Keep audit records append-only.
- Rate-limit authentication and sensitive write endpoints at the deployment edge.
- Review role authorization for every mutation endpoint.
- Keep production error responses free of stack traces/secrets.

## Financial integrity gates
- All financial writes must be transactional.
- Use idempotency keys on retryable create operations.
- Never silently convert an unknown shortage into an adjustment.
- Digital collection and bank settlement remain separate states.
- Delivery shortage remains recoverable, not P&L loss.
- Locked shift records must retain original values and audit history.
- Inventory cannot go negative unless an explicit business rule is approved.

## Required acceptance tests
1. Salesman creates sale.
2. Manager verifies sale.
3. Collection is created exactly once on retry.
4. Digital collection does not become bank-settled until settlement is verified.
5. Cash deposit moves control from cash to bank.
6. Delivery shortage reduces Net Received and creates recoverable balance.
7. Recovery increases physical stock and reduces pending recovery.
8. NAT/Test is not counted as commercial sale.
9. Owner/Internal movement is not used to hide variance.
10. Unresolved variance cannot be marked reconciled.
11. Owner can see verified bank balance and P&L.
12. Audit event exists for every material mutation.

## Release rule
Do not call the system production-ready until the above tests pass against a real PostgreSQL instance and real mobile-device acceptance testing has passed.
