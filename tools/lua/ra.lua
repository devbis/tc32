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

write_reg (0xb8, arg_adr + 0x500000, 3)

read_fifo (0xb9, arg_num)

write_reg (0xba, 0, 3)

--for i=1, 4, 1  do 
--end
--print (string.format("core reg 00: %08x", val))
