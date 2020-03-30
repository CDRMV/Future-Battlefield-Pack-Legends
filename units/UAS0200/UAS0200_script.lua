#****************************************************************************
#**
#**  File     :  /cdimage/units/UAS0201/UAS0201_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Aeon Destroyer Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local ASeaUnit = import('/lua/aeonunits.lua').ASeaUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local ADFCannonOblivionWeapon = AeonWeapons.ADFCannonOblivionWeapon
local AANDepthChargeBombWeapon = AeonWeapons.AANDepthChargeBombWeapon
local AIFArtilleryMiasmaShellWeapon = AeonWeapons.AIFArtilleryMiasmaShellWeapon
local AAAZealotMissileWeapon = AeonWeapons.AAAZealotMissileWeapon


UAS0200 = Class(ASeaUnit) {
    BackWakeEffect = {},
    Weapons = {
        FrontTurret = Class(ADFCannonOblivionWeapon) {},
        BackTurret = Class(AIFArtilleryMiasmaShellWeapon) {},
        DepthCharge = Class(AANDepthChargeBombWeapon) {},
        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
    },
}

TypeClass = UAS0200