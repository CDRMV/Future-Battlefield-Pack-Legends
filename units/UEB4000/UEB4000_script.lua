#****************************************************************************
#**
#**  File     :  /cdimage/units/UEB4301/UEB4301_script.lua
#**  Author(s):  John Comes, Greg Kohne
#**
#**  Summary  :  UEF Heavy Shield Generator Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TShieldStructureUnit = import('/lua/terranunits.lua').TShieldStructureUnit

UEB4000 = Class(TShieldStructureUnit) {
    
    ShieldEffects = {
        '/effects/emitters/terran_shield_generator_t2_01_emit.bp',
        '/effects/emitters/terran_shield_generator_T3_02_emit.bp',
        ###'/effects/emitters/terran_shield_generator_t2_03_emit.bp',
    },
}

TypeClass = UEB4000