#****************************************************************************
#**
#**  File     :  /cdimage/units/UAL0201/UAL0201_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Aeon Light Tank Script
#**
#**  Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local AHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit
local AeonWeapons = import('/lua/aeonweapons.lua')
local ADFCannonOblivionWeapon = AeonWeapons.ADFCannonOblivionWeapon

UAL0200 = Class(AHoverLandUnit) {
    Weapons = {
        MainGun = Class(ADFCannonOblivionWeapon) {}
    },
}
TypeClass = UAL0200

