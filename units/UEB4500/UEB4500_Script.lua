#****************************************************************************
#** 
#**  File     :  /cdimage/units/UEC1901/UEC1901_script.lua 
#**  Author(s):  John Comes, David Tomandl 
#** 
#**  Summary  :  Earth Blacksun, Ver1
#** 
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TShieldStructureUnit = import('/lua/defaultunits.lua').StructureUnit

UEB4500 = Class(TShieldStructureUnit) {
    ShieldEffects = {
        '/effects/emitters/terran_shield_generator_t2_01_emit.bp',
        '/effects/emitters/terran_shield_generator_t2_02_emit.bp',
    },
	
	OnCreate = function(self)
        TShieldStructureUnit.OnCreate(self)
        
        self.UnfoldAnim = CreateAnimator(self)
        self.UnfoldAnim:PlayAnim('/mods/Future Battlefield Pack Legends/units/ueb4500/ueb4500_aunpack.sca')
        self.UnfoldAnim:SetRate(1)
    end,
    
    OnStopBeingBuilt = function(self,builder,layer)
        TShieldStructureUnit.OnStopBeingBuilt(self,builder,layer)
        self.Rotator1 = CreateRotator(self, 'Spinner1', 'y', nil, 10, 5, 10)
        self.Rotator2 = CreateRotator(self, 'Spinner2', 'y', nil, -10, 5, -10)
        self.Trash:Add(self.Rotator1)
        self.Trash:Add(self.Rotator2)
		self.ShieldEffectsBag = {}
    end,

    OnShieldEnabled = function(self)
        TShieldStructureUnit.OnShieldEnabled(self)
        if self.Rotator1 then
            self.Rotator1:SetTargetSpeed(10)
        end
        if self.Rotator2 then
            self.Rotator2:SetTargetSpeed(-10)
        end
        
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
        for k, v in self.ShieldEffects do
            table.insert( self.ShieldEffectsBag, CreateAttachedEmitter( self, 0, self:GetArmy(), v ) )
        end
    end,

    OnShieldDisabled = function(self)
        TShieldStructureUnit.OnShieldDisabled(self)
        self.Rotator1:SetTargetSpeed(0)
        self.Rotator2:SetTargetSpeed(0)
        
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
    end,

}


TypeClass = UEB4500

