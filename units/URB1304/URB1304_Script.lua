#****************************************************************************
#** 
#**  File     :  /cdimage/units/URC1901/URC1901_script.lua 
#**  Author(s):  John Comes, David Tomandl 
#** 
#**  Summary  :  Cybran QAI Mainframe, Ver1
#** 
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local CEnergyStorageUnit = import('/lua/defaultunits.lua').StructureUnit

URB1304 = Class(CEnergyStorageUnit) {
    DestructionPartsChassisToss = {'URC1901'},
}


TypeClass = URB1304

