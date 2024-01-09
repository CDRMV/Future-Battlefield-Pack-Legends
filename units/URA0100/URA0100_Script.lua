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
local CAAAutocannon = import('/lua/cybranweapons.lua').CAAAutocannon
local CDFLaserPulseLightWeapon = import('/lua/cybranweapons.lua').CDFLaserPulseLightWeapon

URA0100 = Class(CAirUnit) {
    Weapons = {
        AutoCannon = Class(CDFLaserPulseLightWeapon) {},
        AutoCannon2 = Class(CAAAutocannon) {},
        },
    ExhaustBones = {'Exhaust',},
}

TypeClass = URA0100