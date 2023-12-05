-- 本程序处理数字后输入小数点或中文句号的情况
-- 须要和joy_period_p.lua搭配使用
local function joy_period_translator(input, seg, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 待翻译串是句点 并且 之前上屏的是数字，就...
	if input == '.' and tonumber(history:latest_text()) then
		yield(Candidate(input, seg.start, seg._end, '。', '句号键or输拼音'))
		yield(Candidate(input, seg.start, seg._end, '.', '   逗号键or输数字'))
	end
end

return joy_period_translator
