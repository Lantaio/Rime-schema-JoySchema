--[[
说明：本程序使得在输入对应的拼音缩写时会生成日期、时间或星期等候选项。
作者：Lantaio Joy
版本：1.4.8
更新：2024.6.5
]]--
local function isDate(year, month, day)
	-- 如果年、月、日是有效数字，就...
	if year and month and day then
		-- 如果月份有效，就...
		if month >= 1 and month <= 12 then
			-- 判断日期是否在每月的有效天数范围内
			local maxDaysOfMonth = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 }
			-- 如果是闰年的2月，则天数为29
			if month == 2 and (year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)) then
				maxDaysOfMonth[2] = 29
			end
			-- 如果日有效，就...
			if day >= 1 and day <= maxDaysOfMonth[month] then
				return true -- 返回日期有效
			end
		end
	end
	return false  -- 返回日期无效
end
-- 提高权重的原因：因为在方案中设置了大于 1 的 initial_quality，导致 rq sj xq dt ts 产出的候选项在所有词语的最后。
local function yield_cand(type, seg, text)
	local cand = Candidate(type, seg.start, seg._end, text, '')
	cand.quality = 10
	yield(cand)
end

local M = {}

function M.init(env)
	local config = env.engine.schema.config
	M.name_space = env.name_space:gsub('^*', '')
	M.date = config:get_string(env.name_space .. '/date') or 'rq'
	M.time = config:get_string(env.name_space .. '/time') or 'sj'
	M.week = config:get_string(env.name_space .. '/week') or 'xq'
	M.datetime = config:get_string(env.name_space .. '/datetime') or 'dt'
	M.timestamp = config:get_string(env.name_space .. '/timestamp') or 'ts'
end

function M.func(input, seg, env)
	-- 当前日期
	if (input == M.date) then
		yield_cand('date', seg, os.date('%Y年%m月%d日'):gsub('年0', '年'):gsub('月0', '月'))
		yield_cand('date', seg, os.date('%Y/%m/%d'):gsub('/0', '/'))
		yield_cand('date', seg, os.date('%Y.%m.%d'):gsub('%.0', '.'))
		yield_cand('date', seg, os.date('%Y%m%d'))
		-- yield_cand('date', seg, os.date('%Y-%m-%d'):gsub('-0', '-'))
		-- yield_cand('date', seg, os.date('%m月%d日'):gsub('^0', ''):gsub('月0', '月'))
	-- 指定月日
	elseif input:match('^rq%d%d%d%d$') then
		month, day = input:match('^rq(%d%d)(%d%d)$')
		month = tonumber(month)  day = tonumber(day)
		if isDate(1976, month, day) then
			yield_cand('date', seg, (month..'月'..day..'日'))
		end
		if isDate(os.date('%Y'), month, day) then
			yield_cand('date', seg, (os.date('%Y')..'年'..month..'月'..day..'日'))
		end
		if isDate(os.date('%Y')-1, month, day) then
			yield_cand('date', seg, ((os.date('%Y')-1)..'年'..month..'月'..day..'日'))
		end
		if isDate(os.date('%Y')+1, month, day) then
			yield_cand('date', seg, ((os.date('%Y')+1)..'年'..month..'月'..day..'日'))
		end
	-- 指定年月日
	elseif input:match('^rq%d%d%d%d%d%d%d%d$') then
		year, month, day = input:match('^rq(%d%d%d%d)(%d%d)(%d%d)$')
		year = tonumber(year)  month = tonumber(month)  day = tonumber(day)
		if isDate(year, month, day) then
			yield_cand('date', seg, (year..'年'..month..'月'..day..'日'))
			yield_cand('date', seg, (year..'/'..month..'/'..day))
			yield_cand('date', seg, (year..'.'..month..'.'..day))
			yield_cand('date', seg, (year..'-'..month..'-'..day))
		end
	-- 当前时间
	elseif (input == M.time) then
		yield_cand('time', seg, os.date('%H:%M'))
		yield_cand('time', seg, os.date('%H:%M:%S'))
	-- 当前星期
	elseif (input == M.week) then
		local week_tab = {'日', '一', '二', '三', '四', '五', '六'}
		local text = week_tab[tonumber(os.date('%w') + 1)]
		yield_cand('week', seg, '星期' .. text)
		-- yield_cand('week', seg, '礼拜' .. text)
		yield_cand('week', seg, '周' .. text)
	-- ISO 8601/RFC 3339 的时间格式 （固定东八区）（示例 2022-01-07T20:42:51+08:00）
	elseif (input == M.datetime) then
		yield_cand('datetime', seg, os.date('%Y-%m-%dT%H:%M:%S+08:00'))
		yield_cand('datetime', seg, os.date('%Y%m%d%H%M%S'))
	-- 时间戳（十位数，到秒，示例 1650861664）
	elseif (input == M.timestamp) then
		yield_cand('timestamp', seg, string.format('%d', os.time()))
	end
end

return M
