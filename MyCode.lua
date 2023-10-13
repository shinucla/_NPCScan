

do
   local Tooltip = CreateFrame( "GameTooltip", nil );
   local Text = Tooltip:CreateFontString();
   Tooltip:AddFontStrings( Text, Tooltip:CreateFontString() );
   -- @return Localized name of the NPC if cached, or nil if not.
   function GetNameFromNpcID ( NpcID )
      Tooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
      Tooltip:SetHyperlink( ( "unit:0xF5300%05X000000" ):format( NpcID ) );
      if ( Tooltip:IsShown() ) then
         return Text:GetText();
      end
   end
end



--[[ Timer
--]]
do
   local frame = CreateFrame("Frame")
   frame:Hide();

   local ONUPDATE_INTERVAL = 0.1; -- The minimum number of seconds between each update
   local TimeSinceLastUpdate = 0; -- The number of seconds since the last update
   frame:SetScript("OnUpdate", function(self, elapsed)
                      TimeSinceLastUpdate = TimeSinceLastUpdate + elapsed
                      if TimeSinceLastUpdate >= ONUPDATE_INTERVAL then
                         TimeSinceLastUpdate = 0

                         print("Hello");
                         -- Do stuff
                      end
   end)

   -- When the frame is shown, reset the update timer
   frame:SetScript("OnShow", function(self)
                      TimeSinceLastUpdate = 0
   end);
end


local a = strsub(UnitGUID("target"), 7, 10);
print("NPC ID(\""..UnitName("target").."\") = 0x"..a.." = "..tonumber(a,16))



--Here is the syntax of the next function in Lua which helps to iterate over a table.
do
   local sample_table = { "Kumar", "Keerthi", "Sameer", "Sohail", "Hardik", "Yugendar" }
   function testNext()
      for k, v in next, sample_table do
         print (k, v)
      end
      -- same as following
      for k, v in pairs(sample_table) do
         print (k, v)
      end
   end
end



--[[
   The . (dot) operator in Lua is used to invoke the method of an object, and it is a widely used operator in Lua.
   The : (colon) operator in Lua is used when you want to pass an invisible
   parameter to the method of an object that you are calling.
--]]
do
   local tb = {};

   function tb.test( i )
      print( "test "..i );
   end

   function tb.doit( self, i )
      self.test( i );
   end

   tb:doit(2); ------- same as below using ":"
   tb.doit(tb, 2); --- same as above
end
