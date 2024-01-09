#****************************************************************************
#**
#**  File     :  /cdimage/units/UAB4202/UAB4202_script.lua
#**  Author(s):  David Tomandl
#**
#**  Summary  :  Aeon Shield Generator Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local AShieldHoverLandUnit = import('/lua/defaultunits.lua').MobileUnit
local ADFLaserLightWeapon = import('/lua/aeonweapons.lua').ADFLaserLightWeapon
local EffectUtil = import('/lua/EffectUtilities.lua')

UAL0300 = Class(AShieldHoverLandUnit) {
    Weapons = {
        LaserTurret = Class(ADFLaserLightWeapon) {}
    },

    ShieldEffects = {
        '/effects/emitters/aeon_shield_generator_mobile_01_emit.bp',
    },
    
    CreateBuildEffects = function( self, unitBeingBuilt, order )
        EffectUtil.CreateAeonCommanderBuildingEffects( self, unitBeingBuilt, self:GetBlueprint().General.BuildBones.BuildEffectBones, self.BuildEffectsBag )
    end, 

    OnStopBeingBuilt = function(self,builder,layer)
        AShieldHoverLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.Rotator1 = CreateRotator(self, 'Pod', 'z', nil, 10, 5, 10)
        self.Trash:Add(self.Rotator1)
		self.ShieldEffectsBag = {}
    end,
    

    OnShieldEnabled = function(self)
        AShieldHoverLandUnit.OnShieldEnabled(self)
        if self.Rotator1 then
            self.Rotator1:SetTargetSpeed(30)
        end
        if not self.Animator then
            self.Animator = CreateAnimator(self)
            self.Trash:Add(self.Animator)
            self.Animator:PlayAnim(self:GetBlueprint().Display.AnimationOpen)
        end
        self.Animator:SetRate(1)
                
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
        AShieldHoverLandUnit.OnShieldDisabled(self)
        self.Rotator1:SetTargetSpeed(0)
        if self.Animator then
            self.Animator:SetRate(-1)
        end
         
        if self.ShieldEffectsBag then
            for k, v in self.ShieldEffectsBag do
                v:Destroy()
            end
		    self.ShieldEffectsBag = {}
		end
    end,


}

TypeClass = UAL0300

