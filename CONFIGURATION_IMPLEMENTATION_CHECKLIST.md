# Configuration Implementation Checklist

- [ ] Product CRUD is server-authoritative.
- [ ] Tank CRUD validates capacity/product/status.
- [ ] Dip-chart versions are immutable.
- [ ] Machine/nozzle CRUD validates topology.
- [ ] Opening stock creates an inventory opening layer.
- [ ] Sales validate nozzle → product → tank.
- [ ] Deliveries validate product → tank.
- [ ] Dip reconciliation uses the tank's active chart version.
- [ ] Audit event is written for every material configuration change.
- [ ] Deactivation preserves historical records.
- [ ] Mobile forms are keyboard-safe and use controlled in-screen scrolling.
- [ ] No page-level horizontal scrolling.
- [ ] Destructive/deactivation actions require explicit confirmation.
