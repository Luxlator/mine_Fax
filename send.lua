local printer = peripheral.find("printer")
local speaker = peripheral.find("speaker")
local modem = peripheral.find("modem") or error("No modem attached", 0)
local periList = modem.getNamesRemote()

for i = 1, #periList do
	print("I have a "..peripheral.getType(periList[i]).." attached as \""..periList[i].."\".")
	i= i+1
end

--write the message
--write("To cancel press and hold 'CTRL - T'")
write(" ")
write("what would you like to say?  ")
local message = read()
write("who are you sending it to?  ")
local target = read() --ask for target
for i=1, #periList do
i = i +1
-- if target matches entity on list
modem.transmit(42, 42, "dear " .. target .. ", " .. message) --transmits to target
print("sent: ".. message)

end

speaker.playSound("entity.parrot.ambient") 
print ("message sent!")
-- play alert sound



