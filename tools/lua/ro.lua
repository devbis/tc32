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

write_reg (0x602, 0x05, 1)	--stop MCU
write_reg (0x1a, 0x00, 1)	--ptm: read
write_reg (0x12, 0x7c, 1)	--power otp

while (arg_num > 0) do
	if (arg_num > 1024) then
		nt = 1024
	else
		nt = arg_num
	end
	write_reg (0x10, arg_adr, 2)
	read_reg (0x19, 1)
	read_fifo (0x19, nt)
	arg_adr = arg_adr + nt
	arg_num = arg_num - nt
end

--for i=1, 4, 1  do 
--end
--print (string.format("core reg 00: %08x", val))
