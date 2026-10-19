# Changelog - SethTraductorHispano

## [1.6-Loro Edition] - 2026-10-19
### Added
- Nuevo icono oficial Loro + TRANSLATE (Icon.tga 64, Loro.tga 512)
- Frame de bienvenida del Loro movible y auto-cierre
- Sistema de avisador de actualización con popup
- Comando /seth version

### Changed
- BREAKING: Migrado a Interface 16001 (Forever Oficial Blizzard)
- Migrado a API moderna Retail/Forever: SetColorTexture, C_Timer.After
- README totalmente reescrito con badges

### Fixed
- Fix definitivo Shift+Click para copiar links en 16001
- Fix icono verde en lista Addons

## [1.5.1] - 2026-10-15
- Fix inicial copiar links

## [1.5.0] - 2026-10-10
- Traductor base inicial
- # Changelog - SethDetectorFishParry

All notable changes to this project will be documented here.

## [1.9.1] - 2026-10-19 - FINAL PRO ICONS - No Lua Errors
### Added
- Iconos PRO al inicio de cada mensaje:
    - `INV_Misc_Fish_02` para Fish Pull
    - `Ability_Parry` para Parry Haste
    - `Spell_Shadow_ShadowWordDominate` para MC
    - `Ability_Warrior_Cleave` para FAIL
    - `INV_Misc_Horn_03` para CC OK
- Comando `/sdf testparry` y `/sdf testmc`

### Fixed
- Fix `missType` posición correcta en `CombatLogGetCurrentEventInfo`
- Fix `amount` nil check para evitar Lua error en FAIL
- `pcall` en `SendChatMessage` para evitar error sin asist
- `find("Player", 1, true)` plain search para 0 lag
- Limpieza de `lastDamager` y `mindControlled` al morir / salir aura

### Performance
- Todo `local`, 0 globals
- Sin `pairs()` en cada evento, solo en MC (max 3)
- Early `return` por subEvent para no evaluar todo el log

## [1.9.0] - 2026-10-19 - Fish + Parry
### Added
- **FISH - Fish Pull Detector**: Guarda `petGUID -> owner` con `SPELL_SUMMON`
    - Detecta pull con pet para culpar dueño, no al pet
    - `FISH PULL: Brujo via Imp <Brujo>!`
- **PARRY - Parry Haste Detector**: `SWING_MISSED + PARRY`
    - `PARRY FAIL: Tanque parreado por Boss! Haste activado!`

## [1.8.0] - 2026-10-18 - Lady sin biberón
### Added
- **LADY - Sin biberón**: Solo cuenta, no enseña mecánicas
- Pre-aviso: `¡ATENCION! Lady controla en 3s! (0/3)`
- Contador: `MC: Name (1/3) (2/3) (3/3)`
- Tracking de último damager con spell y cantidad
- `MC FAIL: Killer MATO a Victim! Spell 12.3k!`
- `CC en proceso! (x/3)` / `CC OK - DPS Lady`
- Soporte IDs 71289, 71290, 72027, 72028, 73020, 68904

### Changed 

## [1.0.0] - 2026-10-17 - Initial
- Detector base Lady Susurramuerte
- RAID_WARNING + RAID fallback
- 
