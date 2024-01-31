local modem = peripheral.find("modem") or error("No modem attached", 0)
local periList = modem.getNamesRemote()
modem.open(42) -- Open 42 on statup
print("Hello User! This is " .. modem.getNameLocal())
print("Also known as:  " .. ComputerLabel())


for i = 1, #periList do
	print("I have a "..peripheral.getType(periList[i]).." attached as \""..periList[i].."\".")
	i= i+1
end