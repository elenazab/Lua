local luaunit = require("luaunit")
require("getChart")

TestGetChart = {}

function TestGetChart:testNoPoints()
    local chart_data = getChart(0, 10000, 100)
    luaunit.assertEquals(#chart_data, 0)
end

function TestGetChart:testOneYearWindow()
    local chart_data = getChart(1672531646, 1704067152, 31536000)
    luaunit.assertEquals(#chart_data, 1)
end

function TestGetChart:testOneDayWindow()
    local chart_data = getChart(1672531646, 1704067152, 86400)
    luaunit.assertEquals(#chart_data, 365)
end


function TestGetChart:testHalfHourWindow()
    local chart_data = getChart(1672531646, 1672535152, 1800)
    luaunit.assertEquals(#chart_data, 2)
    luaunit.assertEquals(chart_data[1][1], 1672531646)	
    luaunit.assertEquals(chart_data[1][2], (857+502)/(2))
    luaunit.assertEquals(chart_data[2][2], (632+433+30)/(3))
end


function TestGetChart:testOneSecWindow()
    local chart_data = getChart(1672531646, 1672535152, 1)
    luaunit.assertEquals(#chart_data, 5)
	luaunit.assertEquals(chart_data[1][1], 1672531646)
	luaunit.assertEquals(chart_data[2][1], 1672532430)
	luaunit.assertEquals(chart_data[3][1], 1672533697)
	luaunit.assertEquals(chart_data[4][1], 1672534358)
	luaunit.assertEquals(chart_data[5][1], 1672535152)
	luaunit.assertEquals(chart_data[1][2], 857)
	luaunit.assertEquals(chart_data[2][2], 502)
	luaunit.assertEquals(chart_data[3][2], 632)
	luaunit.assertEquals(chart_data[4][2], 433)
	luaunit.assertEquals(chart_data[5][2], 30)
end

function TestGetChart:testInvalidTime()
    local chart_data = getChart(-1000, 1672535152, 1000000000)
	luaunit.assertEquals(#chart_data, 1)
end

luaunit.run()