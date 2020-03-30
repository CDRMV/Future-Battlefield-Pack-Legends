#****************************************************************************
#**
#**  File     :  /cdimage/units/URA0103/URA0103_script.lua
#**  Author(s):  John Comes, David Tomandl
#**
#**  Summary  :  Cybran Bomber Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CAirUnit = import('/lua/cybranunits.lua').CAirUnit
local CAAAutocannon = import('/lua/cybranweapons.lua').CAAAutocannon

URA0200 = Class(CAirUnit) {
    Weapons = {
        AutoCannon2 = Class(CAAAutocannon) {},
        },
    ExhaustBones = {'Exhaust',},
}

TypeClass = URA0200