#****************************************************************************
#**
#**  File     :  /cdimage/units/URA0103/URA0103_script.lua
#**  Author(s):  John Comes, David Tomandl
#**
#**  Summary  :  Cybran Bomber Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon
local AAASonicPulseBatteryWeapon = import('/lua/aeonweapons.lua').AAASonicPulseBatteryWeapon

UAA0100 = Class(AAirUnit) {
    Weapons = {
        AutoCannon = Class(ADFLaserLightWeapon) {},
        AutoCannon2 = Class(AAASonicPulseBatteryWeapon) {},
        },
    ExhaustBones = {'Exhaust',},
}

TypeClass = UAA0100