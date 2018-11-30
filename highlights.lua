local filename = 'ij timeline - Sheet1.csv'
if arg[1] then
	filename=arg[1]
end

function printcommands(hlkey)
	io.write("echo " .. hlkey .. " > highlighted\n")
	-- io.write("cat highlighted\n")
	io.write("lualatex timeline.tex\n")
	io.write("convert -density 600 timeline.pdf -quality 90 " ..hlkey.. "-timeline.png\n")
end

require"csv"
local data = dataToTable(filename)
local hlkey = "nohighlight"
printcommands(hlkey)
for r=1,#data do
	hlkey = data[r][6]
	hlkey = string.sub(hlkey,1,#hlkey)
	if ( hlkey ~= "" ) then
		printcommands(hlkey)
	end
end



