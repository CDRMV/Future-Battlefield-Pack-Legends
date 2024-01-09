#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0104a/UEL0104a_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Mobile Anti-Air Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TLandUnit = import('/lua/defaultunits.lua').MobileUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun

UEL0104a = Class(TLandUnit) {
    Weapons = {
        AAGun = Class(TAALinkedRailgun) {
            FxMuzzleFlashScale = 0.25,
        },
    },

}

TypeClass = UEL0104a