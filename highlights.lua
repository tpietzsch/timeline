local filename = 'ij timeline - Sheet1.csv'
if arg[1] then
	filename=arg[1]
end

require"csv"
local data = dataToTable(filename)
for r=1,#data-1 do
	local hlkey = data[r][6]
	hlkey = string.sub(hlkey,1,#hlkey-1)
	io.write("echo " .. hlkey .. " > highlighted\n")
	-- io.write("cat highlighted\n")
	io.write("lualatex timeline.tex\n")
	io.write("convert -density 300 timeline.pdf -quality 90 timeline-highlight-" .. hlkey .. ".png\n")
end
io.write("cp *.png /Users/pietzsch/Google\\ Drive/I2K-2018/timeline/\n")

