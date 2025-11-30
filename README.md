# Season 1

## Melee Weapons Durability
- [ ] Define durability tiers:
  - [ ] Hand Crafted = Normal
  - [ ] Repaired = Low
  - [ ] Commercial Grade = High
- [ ] Override or add new weapon item definitions
- [ ] Adjust repair recipes to reduce durability after repair
- [ ] Add crafting/loot sources for commercial grade weapons
- [ ] Balance sandbox multipliers for durability
- [ ] Test weapon condition loss in combat
- [ ] Verify repair outcomes match design
- [ ] Package mod scripts and metadata

---

## Fences Durability & Panels
- [ ] Define fence durability tiers:
  - [ ] Hand Crafted = Normal
  - [ ] Repaired = Normal
  - [ ] Commercial Grade = High
- [ ] Implement "panel replacement" mechanic to restore commercial durability
- [ ] Add new commercial fence panel item (moveable furniture)
- [ ] Integrate erosion factor (50% reduction at 100% erosion)
- [ ] Add vine wall mechanic:
  - [ ] Maintenance timer
  - [ ] 75% reduction at 100% erosion if unmaintained
- [ ] Test fence placement, damage, and destruction
- [ ] Verify erosion/maintenance updates daily
- [ ] Package mod scripts and metadata

---

## Container Controller (Whitelist Loot All)
- [ ] Create container whitelist system
- [ ] Hook into "Loot All" action
- [ ] Filter items against whitelist during transfer
- [ ] Preserve normal Ctrl-click behavior
- [ ] Add UI for setting whitelist per container
- [ ] Test with multiple container types (crates, lockers, bags)
- [ ] Verify multiplayer sync of whitelist rules
- [ ] Package mod scripts and metadata

---

## Tetris UI Freeze
- [ ] Extend inventory UI (ISInventoryPane)
- [ ] Add "locked slot" property for items
- [ ] Implement auto-return to defined slot
- [ ] Handle overflow gracefully (slot filled → normal placement)
- [ ] Add toggle option for players (enable/disable freeze)
- [ ] Test with common items (ammo, magazines, meds)
- [ ] Verify multiplayer inventory sync
- [ ] Package mod scripts and metadata

# Season 2

## Vanilla Build Menu (Basic Crafting)
- [ ] Preserve vanilla build menu functionality
- [ ] Ensure basic recipes remain accessible everywhere
- [ ] Verify compatibility with other mods that add simple recipes
- [ ] Sandbox option: toggle vanilla build menu visibility for advanced recipes

---

## Contextual Factory Crafting (Advanced Recipes)
- [ ] Define factory categories:
  - [ ] Weapon Factory (guns, ammo)
  - [ ] Furniture Factory (commercial furniture)
  - [ ] Construction Factory (fences, walls, windows, stairs)
  - [ ] Medical Factory (sanitizers, bandages, tools, pills)
  - [ ] Tools Factory (melee weapons, mechanic tools)
  - [ ] Car Manufacturer (car parts)
  - [ ] Foundry Factory (metal production)
  - [ ] Wood Factory (wood production)
- [ ] Create contextual recipe lists for each factory
- [ ] Restrict recipes to proximity of factory machines
- [ ] Reuse crafting UI across all factories
- [ ] Add contextual UI labels/icons for each factory
- [ ] Test input/output logic (materials consumed, products created)
- [ ] Verify multiplayer sync of factory crafting

---

## Randomized Factory Locations
- [ ] Define pool of eligible industrial buildings (warehouses, mills, depots)
- [ ] Implement random assignment of factory roles at world generation
- [ ] Store assignments in ModData for persistence across saves
- [ ] Exclude critical factories (Foundry, Medical) from randomization for balance
- [ ] Ensure distribution logic prevents clustering or extreme distances
- [ ] Add sandbox option to enable/disable randomization
- [ ] Test replayability: verify factory roles change between worlds
- [ ] Verify multiplayer sync of randomized locations

---

## Performance & Stability
- [ ] Limit recipe lists per factory to reduce lag
- [ ] Confirm factory crafting performance matches vanilla crafting
- [ ] Test large recipe sets without crashing
- [ ] Ensure contextual crafting does not interfere with vanilla build menu

---

## Gameplay & Balance
- [ ] Balance resource requirements for commercial grade items
- [ ] Add progression dependencies (e.g., Foundry required for metal recipes)
- [ ] Sandbox option: enable/disable contextual crafting
- [ ] Sandbox option: adjust crafting speed multipliers
- [ ] Playtest immersion (factories feel necessary but not tedious)

# Season 3

## Global Ledger
- [ ] Create global ledger for each item type
- [ ] Track SoldToTrader count (supply inflow)
- [ ] Track BoughtFromTrader count (demand outflow)
- [ ] Store ledger data in ModData for persistence across sessions

---

## Balance Logic
- [ ] Implement rule: if players buy trader stock → traders buy from players
- [ ] Implement rule: if players only sell → traders stop buying (oversupply collapse)
- [ ] Ensure traders only buy items with active demand
- [ ] Sandbox option: adjust supply/demand sensitivity

---

## Dynamic Pricing
- [ ] Define base price for each item
- [ ] Calculate price = BasePrice × (Demand / Supply)
- [ ] Increase price for scarce items
- [ ] Decrease price for oversupplied items
- [ ] Collapse price to zero for exploited items (sold but never bought)

---

## Trader Integration
- [ ] Apply global ledger to all traders equally
- [ ] Sync trader stock across multiplayer
- [ ] Rotate trader inventories based on global supply/demand
- [ ] Sandbox option: adjust trader restock frequency

---

## Performance & Stability
- [ ] Optimize ledger updates to avoid lag
- [ ] Test multiplayer sync of global stock data
- [ ] Verify persistence across server restarts
- [ ] Ensure trader randomization does not conflict with stock system

