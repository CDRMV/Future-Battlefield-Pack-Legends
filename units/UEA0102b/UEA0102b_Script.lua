#****************************************************************************
#**
#**  File     :  /cdimage/units/UEA0103/UEA0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Gordon Duclos
#**
#**  Summary  :  Terran Carpet Bomber Unit Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
#
# Terran Bomber Script : UEA0102b
#
local TAirUnit = import('/lua/defaultunits.lua').AirUnit
local TAirToAirLinkedRailgun = import('/lua/terranweapons.lua').TAirToAirLinkedRailgun

UEA0102b = Class(TAirUnit) {
    PlayDestructionEffects = true,
    DamageEffectPullback = 0.25,
    DestroySeconds = 7.5,

    Weapons = {
        LinkedRailGun = Class(TAirToAirLinkedRailgun) {},
    },
    ExhaustBones = {'Exhaust_L','Exhaust_R',},
}

TypeClass = UEA0102b

