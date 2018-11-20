local filename = 'ij timeline - Sheet1.csv'
if arg[1] then
	filename=arg[1]
end

function printcommands(hlkey)
	io.write("echo " .. hlkey .. " > highlighted\n")
	-- io.write("cat highlighted\n")
	io.write("lualatex timeline.tex\n")
	io.write("convert -density 300 timeline.pdf -quality 90 timeline-highlight-" .. hlkey .. ".png\n")
end

require"csv"
local data = dataToTable(filename)
local hlkey = "nohighlight"
printcommands(hlkey)
for r=1,#data do
	hlkey = data[r][6]
	hlkey = string.sub(hlkey,1,#hlkey-1)
	if ( hlkey ~= "" ) then
		printcommands(hlkey)
	end
end



