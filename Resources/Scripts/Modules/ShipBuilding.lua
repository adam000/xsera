function LookupBuildId(class, race)
    for id, obj in pairs(data.objects) do
        if class == obj.class and race == obj.race then
            return id
        end
    end
end

function CalculateBuildables(object, scen)--[HACK]
    local race = scen.base.players[object.ai.owner+1].race
    for idx, class in ipairs(object.building.classes) do
        object.building.ids[idx] = LookupBuildId(class, race) 
    end
end

function DoBuildAction(context)
    BeginBuilding(context.planet, context.id)
end

function BeginBuilding(planet, id)
    AddCash(planet.ai.owner, -data.objects[id].price)
    planet.building.constructionId = id
end

function StopBuilding(planet)
    planet.building.constructionId = nil
    planet.building.constructionState = 0
end

function GetCash(player)
    return scen.players[player].cash
end

function AddCash(player, cash)
    scen.players[player].cash = scen.players[player].cash + cash
    return scen.players[player].cash
end

function GetBuildPercent(planet)
 return planet.building.constructionState/data.objects[planet.building.constructionId].buildTime
end

function UpdatePlanet(planet, dt)
    AddCash(0, planet.building.earning * RESOURCES_PER_SEC * dt)
    local build = planet.building
    if build.constructionId ~= nil then
        build.constructionState = build.constructionState + CONSTRUCTION_POINTS_PER_TICK * dt
        if GetBuildPercent(planet) >= 1.0 then

            local newObj = NewObject(build.constructionId)
            newObj.physics.position = planet.physics.position
            newObj.ai.owner = planet.ai.owner
            if newObj.ai.owner == 0
            and selection.target ~= nil then
                newObj.ai.objectives.dest = selection.target
            else
                newObj.ai.objectives.dest = planet
            end

            newObj.physics.angle = newObj.base.initialDirection + math.random(0, newObj.base.initialDirectionRange)
            newObj.physics.velocity = PolarVec(SPEED_FACTOR * (newObj.base.initialVelocity + math.random(0, newObj.base.initialVelocity)), newObj.physics.angle)

            scen.objects[#scen.objects + 1] = newObj
            for i = #scen.objects, 2, -1 do
                if scen.objects[i].layer >= scen.objects[i - 1].layer then
                    break
                end
            
            scen.objects[i], scen.objects[i - 1] = scen.objects[i - 1], scen.objects[i]
            end
            StopBuilding(planet)
        end
    end
end
