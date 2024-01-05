-- 本程序为触发特定规则的输入码添加提示语
local function joy_prompt_segmentor(segs, env)
	local context = env.engine.context
	-- local config = env.engine.schema.config
	-- local punct = config:get_string('recognizer/patterns/punct'):sub(2, 2)
	-- local cn_num = config:get_string('recognizer/patterns/cn_numerals'):sub(2, 2)
	-- 如果 有未上屏的输入码，就...
	if context:is_composing() then
		local seg = Segment(0, 1)
		local Switch = {
			[';'] = function()  seg.prompt = '💲扩展符号'  end,
			['/'] = function()  seg.prompt = '🐧Linux/Mac目录路径'  end,
			['~/'] = function()
				seg = Segment(0, 2)
				seg.prompt = '🐧Linux/Mac目录路径'
			end,
			['\\'] = function()  seg.prompt = '📁Win目录路径'  end,
			['['] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
			['('] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
			['<'] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
			['>'] = function()  seg.prompt = '🀄中文数字金额'  end,
		}
		local case = Switch[segs.input]
		if case then
			case()
			segs:add_segment(seg)
		end
	end
	return true  -- 交给后面的segmentor继续处理
end

return joy_prompt_segmentor
