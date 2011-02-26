--import('Math')
import('PrintRecursive')

local Actions = {}
local AlterActions = {}

function ActivateTrigger(sender, owner)
    if owner == nil then
        CallActions(sender.triggers.activate.seq,sender)
    
    elseif owner.status.energy >= sender.base.device.energyCost
    and (sender.base.device.ammo == -1 or sender.ammo > 0)
    and sender.lastActivated < realTime - sender.base.device.reload / TIME_FACTOR then
    
        sender.lastActivated = realTime

        if sender.ammo ~= -1 then
            sender.ammo = sender.ammo - 1
        end
        
        owner.status.energy = owner.status.energy - sender.base.device.energyCost
        
        if sender.lastPos == #sender.positions then
            sender.lastPos = 1
        else
            sender.lastPos = sender.lastPos + 1
        end
        
        CallActions(sender.base.actions.activate.seq,sender,owner)
    end
end


function ExpireTrigger(owner)
    CallActions(owner.base.actions.expire.seq,owner,nil)
end

function DestroyTrigger(owner)
    CallActions(owner.base.actions.destroy.seq,owner,nil)
end

function CreateTrigger(owner)
    CallActions(owner.base.actions.create.seq,owner,nil)
end

function CollideTrigger(owner,other)
    CallActions(owner.base.actions.collide.seq,owner,other)
end

function ArriveTrigger(owner,other)
    CallActions(owner.base.actions.arrive.seq,owner,other)
end

function CallActions(trigger, source, direct)
    if trigger[0] ~= nil then
        for id = 0, #trigger do
            local action = trigger[id]
            Actions[action.type](action, source, direct)
        end
    end
end

-- set a metatable so that an unknown action will return an action which does nothing
setmetatable(Actions, {__index = function(table, key)
    print("[lua] Warning: Unimplented action " .. key)
    return function(action, source, direct) end
end})

setmetatable(AlterActions, {__index = function(table, key)
    print("[lua] Warning: Unimplemented alter action " .. key)
    return function(action, source, direct) end
end})


--local function noAction(action, source, direct) end
--MARK: Actions
-- Actions["activate special"]         = noAction
Actions["alter"] = function(action, source, direct)
    AlterActions[action.alterType](action, source, direct)
end
-- Actions["assume initial object"] = noAction
Actions["change score"] = function(action, source, direct)
    local player = action.player + 1
    local counter = action.score or 0
    local count = scen.counters[player][counter]
    scen.counters[player][counter] = count + action.amount
end
--Actions["color flash"]     = noAction
--Actions["computer select"] = noAction
Actions["create object"] = function(action, source, direct)
    --Aquire parent data
    local srcMotion
    local offset = vec(0,0)
    local owner = -1
    local targ
    if action.reflexive then --There may be more conditions to consider
        if source.type == nil then --Weapon firing
            srcMotion = direct.physics
            offset = RotatePoint(source.positions[source.lastPos],srcMotion.angle-math.pi/2.0)
            owner = direct.ai.owner
            targ = direct.proximity.closestHostile.physics
        else
            srcMotion = source.physics
            owner = source.ai.owner
        end
    else
        srcMotion = direct.physics
        owner = direct.ai.owner
    end
    
    
    --create object(s)
    local count = action.min + math.random(0, action.range)
    for ctr = 1, count do
        local new = NewObject(action.baseType)
        
        new.physics.position = srcMotion.position + offset

        if new.type == "beam"
        and new.base.beam.type ~= "kinetic" then
            new.gfx.source = srcMotion
            new.gfx.offset = offset
            
            if new.base.beam.mode == "relative" then
                local len = math.min(new.base.beam.range, hypot2(new.gfx.source.position, targ.position))
                local dir = NormalizeVec(targ.position - new.physics.position)
                
                new.gfx.relative = dir * len        
                new.physics.position = new.physics.position +  new.gfx.relative
            else
        
                new.gfx.target = targ
                
                local len =  math.min(new.base.beam.range,hypot2(new.physics.position,new.gfx.target.position))
                local dir = NormalizeVec(new.target.position - new.gfx.source.position)
                
                new.physics.position = dir * len
        
            end
        end
        
        
        if source.base.attributes.autoTarget then
        
            if aimMethod == "smart" then
                local vel = (new.base.initialVelocity or 0) * SPEED_FACTOR
                new.physics.angle = AimTurret(srcMotion, targ, vel)
            else
                new.physics.angle = findAngle(targ.position, new.physics.position)
            end
        elseif action.directionRelative then
            new.physics.angle = srcMotion.angle
        else
            new.physics.angle = RandomReal(0, 2.0 * math.pi)
        end
        
        new.physics.angle = new.physics.angle + math.pi * (new.base.initialDirection + math.random(0.0, new.base.initialDirectionRange))/180.0
        
        local iv = new.base.initialVelocity
        
        new.physics.velocity = PolarVec(SPEED_FACTOR * iv, new.physics.angle)

        if action.velocityRelative then    
            new.physics.velocity = new.physics.velocity + srcMotion.velocity
        end
        
        if new.base.attributes.isGuided then
            new.control.accel = true
        end
        
        new.ai.owner = owner
        new.ai.creator = srcMotion.object_id
        
        CreateTrigger(new)
        AddObject(new, scen)
    end
end

--Actions["create object set destination"] = noAction
Actions["declare winner"] = function(action, source, direct)
    Win()
    print("The winner is: " .. action.player)
end

Actions["die"] = function(action, source, direct)
    if action.reflexive then
        source.status.dead = true
    else
        direct.status.dead = true
    end
end

-- Actions["disable keys"]    = noAction
-- Actions["display message"] = noAction
-- Actions["enable keys"]     = noAction
-- Actions["land at"]         = noAction
Actions["make sparks"] = function(action, source, direct)
    --Aquire parent
    local parent
    if action.reflexive then
        parent = source
    else
        parent = direct
    end
    local theta = math.random(0,2*math.pi)
    local speed = action.velocity
    local range = 0
    if action.velocityRange ~= nil then
        range = action.velocityRange
    end
    graphics.add_particles("Sparks", action.count, parent.physics.position, {x = math.cos(theta) * speed, y = math.sin(theta) * speed}, {x = range, y = range}, {x = 0, y = 0}, 0.5, 0.4)
end

--Actions["nil target"] = noAction
--Actions["none"] = noAction
Actions["play sound"] = function(action, source, direct)
    local rsound = data.sounds[action.soundId]
    local parent
    if action.reflexive then
        parent = source
    else
        parent = direct
    end
    if rsound ~= nil then
        if parent == nil or parent.physics == nil or
           ((source.ai or direct.ai).creator == scen.playerShip.physics.object_id) then
            sound.play(rsound)
        else
            sound.play_positional(rsound, parent.physics.position, parent.physics.velocity)
        end
    else
        print("Sound '" .. action.soundId .. "' not found.")
    end
end

--Actions["set destination"] = noAction
--Actions["set zoom level"]        = noAction

--MARK: Alter Actions
-- AlterActions["absolute cash"]      = noAction
-- AlterActions["absolute location"]  = noAction
-- AlterActions["age"]                = noAction
-- AlterActions["base type"]          = noAction
-- AlterActions["cloak"]              = noAction
-- AlterActions["active condition"] = noAction
AlterActions["health"] = function(action, source, direct)
    local p
    if action.subjectOverride ~= nil then
        p = scen.objects[action.subjectOverride]
    elseif action.reflexive then
        p = source
    else
        p = direct
    end

    if p ~= nil then
        p.status.health = p.status.health + action.value
        if p.status.health > p.status.healthMax then
            p.status.health = p.status.healthMax
        end
    end
end
AlterActions["energy"] = function(action, source, direct)
    local p
    if action.subjectOverride ~= nil then
        p = scen.objects[action.subjectOverride]
    elseif action.reflexive then
        p = source
    else
        p = direct
    end

    if p ~= nil then
        p.status.energy = p.status.energy + action.value
        if p.status.energy > p.status.energyMax then
            p.status.energy = p.status.energyMax
        end
    end
end
-- AlterActions["hidden"]       = noAction
-- AlterActions["location"]     = noAction
-- AlterActions["max velocity"] = noAction
-- AlterActions["occupation"]   = noAction
-- AlterActions["offline"]      = noAction
-- AlterActions["owner"]        = noAction
-- AlterActions["special weapon"]      = noAction
-- AlterActions["beam weapon"]      = noAction
-- AlterActions["pulse weapon"]      = noAction
-- AlterActions["spin"]         = noAction
-- AlterActions["thrust"]       = noAction
AlterActions["velocity"] = function(action, source, direct)
    local p
    local angle = source.physics.angle
    local delta = PolarVec(math.sqrt(action.minimum)+math.random(0.0,math.sqrt(action.range)), angle)
    
    if action.reflexive then
        p = source.physics
    else
        p = direct.physics
    end

    if action.relative then
        p.velocity = p.velocity +  delta
    else
        p.velocity = delta
    end
end