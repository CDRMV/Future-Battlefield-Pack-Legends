#****************************************************************************
#**
#**  File     :  /units/XEB0104/XEB0104_script.lua
#**  Author(s):  Dru Staltman
#**
#**  Summary  :  UEF Engineering tower
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local SStructureUnit = import('/lua/defaultunits.lua').StructureUnit
local util = import('/lua/utilities.lua')
local fxutil = import('/lua/effectutilities.lua')
local DroneWeapon  = import('/lua/cybranweapons.lua').CIFMissileLoaTacticalWeapon

XSB1000 = Class(SStructureUnit) {
    Weapons = { 
        Launchbay_01 = Class(DroneWeapon) {},
        Launchbay_02 = Class(DroneWeapon) {},
        Launchbay_03 = Class(DroneWeapon) {},
        Launchbay_04 = Class(DroneWeapon) {},
        Launchbay_05 = Class(DroneWeapon) {},
        Launchbay_06 = Class(DroneWeapon) {},                                                    
    }, 

OnStopBeingBuilt = function(self,builder,layer)
    SStructureUnit.OnStopBeingBuilt(self,builder,layer)   
    -- landing animations   
    self.AnimManip = CreateAnimator(self)
    self.Trash:Add(self.AnimManip)
       
    -- Drone Globals
    self.ActiveBay = 0
    self.DroneTable = {}
   
    -- spawning a number of drones times equal to the number preset by numcreate
    self.Numcreate = 6     

    -- Globals used for target assists and counter attacks
    self.CurrentTarget = nil
    self.OldTarget = nil
    self.MyAttacker = nil
    self.Retaliation = false
   
    -- Globals used for Drone spawn
    self.UnitComplete = true
    self.Army = self:GetArmy()
    self.InitialSpawn = true
   
    -- Set the drone launch flag on as default
    self:SetScriptBit('RULEUTC_SpecialToggle', true)
       
    -- Initializes Drone spawn sequence 
    self:ForkThread(self.InitialDroneSpawn)           
end,

InitialDroneSpawn = function(self)
 
    -- Randomly determines which launch bay will be the first to spawn a drone
    self.ActiveBay = Random(1,8)
     
    -- Short delay after the carrier has been built
    WaitSeconds(3)
   
    -- Are we dead yet, if not spawn drones
    if not self:IsDead() then
        for i = 1, self.Numcreate do
            if not self:IsDead() then
                self:ForkThread(self.SpawnDrone)
                -- Short delay between spawns to spread them out
                WaitSeconds(1)
            end
        end
        self.InitialSpawn = false             
       
        -- Runs assist commands only after all of the drones have been built
        self:DroneCheckHeartBeat()
    end
end,

LaunchBays = {
            'Launchbay_01','Launchbay_02','Launchbay_03','Launchbay_04',
            'Launchbay_05','Launchbay_06',
             }, 

SpawnDrone = function(self)
    -- Only fires the drones if the parent unit is not dead
    if not self:IsDead() then 
           
        -- Fires the drone out of the specific launch bay
        self:GetWeaponByLabel(self.LaunchBays[self.ActiveBay]):FireWeapon()
                             
        -- changes to next launch bay in sequence
        if self.ActiveBay >= 6 then
            self.ActiveBay = 1
        else
            self.ActiveBay = self.ActiveBay + 1
        end       
    end
end,

DroneCheckHeartBeat = function(self)
    while not self:IsDead() do                       
        if not self:IsDead() and self:GetScriptBit('RULEUTC_SpecialToggle') == true then
            if self:GetTacticalSiloAmmoCount() >= 1 and table.getn(self.DroneTable) < self.Numcreate then
                -- Spawn a single drone only if the above conditions are met
                self:ForkThread(self.SpawnDrone)
            end
        end     
        if not self:IsDead() and self.Retaliation == true and self.MyAttacker != nil then
            -- Clears flags if there is no longer a target to retaliate against thats in range
            if self.MyAttacker:IsDead() or self:GetDistanceToAttacker() > 30 then
                -- Clears flag to allow retaliation on another attacker
                self.MyAttacker = nil
                self.Retaliation = false
            end
        end
        if not self:IsDead() and self.Retaliation == false and self.MyAttacker and self:GetDistanceToAttacker() <= 30 then
            if not self.MyAttacker:IsDead() then
                -- Issues the retaliation command to each of the drones on the carriers table
                if table.getn(self.DroneTable) > 0 then
                    for k, v in self.DroneTable do
                        IssueClearCommands({self.DroneTable[k]})
                        IssueAttack({self.DroneTable[k]}, self.MyAttacker)
                    end
                    -- Sets retaliation flag
                    self.Retaliation = true     
                end
            end
        elseif not self:IsDead() and self.Retaliation == false and self:GetTargetEntity() then
            -- Updates variable with latest targeting info
            self.CurrentTarget = self:GetTargetEntity()     
            -- Verifies that the carrier is not dead and that it has a target
            -- Ensures that either there hasnt been a target before or that its new
            -- To prevent the same retargeting command from being given out multiple times
            if self.OldTarget == nil or self.OldTarget != self.CurrentTarget then   
                -- Updates the OldTarget to match CurrentTarget
                self.OldTarget = self.CurrentTarget       
                -- Issues the attack command to each of the drones on the carriers table
                if table.getn(self.DroneTable) > 0 then
                    for k, v in self.DroneTable do
                        IssueClearCommands({self.DroneTable[k]})
                        IssueAttack({self.DroneTable[k]}, self.CurrentTarget)
                    end
                end
            end
        end
        -- Short delay between checks
        WaitSeconds(1)       
    end
end,

GetDistanceToAttacker = function(self)
    local tpos = self.MyAttacker:GetPosition()
    local mpos = self:GetPosition()
    local dist = VDist2(mpos[1], mpos[3], tpos[1], tpos[3])
    return dist
end,

OnKilledUnit = function(self, unitKilled)
    SStructureUnit.OnKilledUnit(self, unitKilled)     
    if not self:IsDead() and table.getn(self.DroneTable) > 0 then
        self:ForkThread(self.UpdateDroneKills)
    end
end,   

OnDamage = function(self, instigator, amount, vector, damagetype)
    -- Check to make sure that the carrier isnt already dead and what just damaged it is a unit we can attack
    if self:IsDead() == false and damagetype == 'Normal' and self.MyAttacker == nil then
        -- only attack if retaliation not already active
        if IsUnit(instigator) then
            self.MyAttacker = instigator
        end
    end
    SStructureUnit.OnDamage(self, instigator, amount, vector, damagetype)
end,

OnKilled = function(self, instigator, type, overkillRatio)
    -- Disables weapons after death  
    -- Small bit of table manipulation to sort thru all of the avalible drones and remove them after the carrier is dead
    if table.getn(self.DroneTable) > 0 then
        for k, v in self.DroneTable do
            IssueClearCommands({self.DroneTable[k]})
            IssueKillSelf({self.DroneTable[k]})
        end
    end
    -- Final command to finish off the carriers death event
    SStructureUnit.OnKilled(self, instigator, type, overkillRatio)
end,
}

TypeClass = XSB1000