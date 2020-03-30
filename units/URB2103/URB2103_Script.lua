#****************************************************************************
#** 
#**  File     :  /cdimage/units/URC1201/URC1201_script.lua 
#**  Author(s):  John Comes, David Tomandl 
#** 
#**  Summary  :  Cybran Science Lab, Ver1
#** 
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local CStructureUnit = import('/lua/cybranunits.lua').CStructureUnit
local CDFParticleCannonWeapon = import('/lua/cybranweapons.lua').CDFParticleCannonWeapon
local CDFMissileMesonWeapon = import('/lua/cybranweapons.lua').CDFMissileMesonWeapon

URB2103 = Class(CStructureUnit) {
    Weapons = {
        MainGun = Class(CDFParticleCannonWeapon) {},
        GroundGun = Class(CDFMissileMesonWeapon) {},
    },
}


TypeClass = URB2103

