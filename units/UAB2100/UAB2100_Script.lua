#****************************************************************************
#**
#**  File     :  /cdimage/units/UAB2101/UAB2101_script.lua
#**  Author(s):  John Comes, David Tomandl
#**
#**  Summary  :  Aeon Light Laser Tower Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local AStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local AIFMortarWeapon = import('/lua/aeonweapons.lua').AIFMortarWeapon

UAB2101 = Class(AStructureUnit) {
    Weapons = {
        MainGun = Class(AIFMortarWeapon) {
            FxMuzzleFlash = {
                '/effects/emitters/aeon_mortar_flash_01_emit.bp',
                '/effects/emitters/aeon_mortar_flash_02_emit.bp',
            },
        }
    },
}

TypeClass = UAB2101