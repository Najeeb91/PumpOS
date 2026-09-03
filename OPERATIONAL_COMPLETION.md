# PumpOS V17 — Final Operational Completion

This release completes the operational-control specification for the MVP.

## Core operational chain
Salesman → Shift → Meter → Sales → Collections → Fuel Operations → Expenses → Reconciliation → Lock → Audit → Owner Control

## Completed control rules

### Meter & Fuel Reconciliation
- Opening and closing readings remain tied to machine/nozzle.
- Meter movement is distinguished from commercial fuel sales.
- NAT/Test movement is classified separately and does not become a commercial sale.
- Owner/Internal, Staff, Generator and Other Authorized movements are classified as non-sale movements.
- Unclassified movement remains a variance/exception rather than being silently absorbed.
- Stock reconciliation follows:
  Opening Stock + Receipts − Commercial Sales ± Authorized Movements = Expected Closing Stock.
- Physical dip is compared against expected closing stock.
- Tank/product variances retain reason, actor, time and audit history.

### Delivery Shortage
- Invoice/tanker shortage is a recoverable delivery shortage.
- Current stock receives Net Received only.
- Recovery later adds physical fuel and reduces pending recovery.
- Delivery shortage is not treated as a P&L loss.

### Owner/Internal Transactions
Supported classifications:
- Owner Fuel Use
- Owner Cash Withdrawal
- Staff Fuel Use
- Generator/Internal Consumption
- Other Authorized Movement

These never rewrite unexplained variance.

### Shift Close
- Close Shift remains controlled by the Manager.
- Cash is reconciled using denomination count.
- Expected Cash = Opening Cash + Cash Sales − Cash Expenses/Withdrawals ± approved adjustments.
- Digital collections and actual bank settlement remain distinct.
- Fuel reconciliation and unresolved exceptions prevent a false “reconciled” state.
- Locked records preserve original values and audit history.

### Owner
Owner remains oversight/control:
See → Control → Decide

Owner does not become a second operational data-entry role.

## Release status
This is an MVP operational-completion package. Production deployment still requires environment-specific PostgreSQL credentials, secrets, backups, security review, integration tests and real-device acceptance testing.
