local modem = peripheral.find("modem") or error("No modem attached", 0)
local periList = modem.getNamesRemote()
modem.open(42) -- Open 42 on statup
print("Hello User! This is " .. modem.getNameLocal())
--print("Also known as:  " .. ComputerLabel())


for i = 1, #periList do
	print("I have a "..peripheral.getType(periList[i]).." attached as \""..periList[i].."\".")
	i= i+1
end

print("To start recieving messages enter 'bg recieve-all' to run in the background.")
print ()
print("To start sending messages enter 'fg send' to open a tab.")
print()
print("To play snake enter 'fg worm'! The goal is to not eat yourself!")
print()
print("To clear the screen enter 'clear'")
