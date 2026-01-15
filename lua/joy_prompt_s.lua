--[[
说明：本程序为触发特定规则的输入码添加提示语。
作者：Lantaio Joy
版本：2.5.17
更新：2026/1/15
]]--
local function joy_prompt_segmentor(segs, env)
	local context = env.engine.context
	local input = context.input
	local seg = Segment(segs:get_current_start_position(), segs.input:len())
	local Cases = {
		['^'] = function()  seg.prompt = '☮扩展符号、短语'  end,
		['/'] = function()  seg.prompt = '🐧Linux/Mac目录路径'  end,
		['{'] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
		['['] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
		['<'] = function()  seg.prompt = '🐱‍💻英文程序代码'  end,
		['$'] = function()  seg.prompt = '🀄中文数字金额'  end,
	}
	local first_char = input:sub(1, 1)
	local switch = Cases[first_char]
	-- 如果 不是全角模式 并且 输入码以Cases表中的标点符号开头 或者 输入码以‘^’或者‘$’开头，则……
	if (not context:get_option('full_shape') and switch) or first_char == '^' or first_char == '$' then
		switch()
	-- 否则，如果是全角模式，则……
	elseif context:get_option('full_shape') then
		seg.prompt = '🌕全角模式'
	-- 否则，如果输入码以‘rq’开头，则……
	elseif input == 'rq' then
		seg.prompt = '📆指定日期，例：rq19980605'
	-- 否则，如果输入码以‘x:’ 或 其中有‘\’号，则……
	elseif input:find('^%a:') or input:find('\\', 1, true) then
		seg.prompt = '📁Win目录路径'
		-- 如果输入码包含[/*?"<>|] 或 从第3个字符起有‘:’号 或 以‘\:’开头，则显示警告信息
		if input:find('[/*?"<>|]') or input:find(':', 3, true) or input:sub(1, 2) == '\\:' then
			seg.prompt = '❌Win目录路径不能有/:*?"<>|'
		end
	-- 否则，如果输入码包含‘/’，则……
	elseif input:find('/', 2, true) then
		seg.prompt = '🐧Linux/Mac目录路径'
	-- 否则，如果输入码从第2位开始有‘@’号，则……
	elseif input:find('@', 2, true) then
		seg.prompt = '📧email地址'
	end
	if seg.prompt then
		segs:add_segment(seg)
	end

	return true  -- 交给后面的segmentor继续处理
end

return joy_prompt_segmentor
