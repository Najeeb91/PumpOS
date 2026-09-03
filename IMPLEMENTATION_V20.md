# V20 Implementation Notes

The existing V19 configuration package is the source of truth for the station topology.

When wiring this into the production API:
- Use a single onboarding transaction where practical.
- Create Owner first and make the operation idempotent.
- Persist an onboarding status/progress record so a partially completed setup can resume.
- Never create Manager/Salesman implicitly.
- Team creation must use the same RBAC/user model as normal Users & Roles.
- Station Ready must be derived from required configuration, not a manually editable flag.
- Audit onboarding changes.
- On completion, route Owner to Dashboard.
