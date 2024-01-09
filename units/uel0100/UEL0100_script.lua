#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0307/UEL0307_script.lua
#**  Author(s):  David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Mobile Shield Generator Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TConstructionUnit = import('/lua/defaultunits.lua').ConstructionUnit
local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon

UEL0100 = Class(TConstructionUnit) {
    Weapons = {
        MainGun = Class(TDFMachineGunWeapon) {},
    },
}

TypeClass = UEL0100