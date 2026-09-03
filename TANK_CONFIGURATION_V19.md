# PumpOS V19 — Tank & Fuel Configuration

## Purpose
Create the station's physical fuel topology before operational testing.

## Configuration hierarchy
Station → Products → Tanks → Dip Charts → Machines → Nozzles → Tank/Nozzle Mapping → Opening Stock

## Tank master
Required:
- Tank Number/Name
- Product
- Capacity (L)
- Opening Stock (L)
- Opening Dip (mm)
- Status
- Last Verified Dip
- Last Verification Date/Time

Rules:
- One tank has one configured product at a time.
- Capacity must be positive.
- Opening stock cannot exceed capacity.
- Opening dip must use the selected tank's active dip chart.
- Historical readings are never overwritten.

## Products
Required:
- Product Name
- Short Code
- Active/Inactive
- Selling Rate
- Optional purchase-rate source/configuration

MS/HSD are normal product records, not hard-coded UI assumptions.

## Dip Charts
Each tank has an active calibrated chart version:
- Version
- Effective From
- Created By
- Reason
- Status
- Dip (mm) → Volume (L) calibration points

Rules:
- Chart versions are immutable after activation.
- A new calibration creates a new version.
- The active chart is used for physical-dip conversion.
- Variable increments are supported.
- Dip readings outside the calibrated range require review rather than silent extrapolation.

## Machines and Nozzles
Machine:
- Machine Number/Name
- Status

Nozzle:
- Nozzle Number/Name
- Product
- Source Tank
- Status

A nozzle must map to exactly one configured product/source tank while active.

## Validation
PumpOS must prevent:
- Sale of a product through a mismatched nozzle.
- Sale against an inactive nozzle/machine/tank.
- Opening stock greater than tank capacity.
- Duplicate active nozzle mappings.
- Opening dip conversion against a different tank's chart.
- Closing/operational reconciliation when required topology is incomplete.

## Opening Stock
Opening stock is the initial inventory layer/control balance. It must be traceable to:
- Tank
- Product
- Quantity
- Dip
- Chart Version
- Actor
- Date/Time
- Reason/source

It must not be a generic "stock adjustment".

## Operational dependency
Testing should start only after at least:
1. One active product.
2. One active tank per product.
3. Active dip chart for each tank.
4. At least one active machine/nozzle mapping.
5. Valid opening stock.

This configuration becomes the source of truth for Salesman meter validation, deliveries, stock reconciliation and shift close.
