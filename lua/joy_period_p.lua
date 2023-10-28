local function period_processor(key, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 不是ascii模式，就...
	if not context:get_option("ascii_mode") then
		-- 如果 没有候选框，就...
		if not context:has_menu() then
		-- 如果 按键是句点 并且 最近上屏的是数字，就...
			if (key:repr() == 'period') and (tonumber(history:latest_text()) ~= nil) then
				context.input = '.'
				return 1  -- kAccepted 表示仅由本程序处理此按键事件（此处为句点），已处理完毕。
			end
		-- 否则（有候选框）如果 待翻译串是句点，就...
		elseif (context.input == '.') then
			--  如果 按键是数字，就...
			if (48 <= key.keycode and key.keycode <= 57) then
				context:select(1)
				context:commit()  -- 上屏第2个选项英文句点
				return 0  -- kRejected 表示将按键事件（此处为数字）交回给系统继续处理。
			-- 否则（按键不是数字）如果 按键是句点，就...
			elseif (key:repr() == 'period') then
				context:commit()  -- 上屏默认选项中文句号
				return 1
			-- 否则（按键不是数字也不是句点）如果 按键是英文字母，就...
			elseif (65 <= key.keycode and key.keycode <= 90) or (97 <= key.keycode and key.keycode <= 122) then
				context:commit()  -- 上屏默认选项中文句号
				-- env.engine:process_key(key)
				return 2  -- kNoop 表示将按键（此处为字母）交给下一个处理组件继续处理。
			end
		end
	-- 否则（是ascii模式），就...
	else
		return 2  -- kNoop 表示将按键交给下一个处理组件继续处理。
	end
end

return period_processor
