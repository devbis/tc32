function getopt_alt(...)
	local tab = {}
	local arg = {...}
	local max = arg[1] + 2
	local n = 2
	local m = 0
 	arg_usb = 0
	arg_fi = ""
	arg_fo = ""
	arg_num = 1
	while n < max do 
		if (string.sub(arg[n], 1, 2) == "-i") then
			arg_fi = arg[n+1]
			n = n + 2
  		elseif (string.sub(arg[n], 1, 2) == "-o") then
			arg_fo = arg[n+1]
			n = n + 2
  		elseif (string.sub(arg[n], 1, 2) == "-s") then
			local size = arg[n+1];
			local rsize = string.reverse(size)
			rsize = string.lower (rsize)
			size = string.sub (size, 1, string.len(size) - 1)
			if (string.sub(rsize, 1, 1) == "k") then
				arg_num = tonumber (size) * 1024
			elseif (string.sub(rsize, 1, 1) == "m") then
				arg_num = tonumber (size) * 1024 * 1024
			else
				arg_num = tonumber (arg[n+1]);
			end
			n = n + 2
  		elseif (string.sub(arg[n], 1, 2) == "-u") then
			arg_usb = 1
			n = n + 1
  		elseif (string.sub(arg[n], 1, 1) == "-") then
  		elseif (string.sub(arg[n], 1, 1) == "-") then
			n = n + 1
		else
			if (m==0) then
				arg_adr = tonumber (arg[n], 16)
			else
				tab[m-1] = tonumber (arg[n], 16)
			end
			n = n + 1
			m = m + 1
		end
	end
	return tab
end

function write_reg(adr, dat, n)
	if (arg_usb ~= 0) then
		tcmd (string.format ("wc %x %x -c -u -s %d", adr, dat, n))
	else
		tcmd (string.format ("wc %x %x -c -s %d", adr, dat, n))
	end
end

function read_reg(adr, n)
	if (arg_usb ~= 0) then
		tcmd (string.format ("rc %x -c -u -s %d", adr, n))
	else
		tcmd (string.format ("rc %x -c -s %d", adr, n))
	end
	return	tcmd_u (0, n)
end

function read_mem(adr, n)
	if (arg_usb ~= 0) then
		tcmd (string.format ("rc %x -u -f -s %d", adr, n))
	else
		tcmd (string.format ("rc %x -s %d", adr, n))
	end
	return	tcmd_u (0, n)
end

function read_fifo(adr, n)
	if (arg_usb ~= 0) then
		tcmd (string.format ("rc %x -u -f -s %d", adr, n))
	else
		write_reg (0xb3, 0x80,1)
		tcmd (string.format ("rc %x -s %d", adr, n))
		write_reg (0xb3, 0x00,1)
	end
	return	tcmd_u (0, n)
end
