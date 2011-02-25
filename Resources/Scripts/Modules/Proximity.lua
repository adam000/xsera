function Proximity(a, b)
    local dist = hypot2(a.physics.position, b.physics.position)
    ProxUpdate(a, b, dist)
    ProxUpdate(b, a, dist)
    return dist
end

function ProxUpdate(a, b, dist)
    if not b.base.attributes.isDestination then
        if a.proximity.closest == nil
        or a.proximity.closestDistance > dist then
            a.proximity.closest = b
            a.proximity.closestDistance = dist
        end
        if a.ai.owner ~= b.ai.owner then
            if a.proximity.closestHostile == nil
            or a.proximity.closestHostileDistance > dist then
                a.proximity.closestHostile = b
                a.proximity.closestHostileDistance = dist
            end
        end
    else
        if a.ai.owner == b.ai.owner then
            if a.proximity.closestBase == nil
            or a.proximity.closestBaseDistance > dist then
                a.proximity.closestBase = b
                a.proximity.closestBaseDistance = dist
            end
        else
            if a.proximity.closestHostileBase == nil
            or a.proximity.closestHostileBaseDistance > dist then
                a.proximity.closestHostileBase = b
                a.proximity.closestHostileBaseDistance = dist
            end
        end
    end
end

--[TEMP, SCOTT] these functions use a temporaty technique until we have a more efficient one

function GetClosestHostile(subject)
	local subjectId = subject.physics.object_id
	local nearest = nil
	local dist = 0
	local pos = subject.physics.position

	for id, other in pairs(scen.objects) do
		if subject.ai.owner ~= other.ai.owner
		and other.base.attributes.hated == true
		and subjectId ~= id then
			local tempDist = hypot2(pos, other.physics.position)

			if tempDist < dist
			or nearest == nil then
				dist = tempDist
				nearest = other
			end
		end
	end

	return nearest, dist
end


function GetClosestObject(subject)
	local subjectId = subject.physics.object_id
	local nearest = nil
	local dist = 0
	local pos = subject.physics.position

	for id, other in pairs(scen.objects) do
		if other.base.attributes.hated == true
		and subjectId ~= id then
			local tempDist = hypot2(pos, other.physics.position)

			if tempDist < dist
			or nearest == nil then
				dist = tempDist
				nearest = other
			end
		end
	end

	return nearest, dist
end



function GetFurthestObject(subject)
	local pos = subject.physics.position
	local subjectId = subject.physics.object_id
	local dist = 0
	local furthest = nil

	for id, other in pairs(scen.objects) do
		if other.base.attributes.hated == true
		and subjectId ~= id then

			local tempDist = hypot2(pos, other.physics.position)

			if dist < tempDist
			or furthest == nil then
				furthest = other
				dist = tempDist
			end
		end
	end

	return furthest, dist
end


function NextTargetUnderCursor(startId, target)

	local cursorId = startId
	local cursor = nil
	repeat
		cursorId, cursor = next(scen.objects, cursorId)
		if cursor ~= nil then
			if (hypot2(GetMouseCoords(), cursor.physics.position) <= (cursor.physics.collision_radius + 15.0/cameraRatio.current)) then
				if not target then
					if cursor.ai.owner == scen.playerShip.ai.owner then
						break
					end
				else
					break
				end
			end
		end
	until cursorId == startId

	return cursorId, cursor
end
