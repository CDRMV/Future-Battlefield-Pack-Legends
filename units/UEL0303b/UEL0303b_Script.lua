#****************************************************************************
#**
#**  File     :  /units/UEL0303b/UEL0303b_script.lua
#**  Author(s):  Resin_Smoker
#**
#**  Summary  :  UEF Siege Assault Bot Script (With Napalm Launcher)
#**
#**  Copyright © 2009, 4th-Dimension
#****************************************************************************

local TerranWeaponFile = import('/lua/terranweapons.lua')
local TWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit
local TDFHeavyPlasmaCannonWeapon = TerranWeaponFile.TDFHeavyPlasmaCannonWeapon
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher

UEL0303b = Class(TWalkingLandUnit) {

    Weapons = {
        HeavyPlasma = Class(TDFHeavyPlasmaCannonWeapon) {
            DisabledFiringBones = {
                'Torso', 'ArmR_B02', 'Barrel_R', 'ArmR_B03', 'ArmR_B04',
                'ArmL_B02', 'Barrel_L', 'ArmL_B03', 'ArmL_B04',
            },
        },
        Missile_Pod = Class(TSAMLauncher) {},
    },      
}
TypeClass = UEL0303b