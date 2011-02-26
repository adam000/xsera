--import('Math')
--import('GlobalVars')

--MARK: Object modes
--== High level modes ==--
--High level modes are used for object thinking and planning

--  Just sit in place and do nothing
--  used when there is no active destination
MODE_WAIT = 0

--  Travel towards the long term objective
MODE_GOTO = 1

--  Like GOTO but with combat
--  This is focused (it can't be overidden by other nearby hostiles)
MODE_ENGAGE = 2

--Protect
--  After arriving sit on the destination and engage any hostiles that approach
MODE_DEFEND = 3

--==  Submodes ==--
--Submodes are used for ship piloting

--  Travel to
SUB_GO = 0
--  Hold position
SUB_SIT = 1
--  Fly towards the active target and shoot if in range
SUB_ATTACK = 2
--  Run away from the active target
SUB_FLEE = 3


--MARK: Constants
--distance to which a hostile must approach to engage
HOSTILE_AQUISITION_RANGE = 2048
--distance from nearest base to persue target
HOSTILE_PERSUIT_RANGE = 4096

--if farther than this begin traveling
GOTO_TRAVEL_THRESHOLD = 200
--Distance to begin deceleration
GOTO_ARRIVAL_THRESHOLD = 150

--MARK: Thinking functions
function Think(object)
	if CanThink(object.base.attributes) then
        local mode = object.ai.mode
        EvaluateHostiles(object)
		local target = object.ai.objectives.target or object.ai.objectives.dest
		local dist
		if target ~= nil then
            if mode == MODE_WAIT then
                SetMode(object, MODE_GOTO, nil)
            end
			dist = ObjectDistance(object, target)
			if object.base.attributes.isGuided then
                SetMode(object, MODE_GOTO, SUB_GO)
			elseif mode == MODE_GOTO then
                if dist > GOTO_TRAVEL_THRESHOLD then
                    SetMode(object, nil, SUB_GO)
                elseif dist < GOTO_ARRIVAL_THRESHOLD then
                    SetMode(object, nil, SUB_SIT)
                end
            else
                print("MODE: " .. mode)
			end
		else
			SetMode(object, MODE_WAIT, SUB_SIT)
		end
        ManipulateControls(object)
	else
		SetAccel(object, true)
	end
end

function CanThink(attr)
    return attr.canEngange or attr.canEvade or attr.canAcceptDestination
end

--Decide whether or not to change to this hostile
function EvaluateHostiles(object)
    local hst = object.proximity.closestHostile
    --Guard Clause
    if hst == nil then
        return false
    end
    local dist = ObjectDistance(object, hst)
    if object.ai.objectives.target ~= hst then
        if dist < HOSTILE_AQUISITION_RANGE then
            object.ai.objectives.target = hst
            SetMode(object, nil, SUB_ATTACK)
        else
            object.ai.objectives.target = nil
            SetMode(object, nil, SUB_GO)
        end
    elseif dist > HOSTILE_AQUISITION_RANGE then
        --Lose Intrest
        object.ai.objectives.target = nil
        SetMode(object, nil, SUB_GO)
    else
        return true
    end
end

--MARK: Controls
function ManipulateControls(object)
    if object.ai.submode ~= SUB_ATTACK then
        object.control.beam = false
        object.control.pulse = false
        object.control.special = false
    end

    local target = object.ai.objectives.target or object.ai.objectives.dest
    if target ~= nil then
        local dist = hypot2(object.physics.position, target.physics.position)
        local submode = object.ai.submode
        local c = object.control
        if submode == SUB_GO then
            SetAccel(object, true)
            TurnToward(object, target)
        elseif submode == SUB_SIT then
            SetAccel(object, false)
            c.left = false
            c.right = false
        elseif submode == SUB_ATTACK then
            SetAccel(object, true)
            TurnToward(object, target)
        elseif submode == SUB_FLEE then
            SetAccel(object, true)
            TurnAway(object, target)
        else
            error("BAD SUBMODE")
        end
        
        if submode == SUB_GO then
            c.warp = (
            object.base.warpSpeed > 0.0
            and dist >= math.sqrt(object.base.warpOutDistance) * 2.0
            or target.control.warp and object.ai.owner == target.ai.owner)
        end
    end
end

function SetAccel(object, value)
    object.control.accel = value
    object.control.decel = not value
end

function TurnAway(object, target)
    local ang = findAngle(target.physics.position,object.physics.position) - object.physics.angle
    ang = normalizeAngle(ang)
    
    if ang <= 0.95 * math.pi then
        object.control.left = false
        object.control.right = true
    elseif ang >= 1.05 * math.pi then
        object.control.left = true
        object.control.right = false
    else
        object.control.left = false
        object.control.right = false
    end
end

function TurnToward(object, target)

    local ang = AimFixed(object.physics,target.physics, hypot1(object.physics.velocity)) - object.physics.angle

    ang = normalizeAngle(ang)
    
    if math.abs(ang-math.pi) >= math.pi * 0.95 then
        object.control.left = false
        object.control.right = false
    elseif ang <= math.pi * 0.95 then
        object.control.left = true
        object.control.right = false
    else
        object.control.left = false
        object.control.right = true
    end
end


function AimFixed(parent, target, bulletVel)
    --Grrrr
    if getmetatable(target.position) == nil then
        return parent.angle
    end

    local distance = hypot2(parent.position,target.position)
    local time = distance/bulletVel


    local initialOffset = target.position - parent.position
    local velocityDiff = target.velocity - parent.velocity

    local finalOffset = initialOffset + velocityDiff * time

    local absAngle = math.atan2(finalOffset.y,finalOffset.x)

    return absAngle
end

--Used to calculate absolute angle at which to fire the turret.
function AimTurret(gun, target, bulletVel)
    local gPos = gun.position
    local tPos = target.position

    local rPos = tPos - gPos
    local rVel = target.velocity - gun.velocity

    local A = -bulletVel^2 + rVel * rVel
    local B = 2 * (rPos * rVel)
    local C = rPos * rPos

    --Assumes bullet is faster than target
    --use -b + math.sqrt(...
    --if target is faster

    local t = (-B - math.sqrt(B^2 - 4 * A * C))/(2*A)

    local slope = rPos + rVel * t

    local theta = math.atan2(slope.y, slope.x)

    return theta
end

--MARK:  Other
function SetMode(object, mode, submode)
    if mode ~= nil then
        object.ai.mode = mode
    end
    if submode ~= nil then
        object.ai.submode = submode
    end
end

