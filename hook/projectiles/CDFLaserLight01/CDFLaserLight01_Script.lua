#
# Aeon laser 'bolt'
#
local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
local EffectTemplate = import('/lua/EffectTemplates.lua')

local TurboLaserblueProjectile = Class(SinglePolyTrailProjectile) {

    FxTrails = {

    },
    PolyTrail = '/mods/Future Battlefield Pack Legends/effects/Emitters/Laserred01_emit.bp',

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = EffectTemplate.FireCloudSml02,
    FxImpactNone = EffectTemplate.FireCloudSml02, 
    FxImpactWater = EffectTemplate.WaterSplash01,
    FxImpactUnderWater = {},
}

CDFLaserLight01 = Class(TurboLaserblueProjectile) {}

TypeClass = CDFLaserLight01
