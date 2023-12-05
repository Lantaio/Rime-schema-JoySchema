-- 本程序为触发特定规则的输入码添加提示词
local function joy_prompt_segmentor(segs, env)
	local context = env.engine.context
	-- 如果 有未上屏的输入码，就...
	if context:is_composing() then
		if segs.input == ';' then
			local seg = Segment(0, 1)
			seg.prompt = '〔扩展符号〕'
			segs:add_segment(seg)
		elseif segs.input == '>' then
			local seg = Segment(0, 1)
			seg.prompt = '〔中文数字〕'
			segs:add_segment(seg)
		end
	end
	return true  -- 交给后面的segmentor继续处理
end

return joy_prompt_segmentor
