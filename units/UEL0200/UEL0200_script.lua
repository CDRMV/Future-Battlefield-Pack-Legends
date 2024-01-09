#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0205/UEL0205_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Mobile Flak Artillery Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TConstructionUnit = import('/lua/defaultunits.lua').ConstructionUnit
local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon


UEL0200 = Class(TConstructionUnit) {
    Weapons = {
        MainGun = Class(TDFMachineGunWeapon) {},
    },
}

TypeClass = UEL0200