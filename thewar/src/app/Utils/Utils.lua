local Utils = {}

function Utils:angle2unitvector(angle)
	local unitx = math.sin(math.rad(angle))
	local unity = math.cos(math.rad(angle))
	return cc.p(unitx, unity)
end

function Utils:pos2unitvector(startpos, endpos)
	local distance = self:Point2Distance(startpos, endpos)
	local unitx = (endpos.x - startpos.x) / distance
	local unity = (endpos.y - startpos.y) / distance
	return cc.p(unitx, unity)
end

function Utils:Point2Distance(startpos, endpos)
	return math.sqrt(math.pow((endpos.x - startpos.x), 2) + 
		math.pow((endpos.y - startpos.y), 2))
end

return Utils