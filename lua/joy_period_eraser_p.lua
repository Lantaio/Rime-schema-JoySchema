local function period_eraser_processor(key, env)
	local context = env.engine.context
	local history = context.commit_history
	-- 当按键是英文句号 并且 没有候选框 并且 最近上屏的文本是英文句号，do...
	if (key:repr() == 'period') and (not context:has_menu()) and (history:latest_text() == '.') then
		-- env.engine:commit_text('\b')  -- 上屏1个退格键
		key_bs = KeyEvent('l')  -- BackSpace / \b
		p_bs = Component.Processor(env.engine, '', 'ascii_composer'):process_key_event(key_bs)  -- express_editor / ascii_composer
	end
	return 2 -- kNoop
end

-- local function period(input, seg, env)
-- 	local context = env.engine.context
-- 	local history = context.commit_history
-- 	if context:get_commit_text() == '。' and history:back().text == '.' then --
-- 		-- if history:back():back().text == '.' then
-- 		-- history:pop_back()
-- 		-- env.engine:process_key('BackSpace')
-- 		-- end
-- 		env.engine:commit_text('OK')
-- 	end
-- end

return period_eraser_processor
