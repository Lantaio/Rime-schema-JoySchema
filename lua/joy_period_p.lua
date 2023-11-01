local function joy_period_processor(key, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 没有候选框，就...
	if not context:has_menu() then
	-- 如果 按键是句点 并且 最近上屏的是数字，就...
		if (key:repr() == 'period') and tonumber(history:latest_text()) then
			context:push_input('.')
			return 1  -- kAccepted 表示仅由本程序处理此按键事件（此处为句点），已处理完毕。
		end
	-- 否则（有候选框）如果 待翻译串是句点，就...
	elseif (context.input == '.') then
		--  如果 按键是数字 或 空格键，就...
		if 48 <= key.keycode and key.keycode <= 57 or key:repr() == 'space' then
			context:select(1)
			context:commit()  -- 上屏第2个候选项（英文句点）
			return 0  -- kRejected 表示将按键事件（此处为数字）交回给系统继续处理。
		-- 否则（不是上面的按键）如果 按键是句点，就...
		elseif key:repr() == 'period' then
			context:select(0)
			context:commit()  -- 上屏默认候选项（中文句号）
			return 1
		-- 否则（不是上面的按键）如果 按键是英文字母，就...
		elseif (65 <= key.keycode and key.keycode <= 90) or (97 <= key.keycode and key.keycode <= 122) then
			context:select(0)
			context:commit()  -- 上屏默认候选项（中文句号）
			-- env.engine:process_key(key)
			return 2  -- kNoop 表示将按键（此处为字母）交给下一个处理组件继续处理。
		-- 否则（不是上面的按键）如果 按键是候选按键，就...
		elseif key:repr() == 'comma' then  -- ！注意！如果不是用这些按键上屏候选项，须修改
			context:select(1)
			context:commit()  -- 上屏第2个候选项（英文句点）
			return 1
		-- 否则（不是上面的按键）如果 按键是退格键，就...
		elseif key:repr() == 'BackSpace' then
			return 2
		-- 否则（不是上面的按键）如果 不是按键释放事件，就...
		elseif not key:repr():find('Release') then
			context:clear()
		end
	end
	-- 如果程序执行到这里还没有返回，就...
	return 2  -- kNoop 表示将按键事件交给下一个处理组件继续处理。
end

return joy_period_processor
