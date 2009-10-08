-- demo script (for demo 2): Player is Ishiman Heavy Cruiser, opponent is Gaitori Carrier.
-- Carrier has no AI, so it just sits there. Player must warp to Carrier's position
-- and can destroy it using both seeking and non-seeking weapons. After that, the player must
-- capture the planet that the Gaitori Carrier was protecting by building an Ishiman Transport.
-- Script ends when the Carrier is destroyed and the planet is taken.

-- Future possible script variations:
-- Using autopilot to find Carrier.
-- Carrier has a "fleeing" AI, and runs away when attacked, possibly warping away.
-- Carrier has other AIs.
-- Use other Heavy Cruisers (possibly built on planets) to destroy Carrier, using attack command.

import('PrintRecursive')
import('GlobalVars')
import('EntityLoad')
import('Math')
import('Interfaces')
import('PopDownConsole')
import('CaptainAI')
import('BoxDrawing')
import('KeyboardControl')
-- import('MouseHandle')

position = nil
endGameData = nil

--[[--------------------------------
	--{{------------------------
		Projectile Collision
	------------------------}}--
--------------------------------]]--

function ProjectileCollision(projectileObject, pNum, projectileData, shipObject)
	table.remove(projectileObject, pNum)
	shipObject.life = shipObject.life - projectileData.damage
end

--[[--------------------------
	--{{------------------
		Initialization
	------------------}}--
--------------------------]]--

mouse_movement = false
mousePos = { x = 0, y = 0 }
mouseStart = 0
cameraRatioOrig = nil
cameraRatioT = cameraRatio

function init ()
	start_time = mode_manager.time()
	sound.stop_music()
    lastTime = mode_manager.time()
    physics.open(0.6)
	loadingEntities = true
	Admirals[1] = { ident = "Human/Ishiman", name = "Human / Ishiman Cooperative" }
	Admirals[2] = { ident = "Gaitori", name = "Gaitori Union" }
	if scen == nil then
		scen = NewEntity(nil, "demo", "Scenario")
	end
	loadingEntities = false
	computerShip = NewEntity(nil, "Carrier", "Ship", "Gaitori")
		computerShip.physicsObject.position = { x = 2200, y = 2700 }
		computerShip.physicsObject.angle = math.pi - 0.2
		computerShip.owner = "Gaitori"
	playerShip = NewEntity(nil, "HeavyCruiser", "Ship", "Ishiman")
		playerShip.owner = "Human/Ishiman"
	bestExplosion = NewEntity(nil, "BestExplosion", "Explosion")
end

--[[--------------------
	--{{------------
		Updating
	------------}}--
--------------------]]--

function temp_key(k)
	if k ~= nil then
		mode_manager.switch('Credits')
	end
end

function update ()
	local newTime = mode_manager.time()
	dt = newTime - lastTime
	lastTime = newTime
	if printFPS == true then
		print(1 / dt) -- fps counter! whoa... o.O
	end
	
	-- victory condition
	if victoryTimer ~= nil then
		victoryTimer = victoryTimer + dt
		if victoryTimer >= 2.0 then
			key = temp_key
			end_time = mode_manager.time()
			endGameData = {	{	{ false, cClear, " " },
								{ false, ClutColour(3, 7), "YOU" },
								{ false, ClutColour(3, 9), "PAR" } },
							{	{ false, ClutColour(3, 7), "TIME" },
								{ false, cClear, (tostring(math.floor((end_time - start_time) / 60)) .. ":" .. tostring(string.format('%02d', math.floor((end_time - start_time) % 60))))},
								{ false, cClear, "1:00" } },
							{	{ false, ClutColour(3, 9), "LOSSES" },
								{ false, cClear, "0" },
								{ false, cClear, "0" } },
							{	{ false, ClutColour(2, 11), "KILLS" },
								{ false, cClear, "1" },
								{ false, cClear, "1" } },
							{	{ false, ClutColour(2, 13), "SCORE" },
								{ false, cClear, ">9000!!!" },
								{ false, cClear, "100" } } }
			menu_display = "victory_menu"
			victoryTimer = nil
		end
	end
	
	-- defeat condition
	if playerShip.life == 0 then
		defeatTimer = defeatTimer + dt
		victoryTimer = nil
		if defeatTimer >= 2.0 then
			menu_display = "defeat_menu"
			keyup = escape_keyup
			key = escape_key
		end
	end
	
	if cameraChanging == true then
		x = x - dt
		if x < 0 then
			x = 0
			cameraChanging = false
			playerShip.beam.width = cameraRatio
		end
		if x >= 0 then
			cameraRatio = cameraRatioOrig + cameraRatioOrig * multiplier * (((x - timeInterval) * (x - timeInterval)) / (timeInterval * timeInterval))
		end
		camera = { w = 640 / cameraRatio, h }
		camera.h = camera.w / aspectRatio
		shipAdjust = .045 * camera.w
		arrowLength = ARROW_LENGTH / cameraRatio
		arrowVar = ARROW_VAR / cameraRatio
		arrowDist = ARROW_DIST / cameraRatio
	end
	
--[[------------------
	Warping Code
------------------]]-- it's a pair of lightsabers!

	if playerShip.warp.endTime ~= 0.0 then
		if newTime - playerShip.warp.endTime >= playerShip.warp.disengage then
			sound.play("WarpOut")
			playerShip.warp.endTime = 0.0
			playerShip.warp.finished = true
		end
	end
	
	if playerShip.warp.start.bool == true then
		if playerShip.warp.start.engine == false then -- once per warp init
			playerShip.warp.start.engine = true
			playerShip.warp.start.time = mode_manager.time()
		end
		if playerShip.warp.start.isStarted == true then
			if mode_manager.time() - playerShip.warp.start.time - playerShip.warp.soundNum * soundLength >= soundLength then
				playerShip.warp.start.isStarted = false
			end
		elseif playerShip.warp.start.isStarted == false then
			playerShip.warp.start.isStarted = true
			playerShip.warp.soundNum = playerShip.warp.soundNum + 1
			if playerShip.warp.soundNum <= 4 then
				sound.play("Warp" .. playerShip.warp.soundNum)
			elseif playerShip.warp.soundNum == 5 then
				sound.play("WarpIn")
				playerShip.warp.warping = true
				playerShip.warp.finished = false
				playerShip.warp.start.bool = false
			end
		end
	end
	
	if playerShip.warp.finished == false then
		playerShip.physicsObject.velocity = { x = playerShip.warpSpeed * math.cos(playerShip.physicsObject.angle), y = playerShip.warpSpeed * math.sin(playerShip.physicsObject.angle) }
	else	
		if hypot (playerShip.physicsObject.velocity.x, playerShip.physicsObject.velocity.y) > playerShip.maxSpeed then
			playerShip.physicsObject.velocity = { x = playerShip.maxSpeed * normalize(playerShip.physicsObject.velocity.x, playerShip.physicsObject.velocity.y), y = playerShip.maxSpeed * normalize(playerShip.physicsObject.velocity.y, playerShip.physicsObject.velocity.x) }
		end
	end
	
--[[------------------
	Movement
------------------]]--
	
    if keyboard[1][4].active == true then
		if key_press_f6 ~= true then
			playerShip.physicsObject.angular_velocity = playerShip.turningRate
		else
			playerShip.physicsObject.angular_velocity = playerShip.turningRate / 10
		end
    elseif keyboard[1][5].active == true then
		if key_press_f6 ~= true then
			playerShip.physicsObject.angular_velocity = -playerShip.turningRate
		else
			playerShip.physicsObject.angular_velocity = -playerShip.turningRate / 10
		end
    else
        playerShip.physicsObject.angular_velocity = 0
    end
	
	if keyboard[1][2].active == true then
        -- apply a forward force in the direction the ship is facing
        local angle = playerShip.physicsObject.angle
        local thrust = playerShip.thrust
        local force = { x = thrust * math.cos(angle), y = thrust * math.sin(angle) }
		playerShip.physicsObject:apply_force(force)
	elseif keyboard[1][3].active == true then
        -- apply a reverse force in the direction opposite the direction the ship is MOVING
        local force = playerShip.physicsObject.velocity
		if force.x ~= 0 or force.y ~= 0 then
			if hypot(playerShip.physicsObject.velocity.x, playerShip.physicsObject.velocity.y) <= 10 then
				playerShip.physicsObject.velocity = { x = 0, y = 0 }
			else
				local velocityMag = hypot(force.x, force.y)
				force.x = -force.x / velocityMag
				force.y = -force.y / velocityMag
				force.x = force.x * playerShip.reverseThrust
				force.y = force.y * playerShip.reverseThrust
				playerShip.physicsObject:apply_force(force)
			end
		end
    end
	
	if showVelocity == true then
		print(playerShip.physicsObject.velocity.x)
		print(playerShip.physicsObject.velocity.y)
	end
	
--[[------------------
	C-Missile Firing
------------------]]--
	
	if playerShip.special ~= nil then
		WeaponManage(playerShip.special, playerShip.specialWeap, playerShip)
		--seeking code
		local wNum = 1
		while wNum <= playerShip.special.max_projectiles do
			if playerShip.specialWeap[wNum] ~= nil then
				if playerShip.specialWeap[wNum].isSeeking == true then
					playerShip.specialWeap[wNum].theta = find_angle(playerShip.specialWeap[wNum].physicsObject.position, playerShip.special.dest)
					if playerShip.specialWeap[wNum].physicsObject.angle ~= playerShip.specialWeap[wNum].theta then
						playerShip.specialWeap[wNum].delta = playerShip.specialWeap[wNum].theta - playerShip.specialWeap[wNum].physicsObject.angle
						if math.abs(playerShip.specialWeap[wNum].delta) > math.pi then -- need to go through 0
							if playerShip.specialWeap[wNum].delta > 0.0 then
								playerShip.specialWeap[wNum].delta = 2 * math.pi - playerShip.specialWeap[wNum].delta
							else
								playerShip.specialWeap[wNum].delta = 2 * math.pi + playerShip.specialWeap[wNum].delta
							end
						end
						if math.abs(playerShip.specialWeap[wNum].delta) > playerShip.specialWeap[wNum].turningRate * dt then
							if playerShip.specialWeap[wNum].delta > playerShip.specialWeap[wNum].turningRate * dt then
								playerShip.specialWeap[wNum].delta = -playerShip.specialWeap[wNum].turningRate * dt
							else
								playerShip.specialWeap[wNum].delta = playerShip.specialWeap[wNum].turningRate * dt
							end
						end
					else
						playerShip.specialWeap[wNum].delta = 0.0
					end
				else
					playerShip.specialWeap[wNum].delta = 0.0
				end
				playerShip.specialWeap[wNum].physicsObject.angle = playerShip.specialWeap[wNum].physicsObject.angle + playerShip.specialWeap[wNum].delta
				playerShip.specialWeap[wNum].force = { x = math.cos(playerShip.specialWeap[wNum].physicsObject.angle) * playerShip.special.thrust / playerShip.special.mass, y = math.sin(playerShip.specialWeap[wNum].physicsObject.angle) * playerShip.special.thrust / playerShip.special.mass }
				playerShip.specialWeap[wNum].physicsObject:apply_force(playerShip.specialWeap[wNum].force)
				if showAngles == true then
					print("For special #" .. wNum .. ":")
					print(playerShip.specialWeap[wNum].physicsObject.angle)
					print(playerShip.specialWeap[wNum].theta)
					print(playerShip.specialWeap[wNum].delta)
					print("----------------")
				end
				wNum = playerShip.special.max_projectiles
			end
			wNum = wNum + 1
		end
		--/seeking code
	end
	
-- PKBeam Firing
	
	WeaponManage(playerShip.beam, playerShip.beamWeap, playerShip)
	
-- Pathfinding for Ishiman Transports
	local num = 1
	if otherShip ~= nil then
		while otherShip[num] ~= nil do
			if otherShip[num].name == "Transport" then
				ai_pathfind(dt, otherShip[num], scen.planet2.position, computerShip)
				if otherShip[num].landing_size == 0 then
					table.remove(otherShip, num)
				end
			end
			num = num + 1
		end
	end
	
--[[------------------
	Panels
------------------]]--
	
	resourceTime = resourceTime + dt
	if resourceTime > 1 then
		resourceTime = resourceTime - 1
		cash = cash + 20
		resourceBars = math.floor(cash / 20000)
		resources = math.floor((cash % 20000) / 200)
	end
	
	if buildTimerRunning == true then
		scen.planet.buildqueue.current = scen.planet.buildqueue.current + dt
		scen.planet.buildqueue.percent = scen.planet.buildqueue.current / scen.planet.buildqueue.factor * 100
		if planet.buildqueue.percent > 100.0 then
			local num = 1
			if otherShip == nil then
				otherShip = {}
			end
			while otherShip[num] ~= nil do
				num = num + 1
			end
			if num == 3 and otherShip[2] == nil then -- I don't know why this works, but it does
				num = num - 1
			end
			otherShip[num] = NewEntity(shipBuilding.p, shipBuilding.n, "Ship", shipBuilding.r)
		--	print(otherShip[num], playerShip)
			planet.buildqueue.percent = 100
			buildTimerRunning = false
			sound.play("ComboBeep")
		end
	end
	
	playerShip.battery.percent = playerShip.battery.level / playerShip.battery.total
	playerShip.energy.percent = playerShip.energy.level / playerShip.energy.total
	playerShip.shield.percent = playerShip.shield.level / playerShip.shield.total
	if playerShip.energy.percent ~= 1.0 then
		rechargeTimer = rechargeTimer + dt
		if rechargeTimer >= 0.5 then
			if playerShip.battery.percent ~= 0.0 then
				playerShip.battery.level = playerShip.battery.level - 1
				playerShip.energy.level = playerShip.energy.level + 1
				rechargeTimer = rechargeTimer - 0.5
			end
		end
	end
	if menu_display == nil then
		if keyboard[4][7].active == false then
			physics.update(dt)
		else
			physics.update(dt * 30)
		end
	end
	KeyDoActivated()
end

--[[-----------------------------
	--{{---------------------
		Weapon Management
	---------------------}}--
-----------------------------]]--

function WeaponManage(weapon, weapData, weapOwner) -- examples: weapon = playerShip.beam, weapData = playerShip.beamWeap, weapOwner = playerShip
-- handling of new projectile
	if weapon.firing == true then
		if weapon.cooldown <= mode_manager.time() - weapon.start then
			sound.play(weapon.sound)
			weapon.fired = true
			weapon.start = mode_manager.time()
			local wNum = 1
			while wNum <= weapon.max_projectiles do
				if weapData[wNum] == nil then
					if weapon.image ~= nil then
						weapData[wNum] = NewEntity(weapOwner, weapon.image, "Projectile", weapon.class)
					else
						weapData[wNum] = NewEntity(weapOwner, weapon.fileName, "Projectile", weapon.class)
					end
					weapData[wNum].start = mode_manager.time()
					if weapon.class == "beam" then
						-- [ADAM, FIX] this piece of code is a hack, it relies on what little weapons we have right now to make the assumption
						if weapOwner.switch == true then
							weapData[wNum].physicsObject.position = { x = weapOwner.physicsObject.position.x + math.cos(weapData[wNum].physicsObject.angle + 0.17) * (weapon.length - 3), y = weapOwner.physicsObject.position.y + math.sin(weapData[wNum].physicsObject.angle + 0.17) * (weapon.length - 3) }
							weapOwner.switch = false
						else
							weapData[wNum].physicsObject.position = { x = weapOwner.physicsObject.position.x + math.cos(weapData[wNum].physicsObject.angle - 0.17) * (weapon.length - 3), y = weapOwner.physicsObject.position.y + math.sin(weapData[wNum].physicsObject.angle - 0.17) * (weapon.length - 3) }
							weapOwner.switch = true
						end
						weapOwner.energy.level = weapOwner.energy.level - weapon.cost
					elseif weapon.class == "pulse" then
						return
					elseif weapon.class == "special" then
						weapData[wNum].dest = { x = computerShip.physicsObject.position.x, y = computerShip.physicsObject.position.y }
						weapOwner.special.ammo = weapOwner.special.ammo - 1
						
						if computerShip == nil then
							weapData[wNum].isSeeking = false
						end
						if weapData[wNum].isSeeking == true then
							local projectileTravel = { x, y, dist }
							projectileTravel.dist = (weapOwner.special.thrust * weapOwner.special.life * weapOwner.special.life / 1000000) / (2 * weapOwner.special.mass)
							projectileTravel.x = math.cos(weapData[wNum].physicsObject.angle) * (projectileTravel.dist + weapData[wNum].physicsObject.velocity.x)
							projectileTravel.y = math.sin(weapData[wNum].physicsObject.angle) * (projectileTravel.dist + weapData[wNum].physicsObject.velocity.y)
							if find_hypot(weapData[wNum].physicsObject.position, weapData[wNum].dest) <= hypot(projectileTravel.x, projectileTravel.y) then
								if showAngles == true then
									print(find_angle(weapData[wNum].dest, weapData[wNum].physicsObject.position))
									print(weapData[wNum].physicsObject.angle)
									print(find_angle(weapData[wNum].dest, weapData[wNum].physicsObject.position) - weapData[wNum].physicsObject.angle)
								end
								local angle = find_angle(weapData[wNum].dest, weapData[wNum].physicsObject.position) - weapData[wNum].physicsObject.angle
								if math.abs(angle) > math.pi then -- need to go through 0
									if angle > 0.0 then
										angle = 2 * math.pi - angle
									else
										angle = 2 * math.pi + angle
									end
								end
								if math.abs(angle) > weapData[wNum].maxSeek then
									weapData[wNum].isSeeking = false
								end
							else
								weapData[wNum].isSeeking = false
							end
						else
							weapData[wNum].isSeeking = false
						end
					elseif weapon.class == nil then
						LogError("Projectile '" .. entType .. "' has no class.", 12)
					else
						LogError("Unknown projectile class '" .. entClass .. "'", 11)
					end
					wNum = weapon.max_projectiles -- exit while loop
				end
				wNum = wNum + 1
			end
			weapon.fired = true
		end
	end

-- handling for existing weapons and projectiles
	local wNum = 1
	while wNum <= 50 do
		if weapData[wNum] ~= nil then
			if weapData[wNum].physicsObject == nil then
				-- this object needs to be deleted, probably the initializing table
				table.remove(weapData, wNum)
			else
				if computerShip ~= nil then
					local x = computerShip.physicsObject.position.x - weapData[wNum].physicsObject.position.x
					local y = computerShip.physicsObject.position.y - weapData[wNum].physicsObject.position.y
					-- put in real collision code here [ALISTAIR, DEMO2]
					if hypot (x, y) <= computerShip.physicsObject.collision_radius * 2 / 7 then
						ProjectileCollision(weapData, wNum, weapon, computerShip)
						return
					end
				end
				if mode_manager.time() - weapData[wNum].start >= weapon.life then
					table.remove(weapData, wNum)
					if weapData[1] ~= nil then
						weapon.fired = true
					else
						weapon.fired = false
					end
				end
			end
		end
		wNum = wNum + 1
	end
end

--[[---------------------
	--{{-------------
		Rendering
	-------------}}--
---------------------]]--

function render ()
    graphics.begin_frame()
	-- extract camera coordinates from here during update() and place finalized numbers here
	graphics.set_camera(-playerShip.physicsObject.position.x + shipAdjust - (camera.w / 2.0), -playerShip.physicsObject.position.y - (camera.h / 2.0), -playerShip.physicsObject.position.x + shipAdjust + (camera.w / 2.0), -playerShip.physicsObject.position.y + (camera.h / 2.0))
	graphics.draw_starfield(3.4)
	graphics.draw_starfield(1.8)
	graphics.draw_starfield(0.6)
	graphics.draw_starfield(-0.3)
	graphics.draw_starfield(-0.9)
	
--[[------------------
	Grid Drawing
------------------]]--
	
	local i = 0
	while i ~= 500 do
		if (i * GRID_DIST_BLUE) % GRID_DIST_LIGHT_BLUE == 0 then
			if (i * GRID_DIST_BLUE) % GRID_DIST_GREEN == 0 then
				graphics.draw_line(-60000, -i * GRID_DIST_BLUE, 60000, -i * GRID_DIST_BLUE, 1, ClutColour(5, 1))
				graphics.draw_line(-60000, i * GRID_DIST_BLUE, 60000, i * GRID_DIST_BLUE, 1, ClutColour(5, 1))
				graphics.draw_line(-i * GRID_DIST_BLUE, -60000, -i * GRID_DIST_BLUE, 60000, 1, ClutColour(5, 1))
				graphics.draw_line(i * GRID_DIST_BLUE, -60000, i * GRID_DIST_BLUE, 60000, 1, ClutColour(5, 1))
			else
				graphics.draw_line(-60000, -i * GRID_DIST_BLUE, 60000, -i * GRID_DIST_BLUE, 1, ClutColour(4, 8))
				graphics.draw_line(-60000, i * GRID_DIST_BLUE, 60000, i * GRID_DIST_BLUE, 1, ClutColour(4, 8))
				graphics.draw_line(-i * GRID_DIST_BLUE, -60000, -i * GRID_DIST_BLUE, 60000, 1, ClutColour(4, 8))
				graphics.draw_line(i * GRID_DIST_BLUE, -60000, i * GRID_DIST_BLUE, 60000, 1, ClutColour(4, 8))
			end
		else
			if cameraRatio > 1 / 8 then
				graphics.draw_line(-60000, -i * GRID_DIST_BLUE, 60000, -i * GRID_DIST_BLUE, 1, ClutColour(4, 11))
				graphics.draw_line(-60000, i * GRID_DIST_BLUE, 60000, i * GRID_DIST_BLUE, 1, ClutColour(4, 11))
				graphics.draw_line(-i * GRID_DIST_BLUE, -60000, -i * GRID_DIST_BLUE, 60000, 1, ClutColour(4, 11))
				graphics.draw_line(i * GRID_DIST_BLUE, -60000, i * GRID_DIST_BLUE, 60000, 1, ClutColour(4, 11))
			end
		end
		i = i + 1
	end
	
--[[------------------
	Planet Drawing
------------------]]--
	
	
	function drawPlanet(planet)
		if cameraRatio > 1 / 8 then
			local xCoord; local yCoord
			xCoord, yCoord = graphics.sprite_dimensions("Planets/" .. planet.image)
			graphics.draw_sprite("Planets/" .. planet.image, planet.position.x, planet.position.y, xCoord, yCoord, 1)
		else
			if planet.owner ~= Admirals[1].ident then
				graphics.draw_rbox(planet.position.x, planet.position.y, 60, ClutColour(16, 1))
			else
				graphics.draw_rbox(planet.position.x, planet.position.y, 60)
			end
		end
	end
	
	drawPlanet(scen.planet)
	drawPlanet(scen.planet2)
	
--[[------------------
	Ship Drawing
------------------]]--
	if computerShip ~= nil then
		if computerShip.life > 0 then
			if cameraRatio > 1 / 8 then
				graphics.draw_sprite("Ships/Gaitori/Carrier", computerShip.physicsObject.position.x, computerShip.physicsObject.position.y, computerShip.size.x, computerShip.size.y, computerShip.physicsObject.angle)
			else
				graphics.draw_rdia(computerShip.physicsObject.position.x, computerShip.physicsObject.position.y, 60, ClutColour(16, 1) )
			end
		else
			-- This explosion code is a hack. We need a way to deal with explosions in a better method.
			-- Let's figure it out when we get Sfiera's data [ADAM, SFIERA]
			if computerShip ~= nil then
				if cameraRatio > 1 / 8 then
					graphics.draw_sprite(bestExplosion.image, computerShip.physicsObject.position.x, computerShip.physicsObject.position.y, bestExplosion.size.x, bestExplosion.size.y, frame / 6 * math.pi)
				end
				if frame == 0 then
					sound.play("New/ExplosionCombo")
				end
				if frame >= 12 then
					computerShip = nil
				else
					frame = frame + dt * 50
				end
			end
		end
	end
	if otherShip ~= nil then
		num = 1
		while otherShip[num] ~= nil do
			if cameraRatio > 1 / 8 then
				if otherShip[num].name ~= "Transport" then
					graphics.draw_sprite(otherShip[num].image, otherShip[num].physicsObject.position.x, otherShip[num].physicsObject.position.y, otherShip[num].size.x, otherShip[num].size.y, otherShip[num].physicsObject.angle)
				else
					graphics.draw_sprite(otherShip[num].image, otherShip[num].physicsObject.position.x, otherShip[num].physicsObject.position.y, otherShip[num].size.x * otherShip[num].landing_size, otherShip[num].size.y * otherShip[num].landing_size, otherShip[num].physicsObject.angle)
				end
			else
				if otherShip[num].name ~= "Transport" then
					graphics.draw_rtri(otherShip[num].physicsObject.position.x, otherShip[num].physicsObject.position.y, 60)
				else
					graphics.draw_rplus(otherShip[num].physicsObject.position.x, otherShip[num].physicsObject.position.y, 60)
				end
			end
			num = num + 1
		end
	end
	if cameraRatio > 1 / 8 then
		graphics.draw_sprite(playerShip.image, playerShip.physicsObject.position.x, playerShip.physicsObject.position.y, playerShip.size.x, playerShip.size.y, playerShip.physicsObject.angle)
	else
		graphics.draw_rtri(playerShip.physicsObject.position.x, playerShip.physicsObject.position.y, 60)
	end
	
--[[------------------
	PKBeam Firing
------------------]]--
--	print_table(playerShip.beamWeap)
	if playerShip.beam.fired == true then
		local wNum = 1
		while wNum <= playerShip.beam.max_projectiles do
		--	print(wNum, playerShip.beamWeap[wNum])
			if playerShip.beamWeap[wNum] ~= nil then
			--	print_table(playerShip.beamWeap[wNum])
				graphics.draw_line(playerShip.beamWeap[wNum].physicsObject.position.x, playerShip.beamWeap[wNum].physicsObject.position.y, playerShip.beamWeap[wNum].physicsObject.position.x - math.cos(playerShip.beamWeap[wNum].physicsObject.angle) * playerShip.beam.length, playerShip.beamWeap[wNum].physicsObject.position.y - math.sin(playerShip.beamWeap[wNum].physicsObject.angle) * playerShip.beam.length, playerShip.beam.width, ClutColour(5, 1))
			end
			wNum = wNum + 1
		end
	end
	
--[[------------------
	C-Missile Firing
------------------]]--
	
	if playerShip.special.fired == true then
		local wNum = 1
		while wNum <= playerShip.special.max_projectiles do
			if playerShip.specialWeap[wNum] ~= nil then
				print_table(playerShip.special)
				graphics.draw_sprite("Weapons/Special/cMissile", playerShip.specialWeap[wNum].physicsObject.position.x, playerShip.specialWeap[wNum].physicsObject.position.y, playerShip.special.size.x, playerShip.special.size.y, playerShip.specialWeap[wNum].physicsObject.angle)
			end
			wNum = wNum + 1
		end
	end
	
--[[------------------
	Miscellaneous
------------------]]--
	
-- Arrow
	local angle = playerShip.physicsObject.angle
	graphics.draw_line(math.cos(arrowAlpha + angle) * arrowDist + playerShip.physicsObject.position.x, math.sin(arrowAlpha + angle) * arrowDist + playerShip.physicsObject.position.y, math.cos(angle - arrowAlpha) * arrowDist + playerShip.physicsObject.position.x, math.sin(angle - arrowAlpha) * arrowDist + playerShip.physicsObject.position.y, 1.5, ClutColour(5, 1))
	graphics.draw_line(math.cos(angle - arrowAlpha) * arrowDist + playerShip.physicsObject.position.x, math.sin(angle - arrowAlpha) * arrowDist + playerShip.physicsObject.position.y, math.cos(angle) * (arrowLength + arrowVar) + playerShip.physicsObject.position.x, math.sin(angle) * (arrowLength + arrowVar) + playerShip.physicsObject.position.y, 1.5, ClutColour(5, 1))
	graphics.draw_line(math.cos(angle) * (arrowLength + arrowVar) + playerShip.physicsObject.position.x, math.sin(angle) * (arrowLength + arrowVar) + playerShip.physicsObject.position.y, math.cos(arrowAlpha + angle) * arrowDist + playerShip.physicsObject.position.x, math.sin(arrowAlpha + angle) * arrowDist + playerShip.physicsObject.position.y, 1.5, ClutColour(5, 1))
-- Panels
	DrawPanels()
-- Console
	PopDownConsole()
-- Mouse
	--[[ disabled for now
	if mouseMovement == true then
		-- draw mouse replacement
		-- check to see if it's over the panels
		-- if it's not, draw the lines coming inward
		graphics.draw_line(-410, mousePos.y, mousePos.x - 20, mousePos.y, 1.0, ClutColour(4, 8))
		graphics.draw_line(410, mousePos.y, mousePos.x + 20, mousePos.y, 1.0, ClutColour(4, 8))
		graphics.draw_line(mousePos.x, -310, mousePos.x, mousePos.y - 20, 1.0, ClutColour(4, 8))
		graphics.draw_line(mousePos.x, 310, mousePos.x, mousePos.y + 20, 1.0, ClutColour(4, 8))
		-- if it is, draw the cursor
		cursorx, cursory = graphics.sprite_dimensions("Misc/Cursor")
		graphics.draw_sprite("Misc/Cursor", mousePos.x, mousePos.y, cursorx, cursory, 0)
		-- check mouse idleness timer
		if mode_manager.time() - mouseStart >= 2.0 then
			mouseMovement = false
		end
	end --]]
-- Menus
	InterfaceDisplay(dt)
-- Error Printing
	if errNotice ~= nil then
		graphics.draw_text(errNotice.text, "CrystalClear", "center", 0, -150, 28)
		if errNotice.start + errNotice.duration < mode_manager.time() then
			errNotice = nil
		end
	end
	if tab_down == true then
		ClutDisplay()
	end
	graphics.end_frame()
end

--[[------------------------
	--{{----------------
		Key Handling
	----------------}}--
------------------------]]--

function keyup ( k )
	KeyDeactivate(k)
end

normal_keyup = keyup

function key ( k )
	if k == "`" then
		if releaseBuild == false then
			consoleDraw = true
		end
	elseif k == "p" then
		if releaseBuild == false then
			computerShip.life = 0
		end
	elseif k == "o" then
		if releaseBuild == false then
			menu_display = "pause_menu"
		end
	elseif k == "[" then
		if releaseBuild == false then
			playerShip.life = 0
			keyup = escape_keyup
			key = escape_key
		end
	elseif k == "escape" then
		menu_display = "esc_menu"
		keyup = escape_keyup
		key = escape_key
	else
        KeyActivate(k)
	end
end

normal_key = key

function mouse(button, mbX, mbY)
--	print(mbX, mbY)
end

function mouse_up(button, mbX, mbY)

end

function mouse_move(mbX, mbY)
	mouseMovement = true
	mousePos = { x = mbX, y = mbY }
	mouseStart = mode_manager.time()
end


function quit ()
    physics.close()
end
