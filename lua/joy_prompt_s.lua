--[[
说明：本程序为触发特定规则的输入码添加提示语。
作者：Lantaio Joy
版本：2024.2.11
]]--
local function joy_prompt_segmentor(segs, env)
	local context = env.engine.context
	-- local config = env.engine.schema.config
	-- local punct = config:get_string('recognizer/patterns/punct'):sub(2, 2)
	-- local cn_num = config:get_string('recognizer/patterns/cn_numerals'):sub(2, 2)
	-- 如果 有未上屏的输入码，就...
	if context:is_composing() then
		local seg = Segment(0, 1)
		local Switch = {
			[';'] = function()  seg.prompt = '☮扩展符号'  end,
			['/'] = function()  seg.prompt = '🐧Linux/Mac目录路径'  end,
			['~/'] =
				function()
					seg = Segment(0, 2)
					seg.prompt = '🐧Linux/Mac目录路径'
				end,
			['\\'] = function()  seg.prompt = '📁Win目录路径'  end,
			['{'] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
			['['] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
			['('] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
			['<'] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
			['$'] = function()  seg.prompt = '🀄中文数字金额'  end,
		}
		local case = Switch[segs.input]
		-- 如果 不是全角模式 并且 待处理输入码片段在列表中 或者 待处理输入码片段是‘;’或者‘$’，就...
		if (not context:get_option('full_shape') and case) or (segs.input == ';' or segs.input == '$') then
			case()
			segs:add_segment(seg)
		-- 否则，如果是全角模式，就...
		elseif context:get_option('full_shape') then
			seg.prompt = '🌕全角模式'
			segs:add_segment(seg)
		end
	end
	return true  -- 交给后面的segmentor继续处理
end

return joy_prompt_segmentor
