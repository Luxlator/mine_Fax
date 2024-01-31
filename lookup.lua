local modem = peripheral.find("modem") or error("No modem attached", 0)
local periList = modem.getNamesRemote()

for i = 1, #periList do
	print("I have a "..peripheral.getType(periList[i]).." attached as \""..periList[i].."\".")
	i= i+1
end
