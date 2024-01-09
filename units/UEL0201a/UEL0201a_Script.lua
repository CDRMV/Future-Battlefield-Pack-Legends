#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0103a/UEL0103a_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Mobile Light Artillery Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TLandUnit = import('/lua/defaultunits.lua').MobileUnit
local TDFLightPlasmaCannonWeapon = import('/lua/terranweapons.lua').TDFLightPlasmaCannonWeapon

UEL0201a = Class(TLandUnit) {
    Weapons = {
        MainGun = Class(TDFLightPlasmaCannonWeapon) {}
    },
}
TypeClass = UEL0201a