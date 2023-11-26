function getopt_alt( ttt, options )
  local tab = {}
  for k, v in ipairs(ttt) do
    --if string.sub( v, 1, 2) == "--" then
      --local x = string.find( v, "=", 1, true )
      --if x then tab[ string.sub( v, 3, x-1 ) ] = string.sub( v, x+1 )
      --else      tab[ string.sub( v, 3 ) ] = true
      --end
    --elseif string.sub( v, 1, 1 ) == "-" then
      --local y = 2
      --local l = string.len(v)
      --local jopt
      --while ( y <= l ) do
        --jopt = string.sub( v, y, y )
        --if string.find( options, jopt, 1, true ) then
          --if y < l then
            --tab[ jopt ] = string.sub( v, y+1 )
            --y = l
          --else
            --tab[ jopt ] = arg[ k + 1 ]
          --end
        --else
          --tab[ jopt ] = true
        --end
        --y = y + 1
      --end
    --end
  end
  return tab
end

--opts = getopt_alt( arg, "ab" )
--opts = getopt_alt( "-i a -o b -b", "ioba" )
--for k, v in pairs(opts) do
  --print( k, v )
--end

local t = {...}
print (t[0], t[1], t[2], t[3], t[4], t[5])
--print (a, b, c, d)
print("Hello from ".._VERSION)
print("test begin:")
for i=1,20,1  
do 
--print(i) 
end
--for n in pairs(_G) 
	--do print(n) 
--end  
--local bit = require("bit")
r=bit.band(6, 7)
--r=band(6, 7)
print (r)
r = string.format("pi = %.4f", 3.14)
print (r)
print(string.format("pi = %.4f", math.pi))
tcmd ("rc 0 -s 15 -u")
print (tcmd_s(1, 2))
