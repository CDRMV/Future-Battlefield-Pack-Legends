#****************************************************************************
#**
#**  File     :  /cdimage/units/URB1105/URB1105_script.lua
#**  Author(s):  David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Cybran Energy Storage
#**
#**  Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CEnergyStorageUnit= import('/lua/defaultunits.lua').StructureUnit

URB1105b = Class(CEnergyStorageUnit) {
    DestructionPartsChassisToss = {'URB1105'},

    OnStopBeingBuilt = function(self,builder,layer)
        CEnergyStorageUnit.OnStopBeingBuilt(self,builder,layer)
        self:ForkThread(self.AnimThread)
    end,

    AnimThread = function(self)
        # Play the "activate" sound
        local myBlueprint = self:GetBlueprint()
        if myBlueprint.Audio.Activate then
            self:PlaySound(myBlueprint.Audio.Activate)
        end

        local sliderManip = CreateStorageManip(self, 'Lift', 'ENERGY', 0, 0, 0, 0, .8, 0)

        local sliderManip = CreateStorageManip(self, 'Lift', 'Mass', 0, 0, 0, 0, .1, 0)
    end,
}

TypeClass = URB1105b