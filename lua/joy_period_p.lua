--[[
说明：本程序优化数字后输入小数点或中文句号的情况，须要和joy_period_t.lua搭配使用。
作者：Lantaio Joy
版本：2024.2.11
]]--
local function joy_period_processor(key, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 不是全角模式，就...
	if not context:get_option('full_shape') then
		-- 如果 没有候选框，就...
		if not context:has_menu() then
		-- 如果 按键是句点 并且 之前上屏的是数字，就...
			if (key:repr() == 'period') and tonumber(history:latest_text()) then
				context:push_input('.')
				return 1  -- kAccepted 表示由本程序处理此按键事件（此处为句点），已处理完毕。
			end
		-- 否则（有候选框）如果 待处理输入码是句点 并且 不是按键释放事件，就...
		elseif (context.input == '.') and not key:release() then
			--  如果 按键是数字，就...
			if tonumber(key:repr()) then
				context:select(1)  -- 上屏第2个候选项（小数点）
				return 0  -- kRejected 表示将按键事件（此处为数字）交回给系统继续处理。
			-- 否则（不是上面的按键）如果 按键是句点，就...
			elseif key:repr() == 'period' then
				context:select(0)  -- 上屏第1个候选项（中文句号）
				return 1
			-- 否则（不是上面的按键）如果 按键是逗号，就...
			elseif key:repr() == 'comma' then
				context:select(1)  -- 上屏第2个候选项（小数点）
				return 1
			-- 否则（不是上面的按键）如果 按键是英文字母，就...
			-- ！注意！keycode值为ASCII码值，而不是键盘的keycode值！
			elseif (65 <= key.keycode and key.keycode <= 90) or (97 <= key.keycode and key.keycode <= 122) then
				context:select(0)  -- 上屏第1个候选项（中文句号）
				return 2  -- kNoop 表示将按键（此处为字母）交给下一个处理组件继续处理。
			-- 否则（不是上面的按键）如果 按键是符号，就...
			elseif 33 <= key.keycode and key.keycode <= 126 then
				context:clear()
				return 2
			-- 否则（不是上面的按键）应该是控制键，就...
			else
				return 2
			end
		end
	end
	-- 最后处理其它情况（必须）
	return 2  -- kNoop 表示将按键事件交给下一个处理组件继续处理。
end

return joy_period_processor
