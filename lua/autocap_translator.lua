-- 派生大写英文词汇
local function autocap_translator(input, seg, env)
	if string.match(input, '^%u[%l%d]+') then
		local cand = Candidate("word_caps", seg.start, seg._end, string.upper(input), )
		yield(cand)
	end
end

return autocap_translator
