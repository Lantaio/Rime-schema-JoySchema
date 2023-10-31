local function joy_period_translator(input, seg, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 待翻译串是句点 并且 最近上屏的是数字，就...
	if input == '.' and tonumber(history:latest_text()) then
		yield(Candidate(input, seg.start, seg._end, '。', '按句点or输拼音上屏中文句号'))
		yield(Candidate(input, seg.start, seg._end, '.', '  选此项or输数字上屏英文句点'))
	end
end

return joy_period_translator