-- demo script: Player is Ishiman Heavy Cruiser, opponent is Gaitori Carrier.
-- Carrier has no AI, so it just sits there. Player must warp to Carrier's position
-- and can destroy it using both seeking and non-seeking weapons. Script ends when
-- Carrier is destroyed.

-- Future possible script variations:
-- Using autopilot to find Carrier.
-- Carrier has a "fleeing" AI, and runs away when attacked, possibly warping away.
-- Carrier has other AIs.
-- Implement planets.
-- Use other Heavy Cruisers (possibly built on planets) to destroy Carrier, using attack command.

import('EntityLoad')
import('Math')
import('Bullet4Demo')
import('Warping4Demo')

camera = { w = 1000, h = 1000 }
local shipAdjust = 45
--[[ SOLUTION:
local aspectRatio = getAspectRatio()
camera = { w = 640, h = camera.w / aspectRatio }
PROBLEM: WHAT ABOUT shipAdjust?????
--]]

playerShip = nil
cMissile = nil
pkBeam = nil
bestExplosion = nil

ships = {}
local frame = 0
local lastFrame = 0

drawshot = false
shotfired = 0
shot = { x = 0, y = 0, timeStart = 0 }

local warpStart = false
local startTime = 0.0
local startEngine = false
local soundStarted = false
local timeSinceStart = 0.0
local soundLength = 0.5
local soundNum = 0
local warping = false
local endWarp = 0.0
local warpSlow = 2.0
local warpSpeed = 2.0

local bulletFired = false
local bulletRotation = 0

local arrowVar = (5.5 * math.sqrt(3))
local arrowDist = hypot(11, (300 - arrowVar))
local arrowAlpha = math.atan2(11, arrowDist)

keyControls = { left = false, right = false, forward = false, brake = false }

function init ()
	sound.stop_music()
    lastTime = mode_manager.time()
    physics.open(0.6)
    playerShip = NewShip("Ishiman/HeavyCruiser")
	computerShip = NewShip("Gaitori/Carrier")
	cMissile = NewBullet("WhiteYellowMissile")
	pkBeam = NewBullet("PKBeam")
	bestExplosion = NewExplosion("BestExplosion")
end

function update ()
	local newTime = mode_manager.time()
	local dt = newTime - lastTime
	lastTime = newTime
	
--[[------------------
	Warping Code
------------------]]-- it's a pair of lightsabers!

	if endWarp ~= 0.0 then -- temporary code while I wait to be able to use deceleration...
		if newTime - endWarp >= warpSlow then
			endWarp = 0.0
			sound.play("WarpOut")
		end
	end
	
	if warpStart == true then
		if startEngine == false then -- once per warp init
			startEngine = true
			startTime = mode_manager.time()
		end
		timeSinceStart = mode_manager.time() - startTime
		if soundStarted == true then
			if timeSinceStart - soundNum * soundLength >= soundLength then
				soundStarted = false
			end
		elseif soundStarted == false then
			soundStarted = true
			soundNum = soundNum + 1
			if soundNum <= 4 then
				sound.play("Warp" .. soundNum)
			elseif soundNum == 5 then
				sound.play("WarpIn")
				warping = true
				warpStart = false
			end
		end
	end
	
	if warping == true then
		local force = { x = warpSpeed * math.cos(playerShip.physicsObject.angle), y = warpSpeed * math.sin(playerShip.physicsObject.angle) }
		playerShip.physicsObject:apply_force(force)
	end
	
--[[------------------
	Movement
------------------]]--
	
    if keyControls.left then
        playerShip.physicsObject.angular_velocity = playerShip.turningRate
    elseif keyControls.right then
        playerShip.physicsObject.angular_velocity = -playerShip.turningRate
    else
        playerShip.physicsObject.angular_velocity = 0
    end
	
	if keyControls.forward then
        -- apply a forward force in the direction the ship is facing
        local angle = playerShip.physicsObject.angle
        local thrust = playerShip.thrust
        local force = { x = thrust * math.cos(angle), y = thrust * math.sin(angle) }
	--	playerShip.physicsObject:apply_force(force)
	elseif keyControls.brake then
        -- apply a reverse force in the direction opposite the direction the ship is MOVING
        local velocityVector = playerShip.physicsObject.velocity
		if velocityVector.x ~= 0 or velocityVector.y ~= 0 then
			local velocityMag = hypot(velocityVector.x, velocityVector.y)
			velocityVector.x = -velocityVector.x / velocityMag
			velocityVector.y = -velocityVector.y / velocityMag
			local thrust = playerShip.reverseThrust
			velocityVector.x = velocityVector.x * thrust
			velocityVector.y = velocityVector.y * thrust
		--	playerShip.physicsObject:apply_force(velocityVector)
		end
    end
	
--[[------------------
	C-Missile Firing
------------------]]--
	
	if firebullet == true then
		fire_bullet()
		firebullet = false
		bulletFired = true
	end

	if bulletFired == true then
		local bulletLocation = playerShip.physicsObject.position
		for playerShip, cMissile in physics.collisions() do
		--what is above madness?
			collision()
		end		
		bullet.alpha = find_angle({ x = 0, y = 0 }, cMissile.physicsObject.position)
		bullet.beta = find_angle(cMissile.physicsObject.position, bullet.dest)
		print(bullet.alpha)
		print(bullet.beta)
		print(bullet.theta)
		print("________________")
		
		-- use a bullet4demo function (then merge for final demo?)
		if bullet.alpha ~= bullet.beta then
			guide_bullet()
		end
		
	--	bullet.force.x = math.cos(bullet.theta) * bullet.power
	--	bullet.force.y = math.sin(bullet.theta) * bullet.power
		
	--	physbullet:set_angle(bullet.theta)
	--	physbullet:update(dt, bullet.force, bullet.delta * 1000)
	end
	
	physics.update(dt)
end

function render ()
    graphics.begin_frame()
	graphics.set_camera(playerShip.physicsObject.position.x + shipAdjust - (camera.w / 2.0), playerShip.physicsObject.position.y - (camera.h / 2.0), playerShip.physicsObject.position.x + shipAdjust + (camera.w / 2.0), playerShip.physicsObject.position.y + (camera.w / 2.0))
--	print(playerShip.physicsObject.position.x)
--	print(playerShip.physicsObject.position.y)
	graphics.draw_starfield()
    if carrierHealth ~= 0 then
		graphics.draw_sprite("Gaitori/Carrier", carrierLocation.x, carrierLocation.y, computerShip.size.x, computerShip.size.y, carrierRotation)
    else
		if carrierExploded == false then
			if frame == 0 then
				sound.play("New/ExplosionCombo")
			end
			if frame == 12 then
				carrierExploded = true
			else
				frame = frame + 0.5
			end
			graphics.draw_sprite("Explosions/BestExplosion", carrierLocation.x, carrierLocation.y, bestExplosion.size.x, bestExplosion.size.y, frame / 6 * math.pi)
		end
	end
	graphics.draw_sprite(playerShip.image, playerShip.physicsObject.position.x, playerShip.physicsObject.position.y, playerShip.size.x, playerShip.size.y, playerShip.physicsObject.angle)
	
	if shotfired == true then
		shot.move = shot.move + 15
		if shot.move >= 240 then
			shotfired = false
		end
	--	for playerShip, cMissile in physics.collisions() do
	--		collision()
	--	end		
		--how do I make the above lines work for PKBeams, which are not attached to the physics system? should they be added to the physics system?
		graphics.draw_line(shot.x + math.cos(bulletRotation) * shot.move, shot.y + math.sin(bulletRotation) * shot.move, shot.x + math.cos(bulletRotation) * (30 + shot.move), shot.y + math.sin(bulletRotation) * (30 + shot.move), 2)
	end
	
	if drawshot == true then
		bulletRotation = playerShip.physicsObject.angle
		shot.x = playerShip.physicsObject.position.x
		shot.y = playerShip.physicsObject.position.y
		shot.move = 19
		graphics.draw_line(shot.x + math.cos(bulletRotation) * 17, shot.y + math.sin(bulletRotation) * 17, shot.x + math.cos(bulletRotation) * 52, shot.y + math.sin(bulletRotation) * 52, 2)
		drawshot = false
		shotfired = true
	end
	
	if bulletFired == true then
		local bulletLocation = cMissile.physicsObject.position
		graphics.draw_sprite("Weapons/WhiteYellowMissile", bulletLocation.x, bulletLocation.y, bullet.size.x, bullet.size.y, cMissile.physicsObject.angle)
	end
	
	local angle = playerShip.physicsObject.angle
	graphics.set_camera(-500 + shipAdjust, -500, 500 + shipAdjust, 500)
	graphics.draw_line(math.cos(arrowAlpha + angle) * arrowDist, math.sin(arrowAlpha + angle) * arrowDist, math.cos(angle - arrowAlpha) * arrowDist, math.sin(angle - arrowAlpha) * arrowDist, 2)
	graphics.draw_line(math.cos(angle - arrowAlpha) * arrowDist, math.sin(angle - arrowAlpha) * arrowDist, math.cos(angle) * (300 + arrowVar), math.sin(angle) * (300 + arrowVar), 2)
	graphics.draw_line(math.cos(angle) * (300 + arrowVar), math.sin(angle) * (300 + arrowVar), math.cos(arrowAlpha + angle) * arrowDist, math.sin(arrowAlpha + angle) * arrowDist, 2)
	graphics.set_camera(-500, -500, 500, 500)
	graphics.draw_image("Panels/SideLeft", -435, 0, 129, 1012)
    graphics.draw_image("Panels/SideRight", 487, -2, 27, 1020)
	graphics.end_frame()
end

function keyup ( k )
    if k == "w" then
        keyControls.forward = false
    elseif k == "s" then
        keyControls.brake = false
    elseif k == "a" then
        keyControls.left = false
    elseif k == "d" then
        keyControls.right = false
    elseif k == "tab" then
		warpStart = false
		startTime = nil
		startEngine = false
		soundStarted = false
		timeSinceStart = 0.0
		soundLength = 0.25
		soundNum = 0.0
		if warping == true then
			warping = false
			endWarp = mode_manager.time()
		end
	end
end

function key ( k )
    if k == "w" then
        keyControls.forward = true
    elseif k == "s" then
        keyControls.brake = true
    elseif k == "a" then
        keyControls.left = true
    elseif k == "d" then
        keyControls.right = true
	elseif k == "z" then
		firebullet = true
	elseif k == "tab" then
		warpStart = true
	elseif k == " " then
		sound.play("ShotC")
		drawshot = true;
	elseif k == "p" then
		carrierHealth = 0
	elseif k == "escape" then
		mode_manager.switch("MainMenu")
	end
end

function quit ()
    physics.close()
end