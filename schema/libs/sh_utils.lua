utils = {}

function utils.Pick(t)
	if (istable(t)) then
		return t[math.random(1, #t)]
	else
		return t
	end
end

Pick = utils.Pick
