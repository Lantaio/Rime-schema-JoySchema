--[[
功能：本程序优化“全角”和“半角”提示方式
作者：Lantaio Joy
版本：2024.1.5
]]--
local function shape_comment_filter(input, env)
	for cand in input:iter() do
		if cand.comment:find("全角") then
			cand.comment = cand.comment:gsub("〔全角〕", "●")
		elseif cand.comment:find("半角") then
			cand.comment = cand.comment:gsub("〔半角〕", "◗")
		end
		yield(cand)
	end
end

return shape_comment_filter
