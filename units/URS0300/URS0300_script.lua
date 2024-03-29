#****************************************************************************
#**
#**  File     :  /cdimage/units/URS0202/URS0202_script.lua
#**  Author(s):  David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Cybran Cruiser Script
#**
#**  Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CSeaUnit = import('/lua/defaultunits.lua').SeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CDFProtonCannonWeapon = CybranWeaponsFile.CDFProtonCannonWeapon
local CAANanoDartWeapon = CybranWeaponsFile.CAANanoDartWeapon
local CAMZapperWeapon02 = CybranWeaponsFile.CAMZapperWeapon02
local CIFMissileLoaWeapon = CybranWeaponsFile.CIFMissileLoaWeapon

URS0300 = Class(CSeaUnit) {
    Weapons = {
        ParticleGun = Class(CDFProtonCannonWeapon) {},
        AAGun = Class(CAANanoDartWeapon) {},
        MissileRack = Class(CIFMissileLoaWeapon) {},
    },
}

TypeClass = URS0300