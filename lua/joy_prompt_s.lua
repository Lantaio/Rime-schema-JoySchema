--[[
说明：本程序为触发特定规则的输入码添加提示语。
作者：Lantaio Joy
版本：2024.4.3
]]--
local function joy_prompt_segmentor(segs, env)
	local context = env.engine.context
	local seg = Segment(segs:get_current_start_position(), segs.input:len())
	local Cases = {
		['^'] = function()  seg.prompt = '☮扩展符号、短语'  end,
		['/'] = function()  seg.prompt = '🐧Linux/Mac目录路径'  end,
		['\\'] = function()  seg.prompt = '📁Win目录路径'  end,
		['{'] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
		['['] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
		['('] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
		['<'] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
		['$'] = function()  seg.prompt = '🀄中文数字金额'  end,
	}
	local first_char = context.input:sub(1, 1)
	local switch = Cases[first_char]
	-- 如果 不是全角模式 并且 输入码以Cases表中的标点符号开头 或者 输入码以‘^’或者‘$’开头，就...
	if (not context:get_option('full_shape') and switch) or first_char == '^' or first_char == '$' then
		switch()
		segs:add_segment(seg)
	-- 否则，如果是全角模式，就...
	elseif context:get_option('full_shape') then
		seg.prompt = '🌕全角模式'
		segs:add_segment(seg)
	-- 否则，如果输入码以‘rq’开头，就...
	elseif context.input == 'rq' then
		seg.prompt = '📆日期 示例：20210601'
		segs:add_segment(seg)
	-- 否则，如果输入码以‘~/’开头，就...
	elseif context.input:sub(1, 2) == '~/' then
		seg.prompt = '🐧Linux/Mac目录路径'
		segs:add_segment(seg)
	-- 否则，如果输入码以字母+‘:’开头，就...
	elseif context.input:match('^%a:') then
		seg.prompt = '📁Win目录路径'
		segs:add_segment(seg)
	end

	return true  -- 交给后面的segmentor继续处理
end

return joy_prompt_segmentor
