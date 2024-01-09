#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0203/UEL0203_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix, Gordon Duclos
#**
#**  Summary  :  UEF Amphibious Tank Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local EffectTemplate = import('/lua/EffectTemplates.lua')
local THoverLandUnit = import('/lua/defaultunits.lua').MobileUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFLaserHeavyWeapon = CybranWeaponsFile.CDFLaserHeavyWeapon

URL0200 = Class(THoverLandUnit) {
    Weapons = {
        Lasergun01 = Class(CDFLaserHeavyWeapon) {},
        Lasergun02 = Class(CDFLaserHeavyWeapon) {},
    },
}

TypeClass = URL0200