utils = {}

function utils.Pick(t)
	if (istable(t)) then
		return t[math.random(1, #t)]
	else
		return t
	end
end

Pick = utils.Pick

utils.table = utils.table or {}

function utils.table.Contains(table, value)
	for k, v in pairs(table) do
		if v == value then
			return true
		end
	end

	return false
end


table.Contains = utils.table.Contains

function utils.table.ContainsKey(table, key)
	return table[key] ~= nil
end

table.ContainsKey = utils.table.ContainsKey
