-----------------------------------------------------------------------------
--  File     : /mods/Future Battlefield Pack/projectiles/Seraphim Defense Drone_Launcher/Seraphim Defense Drone_Launcher_script.lua
--
--  Author(s): CDR Deadalus

--  Original Mod Author(s): EbolaSoup, Resin Smoker, Optimus Prime, Vissroid 
--
--  Summary  : UEF Drone spawning projectile
--
--  Special Thanks to : ChirmayaWrongEmail, Eni, Neruz, Goom, Gilbot-X, Sorian for the Dronecarrier from 4DC 
--
--  Copyright © 2015 Future Battlefield Pack  All rights reserved.
-----------------------------------------------------------------------------

local CElectronBolterProjectile = import('/lua/cybranprojectiles.lua').CElectronBolterProjectile
drone_launcher01 = Class(CElectronBolterProjectile) {

    OnCreate = function(self)
        CElectronBolterProjectile.OnCreate(self)
        self:ForkThread(self.SpawnDrone) 
    end,
    
	SpawnDrone = function(self)  
        if not self:BeenDestroyed() and self:GetLauncher() then 
    
            ### Sets up local variables used and spawns a drone at the projectiles location 
            local launcher = self:GetLauncher() 
            local projOri = self:GetOrientation()           
            local projLoc = self:GetPosition()
            local drone = CreateUnit('XSA0002', launcher:GetArmy(), projLoc[1], projLoc[2], projLoc[3], projOri[1], projOri[2], projOri[3], projOri[4], 'Air')                         
                                           
            ### Sets the Carrier unit as the drones parent 
            drone:SetParent(launcher, 'XSB1000','XSB2000') 
            drone:SetCreator(launcher)
            
            ### Adds the new drone to the parents table 
            if launcher then     
                table.insert(launcher.DroneTable, drone)
            end                   
                    
            ### Remove the projectile from the game world
            self:Destroy()
            
        elseif not self:BeenDestroyed() then
            ### Remove the projectile from the game world
            self:Destroy()   
        end 
    end,

}
TypeClass = drone_launcher01