local version = tonumber( (string.gsub(string.gsub(GetVersion(), '1.5.', ''), '1.6.', '')) )

if version < 3652 then -- All versions below 3652 don't have buildin global icon support, so we need to insert the icons by our own function
	LOG('Future Battlefield Pack Legends: [gamecommon.lua '..debug.getinfo(1).currentline..'] - Gameversion is older then 3652. Hooking "GetUnitIconFileNames" to add our own unit icons')

local MyUnitIdTable = {
   uel0303=true, -- Titan - (Heavy Assault Bot)
   url0303c=true, -- Stalker MKII - (Attack Walker)
   uel0202b=true, -- MA100 Master - (Attack Tank)
   url0303b=true, -- Stalker MKI - (Attack Walker)
   url0106c=true, -- Gorath - (Sniperbot)
   ura0200=true, -- Krypthonit - (Fighter)
   urb2307=true, -- Tector MLT 01 - (Heavy Point Defense)
   ues0101=true, -- Redima Class - (Torpedo Boat)
   ueb1201b=true, -- Magiacos - (Water Power Plant)
   uaa0100=true, -- Superia - (Groundattack Fighter)
   url0107b=true, -- Ultra - (Escrot Bot)
   uel0103a=true, -- MC15 Satler - (Mobile Light Artillery)
   ura0100=true, -- Zyper - (Groundattack Fighter)
   uel0303b=true, -- Titan - (Siege Assault Bot)
   ues0209=true, -- Taragrey Class - (Medium Artilleryship)
   urb2303b=true, -- Hivester - (Directfire Missile Installation)
   urs0100=true, -- Sleeper Mark II - (Spy Submarine)
   urb2300=true, -- Reaper LWT X8 - (Wall Point Defense)
   uea0103b=true, -- Doomer - (Heavy Bomber)
   url0303a=true, -- Shockwave - (EMP Battery)
   uea0102b=true, -- Skydrifter - (Interceptor)
   ues0100=true, -- Norway Class - (Corvette)
   ueb2301b=true, -- DM2 - (Medium Heavy Plasma Point Defense)
   url0106b=true, -- Raider - (EMP Support Bot)
   uel0201a=true, -- MA40 Defender - (Light Medium Tank)
   ual0300=true, -- Securesation - (Mobile Repair Shield Generator)
   uel0100=true, -- RR1 Letrower - (Recovery Tank)
   ues0202b=true, -- Opera Class - (Heavy Cruiser)
   uel0304c=true, -- MA A-71 Tomand - (Mobile Heavy Artillery)
   ura0210=true, -- Yvaria - (Attack Gunship)
   ura0110=true, -- Furios - (Groundattack Fighter)
   uel0401b=true, -- Doomsday - (Experimental Armored Support Tank (AST))
   uas0200=true, -- Aurora Class - (Battleship)
   uel0106b=true, -- Shooter - (Medium Assault Bot)
   ueb2101b=true, -- Sentry 1 - (Wall Point Defense)
   uel0201b=true, -- MA30 Maltow - (Attack Tank)
   url0200=true, -- XH-2 Supernova - (Medium Armor Amphibious Tank)
   uab5101b=true, -- Atecilus - (Wall Section)
   uel0200=true, -- RR2 Fieldhero - (Recovery Tank)
   ueb2205b=true, -- Seadefender - (Heavy Torpedolauncher)
   ueb1103b=true, -- Genetlus - (Mass Reactor)
   uel0202a=true, -- MA80 Johnson - (Heavy Tank)
   ues0200=true, -- Fireshark - (Missile Submarine)
   urb5101b=true, -- Ientinus - (Wall Section)
   ura0202=true, -- Observer - (Advanced Air Scout)
   urs0200=true, -- Yorbaynit - (Submarine)
   urs0300=true, -- Scimitar - (Heavy Cruiser)
   ura0404=true, -- Eurypterit - (Experimental Bomber)
   uel0112=true, -- Vesker - (Light Laser Assault Bot)
   uaa0200=true, -- Quaria - (Fighter)
   uel0104c=true, -- MAG2 Air Seeker - (Mobile Anti-Air Gun)
   uab2100=true, -- Offering Mark II - (Mortar Station)
   uel0203a=true, -- Waterwalker - (Amphibious Tank)
   ura0211=true, -- Firehacker - (Medium Attack Bomber)
   uab1103b=true, -- Drutalus - (Resource Generator)
   uel0211=true, -- Iron MK1 - (Light Hover Attack Tank)
   uab1200=true, -- Unity of the Swarm - (Dronestation)
   uab2000=true, -- Unity of the Majesty - (Dronestation)
   uel0209=true, -- SWM 20 Marksman - (Walker)
   urb1103b=true, -- Andoston - (Mass Reactor)
   uel0104b=true, -- MAG4 Air Hunter - (Mobile Anti-Air Gun)
   ueb1302b=true, -- Caranto - (Mass Reactor)
   urb2100=true, -- Devastator - (Light Artillery)
   urb1200=true, -- Retracker Mk1 - (Dronestation)
   urb2200=true, -- Retracker Mk2 - (Dronestation)
   ueb5101b=true, -- Calcicrete Mk2 - (Wall Section)
   uel0101a=true, -- MA1 Rabbit - (Land Scout)
   ueb1000=true, -- Base Defender XT1 - (Dronestation)
   ueb2000=true, -- Base Defender XT2 - (Dronestation)
   urb1105b=true, -- Gabrus - (Multi Storage)
   ual0200=true, -- Orion - (Heavy Assault Tank)
   ueb4301a=true, -- HSD Parashield - (Defensive Shield Generator)
   uel0111b=true, -- Vester - (Mobile Missile Launcher)
   uea0303b=true, -- Jeager - (Multi-Role Fighter)
   ueb1202b=true, -- Epomedius - (Mass Reactor)
   uea0305b=true, -- C-40 Demand - (Attack Transport)
   ueb4000=true, -- A.D.G. Mark II - (Anti Artillery Shield and Jamming Generator)
   uel0110=true, -- SW 100 Prequest - (Walker)
   xsb1000=true, -- Ha Sel Utta - (Dronestation)
   xsb2000=true, -- Ha Sel Uttariusta - (Dronestation)
   xsa0001=true, -- Udet Aratha - (Air Defense Drone)
   xsa0002=true, -- Udet Lenarthum - (Assault Drone)
   url0201=true, -- Zeta D2 Electron (Medium Tank)
}

	local IconPath = "/mods/Future Battlefield Pack Legends"
	-- Adds icons to the unitselectionwindow
	local oldGetUnitIconFileNames = GetUnitIconFileNames
	function GetUnitIconFileNames(blueprint)
		if MyUnitIdTable[blueprint.Display.IconName] then
			local iconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			local upIconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			local downIconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			local overIconName = IconPath .. "/icons/units/" .. blueprint.Display.IconName .. "_icon.dds"
			return iconName, upIconName, downIconName, overIconName
		else
			return oldGetUnitIconFileNames(blueprint)
		end
	end

else
	LOG('Future Battlefield Pack: [gamecommon.lua '..debug.getinfo(1).currentline..'] - Gameversion is 3652 or newer. No need to insert the unit icons by our own function.')
end -- All versions below 3652 don't have buildin global icon support, so we need to insert the icons by our own function