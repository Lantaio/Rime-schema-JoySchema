local function period_processor(key, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 如果 不是ascii模式，就...
	if not context:get_option("ascii_mode") then
		-- 如果 按键是英文句点 并且 最近上屏的是数字，就...
		if (key:repr():find('period')) and (tonumber(history:latest_text()) ~= nil) then
			context.input = '.'
			return 1  -- kAccepted
		-- 否则如果 待翻译串是英文句号 并且 有候选框，就...
		elseif (context.input == '.') and context:has_menu() then
			--  如果 按键是数字，就...
			if (48 <= key.keycode and key.keycode <= 57) then
				env.engine:commit_text('.')  -- 上屏
				context:clear()
				return 0
			-- 否则如果 按键是英文字母，就...
			elseif (65 <= key.keycode and key.keycode <= 90) or (97 <= key.keycode and key.keycode <= 123) then
				context:commit()  -- 上屏
				env.engine:process_key(key)
				return 1
			end
		end
	end
	return 2 -- kNoop
end

return period_processor
