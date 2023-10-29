local function period_processor(key, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 没有候选框，就...
	if not context:has_menu() then
	-- 如果 按键是句点 并且 最近上屏的是数字，就...
		if (key:repr() == 'period') and (tonumber(history:latest_text()) ~= nil) then  -- and history:latest_text() ~= '.'
			context.input = '.'
			return 1  -- kAccepted 表示仅由本程序处理此按键事件（此处为句点），已处理完毕。
		end
	-- 否则（有候选框）如果 待翻译串是句点，就...
	elseif (context.input == '.') then
		-- 等待2秒后自动上屏中文句号
		-- if (key:repr() == 'Release+period') then
		-- 	tp = os.clock()
		-- 	while os.clock() -tp <=2 do end  -- 延时2秒
		-- 	if context.input == '.' and context:has_menu() then  -- 再次确认
		-- 		context:select(0)
		-- 		context:commit()  -- 上屏第2个候选项英文句点
		-- 	end
		-- 	return 1
		--  如果 按键是数字，就...
		if 48 <= key.keycode and key.keycode <= 57 then
			context:select(1)
			context:commit()  -- 上屏第2个候选项（英文句点）
			return 0  -- kRejected 表示将按键事件（此处为数字）交回给系统继续处理。
		-- 否则（按键不是数字）如果 按键是句点，就...
		elseif key:repr() == 'period' then
			context:select(0)
			context:commit()  -- 上屏默认候选项（中文句号）
			return 1
		-- elseif key:repr() == 'comma' then
		-- 	context:select(1)
		-- 	context:commit()  -- 上屏第2个候选项（英文句点）
		-- 	return 1
		-- 否则（按键不是数字也不是句点）如果 按键是英文字母，就...
		elseif (65 <= key.keycode and key.keycode <= 90) or (97 <= key.keycode and key.keycode <= 122) then
			context:select(0)
			context:commit()  -- 上屏默认候选项（中文句号）
			-- env.engine:process_key(key)
			return 2  -- kNoop 表示将按键（此处为字母）交给下一个处理组件继续处理。
		end
	end
	-- 如果程序执行到这里还没有返回，就...
	return 2  -- kNoop 表示将按键事件交给下一个处理组件继续处理。
end

return period_processor
