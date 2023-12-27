-- 本程序为触发特定规则的输入码添加提示功能
local function joy_prompt_segmentor(segs, env)
	local context = env.engine.context
	-- local config = env.engine.schema.config
	-- local punct = config:get_string('recognizer/patterns/punct'):sub(2, 2)
	-- local cn_num = config:get_string('recognizer/patterns/cn_numerals'):sub(2, 2)
	-- 如果 有未上屏的输入码，就...
	if context:is_composing() then
		if segs.input == ';' then
			local seg = Segment(0, 1)
			seg.prompt = '〔扩展符号〕'
			segs:add_segment(seg)
		elseif segs.input == '/' then
			local seg = Segment(0, 1)
			seg.prompt = '〔Linux/Mac目录路径〕'
			segs:add_segment(seg)
		elseif segs.input == '~/' then
			local seg = Segment(0, 2)
			seg.prompt = '〔Linux/Mac目录路径〕'
			segs:add_segment(seg)
		elseif segs.input == '\\' then
			local seg = Segment(0, 1)
			seg.prompt = '〔Win目录路径〕'
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
