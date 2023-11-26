----------------------------------------------------------------------
--  tcmd ("wc 00 1f -u")	-- write core register to USB device
--  tcmd ("rc 00 -s 15 -u")	-- read core register from USB device
--  tcmd ("wf 00 1f -u")	-- write flash to USB device
--  tcmd ("rf 00 -s 15 -u")	-- read flash from USB device
--  tcmd_u(index, 1)		-- get byte[index] from tcmd read buffer
--  tcmd_u(index, 2)		-- get short[index] from tcmd read buffer
--  tcmd_u(index, 4)		-- get word[index] from tcmd read buffer
--  LUA syntax
----------------------------------------------------------------------
local t = {...}
print (t[0], t[1])
print (string.format("%08x", tonumber(t[2], 16)))
print (string.format("%08x", tonumber(t[3], 16)))

tcmd ("rf 0 -s 100 -u")
tcmd ("rc 0 -s 15 -u")
val = tcmd_u(0, 4)
print (string.format("core reg 00: %08x", val))
