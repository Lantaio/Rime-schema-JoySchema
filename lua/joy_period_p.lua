local function period_processor(key, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 不是ascii模式，就...
	if not context:get_option("ascii_mode") then
		-- 如果 没有候选框，就...
		if not context:has_menu() then
		-- 如果 按键是句点 并且 最近上屏的是数字，就...
			if (key:repr() == 'period') and (tonumber(history:latest_text()) ~= nil)  then
				context.input = '.'
				return 1  -- kAccepted 表示由本程序接收并处理按键事件。
			end
		-- 否则（有候选框）如果 待翻译串是句点，就...
		elseif (context.input == '.') then
			--  如果 按键是数字，就...
			if (48 <= key.keycode and key.keycode <= 57) then
				context:select(1)  -- 上屏英文句点
				context:commit()
				return 0  -- kRejected 表示将按键事件交回给系统继续处理
			-- 否则（按键不是数字）如果 按键是句点，就...
			elseif (key:repr() == 'period') then
				context:commit()  -- 上屏中文句号
				return 1
			-- 否则（按键不是数字也不是句点）如果 按键是英文字母，就...
			elseif (65 <= key.keycode and key.keycode <= 90) or (97 <= key.keycode and key.keycode <= 122) then
				context:commit()  -- 上屏中文句号
				env.engine:process_key(key)
				return 1
			end
		end
	end
	return 2 -- kNoop 表示本程序不处理这个按键事件，交给下一个处理组件处理。
end

return period_processor
