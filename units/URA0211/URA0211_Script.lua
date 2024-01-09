#****************************************************************************
#**
#**  File     :  /cdimage/units/URA0103/URA0103_script.lua
#**  Author(s):  John Comes, David Tomandl
#**
#**  Summary  :  Cybran Bomber Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CAirUnit = import('/lua/defaultunits.lua').AirUnit
local CIFMissileLoaWeapon = import('/lua/cybranweapons.lua').CIFMissileLoaWeapon
local CDFLaserPulseLightWeapon = import('/lua/cybranweapons.lua').CDFLaserPulseLightWeapon

URA0103 = Class(CAirUnit) {
    Weapons = {
        AutoCannon = Class(CDFLaserPulseLightWeapon) {},
        MissileRack = Class(CIFMissileLoaWeapon) {},
        },
    ExhaustBones = {'Exhaust',},
}

TypeClass = URA0103