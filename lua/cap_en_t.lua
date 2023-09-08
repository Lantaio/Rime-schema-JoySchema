---@diagnostic disable-next-line: unused-local
local function cap_en_t(input, seg, env)
	if string.match(input, '^%u%u%l+') then
		local cand = Candidate("word_caps", seg.start, seg._end, string.upper(input), '~AU')
		yield(cand)
	end
end

return cap_en_t
