#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0401/UES0401_script.lua
#**  Author(s):  John Comes, David Tomandl
#**
#**  Summary  :  UEF Experimental Submersible Aircraft Carrier Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TSubUnit = import('/lua/terranunits.lua').TSubUnit
local TANTorpedoAngler = import('/lua/terranweapons.lua').TANTorpedoAngler
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher
local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon


UES0401 = Class(TSubUnit) {

    Weapons = {
        Torpedo01 = Class(TANTorpedoAngler) {},
        Torpedo02 = Class(TANTorpedoAngler) {},
        Torpedo03 = Class(TANTorpedoAngler) {},
        Torpedo04 = Class(TANTorpedoAngler) {},
        MissileRack01 = Class(TSAMLauncher) {},
        AAGun = Class(TAAFlakArtilleryCannon) {},
    },

    OnCreate = function(self)
        TSubUnit.OnCreate(self)
        self.OpenAnimManips = {}
        self.OpenAnimManips[1] = CreateAnimator(self):PlayAnim('/units/ues0401/ues0401_aopen.sca'):SetRate(-1)
        for i = 2, 6 do
            self.OpenAnimManips[i] = CreateAnimator(self):PlayAnim('/units/ues0401/ues0401_aopen0' .. i .. '.sca'):SetRate(-1)
        end
        for k, v in self.OpenAnimManips do
            self.Trash:Add(v)
        end
        if self:GetCurrentLayer() == 'Water' then
            self:PlayAllOpenAnims(true)
        end
    end,

    PlayAllOpenAnims = function(self, open)
        for k, v in self.OpenAnimManips do
            if open then
                v:SetRate(1)
            else
                v:SetRate(-1)
            end
        end
    end,

    OnMotionVertEventChange = function( self, new, old )
        TSubUnit.OnMotionVertEventChange(self, new, old)
        if new == 'Down' then
            self:PlayAllOpenAnims(false)
        elseif new == 'Top' then
            self:PlayAllOpenAnims(true)
        end
    end,

    BuildAttachBone = 'UES0401',

    OnFailedToBuild = function(self)
        TSubUnit.OnFailedToBuild(self)
        ChangeState(self, self.IdleState)
    end,

    IdleState = State {
        Main = function(self)
            self:DetachAll(self.BuildAttachBone)
            self:SetBusy(false)
        end,

        OnStartBuild = function(self, unitBuilding, order)
            TSubUnit.OnStartBuild(self, unitBuilding, order)
            self.UnitBeingBuilt = unitBuilding
            ChangeState(self, self.BuildingState)
        end,
    },

    BuildingState = State {
        Main = function(self)
            local unitBuilding = self.UnitBeingBuilt
            self:SetBusy(true)
            local bone = self.BuildAttachBone
            self:DetachAll(bone)
            unitBuilding:HideBone(0, true)
            self.UnitDoneBeingBuilt = false
        end,

        OnStopBuild = function(self, unitBeingBuilt)
            TSubUnit.OnStopBuild(self, unitBeingBuilt)
            ChangeState(self, self.FinishedBuildingState)
        end,
    },

    FinishedBuildingState = State {
        Main = function(self)
            self:SetBusy(true)
            local unitBuilding = self.UnitBeingBuilt
            unitBuilding:DetachFrom(true)
            self:DetachAll(self.BuildAttachBone)
            if self:TransportHasAvailableStorage() then
                self:AddUnitToStorage(unitBuilding)
            else
                local worldPos = self:CalculateWorldPositionFromRelative({0, 0, -20})
                IssueMoveOffFactory({unitBuilding}, worldPos)
                unitBuilding:ShowBone(0,true)
            end
            self:SetBusy(false)
            ChangeState(self, self.IdleState)
        end,
    },
}

TypeClass = UES0401