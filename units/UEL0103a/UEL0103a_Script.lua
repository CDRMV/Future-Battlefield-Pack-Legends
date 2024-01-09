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
local TIFHighBallisticMortarWeapon = import('/lua/terranweapons.lua').TIFHighBallisticMortarWeapon

UEL0103a = Class(TLandUnit) {
    Weapons = {
        MainGun = Class(TIFHighBallisticMortarWeapon) {
                
                CreateProjectileAtMuzzle = function(self, muzzle)
                    local proj = TIFHighBallisticMortarWeapon.CreateProjectileAtMuzzle(self, muzzle)
                    local data = {
                        Radius = self:GetBlueprint().CameraVisionRadius or 5,
                        Lifetime = self:GetBlueprint().CameraLifetime or 5,
                        Army = self.unit:GetArmy(),
                    }
                    if proj and not proj:BeenDestroyed() then
                        proj:PassData(data)
                    end
                end,
            },
    },
}

TypeClass = UEL0103a