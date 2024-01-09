#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0401b/UEL0401b_script.lua
#**  Author(s):  John Comes, David Tomandl, Gordon Duclos
#**
#**  Summary  :  UEF Mobile Factory Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

# This unit needs to not be allowed to build while underwater
# Additionally, if it goes underwater while building it needs to cancel the
#   current order

local TMobileFactoryUnit = import('/lua/defaultunits.lua').MobileUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFGaussCannonWeapon = WeaponsFile.TDFGaussCannonWeapon
local TDFRiotWeapon = WeaponsFile.TDFRiotWeapon
local TAALinkedRailgun = WeaponsFile.TAALinkedRailgun
local TANTorpedoAngler = WeaponsFile.TANTorpedoAngler
local TAMInterceptorWeapon = import('/lua/terranweapons.lua').TAMInterceptorWeapon
local TIFCruiseMissileUnpackingLauncher = import('/lua/terranweapons.lua').TIFCruiseMissileUnpackingLauncher
local EffectTemplate = import('/lua/EffectTemplates.lua')

local EffectUtil = import('/lua/EffectUtilities.lua')
local CreateUEFBuildSliceBeams = EffectUtil.CreateUEFBuildSliceBeams

UEL0401b = Class(TMobileFactoryUnit) {
    Weapons = {
        RightTurret01 = Class(TDFGaussCannonWeapon) {},
        RightTurret02 = Class(TDFGaussCannonWeapon) {},
        LeftTurret01 = Class(TDFGaussCannonWeapon) {},
        LeftTurret02 = Class(TDFGaussCannonWeapon) {},
        RightRiotgun = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
        AntiNuke = Class(TAMInterceptorWeapon) {},
        MissileWeapon = Class(TIFCruiseMissileUnpackingLauncher) 
        {
            FxMuzzleFlash = {'/effects/emitters/terran_mobile_missile_launch_01_emit.bp'},
        },
        LeftRiotgun = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
        RightAAGun = Class(TAALinkedRailgun) {},
        LeftAAGun = Class(TAALinkedRailgun) {},
        Torpedo = Class(TANTorpedoAngler) {},
    },

    FxDamageScale = 2.5,


}

TypeClass = UEL0401b