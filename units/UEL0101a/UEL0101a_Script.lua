#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0101a/UEL0101a_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Land Scout Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TConstructionUnit = import('/lua/defaultunits.lua').MobileUnit
local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon


UEL0101a = Class(TConstructionUnit) {
    
    Weapons = {
        MainGun = Class(TDFMachineGunWeapon) {
        },
    },

}


TypeClass = UEL0101a
