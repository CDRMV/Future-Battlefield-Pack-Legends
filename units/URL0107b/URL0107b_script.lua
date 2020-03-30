#****************************************************************************
#**
#**  File     :  /cdimage/units/URL0107/URL0107_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Cybran Heavy Infantry Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFParticleCannonWeapon = import('/lua/cybranweapons.lua').CDFParticleCannonWeapon
local CAANanoDartWeapon = CybranWeaponsFile.CAANanoDartWeapon


URL0107b = Class(CWalkingLandUnit) {
    Weapons = {
        LaserArms = Class(CDFParticleCannonWeapon) {},
        AA_Launcher = Class(CAANanoDartWeapon) {},
    },
}

TypeClass = URL0107b
