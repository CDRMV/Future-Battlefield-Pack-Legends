#****************************************************************************
#**
#**  File     :  /data/units/XRL0302/XRL0302_script.lua
#**  Author(s):  Jessica St. Croix, Gordon Duclos
#**
#**  Summary  :  Cybran Mobile Bomb Script
#**
#**  Copyright � 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local CWalkingLandUnit = import('/lua/defaultunits.lua').WalkingLandUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFHeavyMicrowaveLaserGeneratorCom = CybranWeaponsFile.CDFHeavyMicrowaveLaserGeneratorCom


URL0303c = Class(CWalkingLandUnit) {
    Weapons = {
        LeftLaserTurret = Class(CDFHeavyMicrowaveLaserGeneratorCom) {},
    },
}
TypeClass = URL0303c