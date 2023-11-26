----------------------------------------------------------------------
--  argv[0]: nil; argv[1]: number of argument
--  tcmd ("wc 00 1f -u")	-- write core register to USB device
--  tcmd ("rc 00 -s 15 -u")	-- read core register from USB device
--  tcmd ("wf 00 1f -u")	-- write flash to USB device
--  tcmd ("rf 00 -s 15 -u")	-- read flash from USB device
--  tcmd_u(index, 1)		-- get byte[index] from tcmd read buffer
--  tcmd_u(index, 2)		-- get short[index] from tcmd read buffer
--  tcmd_u(index, 4)		-- get word[index] from tcmd read buffer
--  LUA syntax
----------------------------------------------------------------------
dofile (".\\lua\\lib.lua")
local t = getopt_alt(...)

n = 0
while 1 do
	n = n + 1
	print (n)
	tcmd (string.format ("rc %x -u -s %d", arg_adr, arg_num))
	os.execute("ping localhost -n 1 -w 1000 > nul")
end
