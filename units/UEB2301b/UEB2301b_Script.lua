#****************************************************************************
#**
#**  File     :  /units/UEB2301b/UEB2301b_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Heavy Gun Tower Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local TDFLightPlasmaCannonWeapon = import('/lua/terranweapons.lua').TDFLightPlasmaCannonWeapon

UEB2301b = Class(TStructureUnit) {
    Weapons = {
        Gauss01 = Class(TDFLightPlasmaCannonWeapon) {},      
    },
}

TypeClass = UEB2301b