#****************************************************************************
#**
#**  File     :  /cdimage/units/URB2303/URB2303_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Cybran Light Artillery Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFMissileMesonWeapon = CybranWeaponsFile.CDFMissileMesonWeapon

URB2303b = Class(CStructureUnit) {
    Weapons = {
        MainGun = Class(CDFMissileMesonWeapon) {},
    },
}

TypeClass = URB2303b