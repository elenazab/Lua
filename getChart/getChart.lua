require("rndData")
	

function getChart(start_time, end_time, window_size)
	local chart_data = {}
	local raw_data = getData()
	
	if window_size <= 0 then
		return
	end	
	
	for i = start_time, end_time, window_size do
		local value = 0
		local count = 0
		for j = i, i + window_size - 1 do
			if raw_data[j] then
				count = count + 1
				value = value + raw_data[j]
			end
		end
		if count > 0 then
			chart_data[#chart_data + 1] = {i, value / count}
		end	
	end
	return chart_data
end	
