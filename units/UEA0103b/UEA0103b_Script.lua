#****************************************************************************
#**
#**  File     :  /cdimage/units/UEA0103/UEA0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Gordon Duclos
#**
#**  Summary  :  Terran Carpet Bomber Unit Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
#
# Terran Bomber Script : UEA0103b
#
local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local TIFCarpetBombWeapon = import('/lua/terranweapons.lua').TIFCarpetBombWeapon

UEA0103b = Class(TAirUnit) {
    Weapons = {
        Bomb = Class(TIFCarpetBombWeapon) {},
    },
}

TypeClass = UEA0103b

