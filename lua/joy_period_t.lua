local function period_translator(input, seg, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 不是ascii模式 并且 待翻译串是英文句点 并且 最近上屏的是数字，就...
	if not context:get_option("ascii_mode") and input == '.' and tonumber(history:latest_text()) ~= nil then --
		yield(Candidate(input, seg.start, seg._end, '。', '空格or输拼音上屏中文句号'))
		yield(Candidate(input, seg.start, seg._end, '.', '  选择or输数字上屏英文句点'))
	end
end

return period_translator