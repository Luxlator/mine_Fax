local printer = peripheral.find("printer")
local speaker = peripheral.find("speaker")
local modem = peripheral.find("modem") or error("No modem attached", 0)
local periList = modem.getNamesRemote()

modem.open(42)
local name = modem.getNameLocal()
write("Waiting for message!")
while true do repeat
  local _, _, _, _, message_raw,_ = os.pullEvent("modem_message")  -- Wait for an event to occur
  
  local msg_tbl = textutils.unserialize(tostring(message_raw))
  
  if msg_tbl["receiver"] ~= name then
    do break end
  end

  print("Received message from " .. msg_tbl["sender"] .. " with the following message: " .. msg_tbl["msg"])
	
	if not printer.newPage() then
    error("Cannot start a new page. Do you have ink and paper?")
    do break end
  end


	--text wrapper
		local strings = require "cc.strings" -- include the module
		local width, height = printer.getPageSize() -- get the size of the page in the printer
		local text = msg_tbl["sender"] .. "sent the following message: " .. msg_tbl["msg"] -- the text you want to write
		local wrapped = strings.wrap(text, width) -- wrap the text given the width   of the page

		local y = height -- used to keep track of the vertical position on the page we are at. 
		-- We start the y value at 'height' so it resets on the first loop iteration and creates a new page.

		for line_number, line in ipairs(wrapped) do -- for each line in the 'wrapped' table...
		  y = (y + 1) % height -- increment y position by 1, then revert it to 0 if we are at the max height
		  --if y == 1 then -- if we hit the max height of the page...
		--	printer.newPage() -- start a new page.
		 -- end

		  printer.setCursorPos(1, y + 1) -- set the cursor position
		  -- we set the cursor position to 'y + 1' here because '% height' 
		  -- above has a range of 0 to height-1. This way, we're setting
		  -- the position at 1 to height.
		  printer.write(line) -- finally write the line of text.
		end
--	printer.write(.. tostring(message))
	speaker.playSound("entity.parrot.ambient") -- play alert sound
	if not printer.endPage() then
    error("Cannot end the page. Is there enough space?")
  end

  print("We got mail!")
end
