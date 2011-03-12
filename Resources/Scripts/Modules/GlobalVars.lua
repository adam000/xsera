import('Math')
import('AresCLUT')
if data == nil then import('data') end
import('Camera')

--[[
    [TODO]
    This file needs to be better split into chunks so that the information is
    decipherable.
--]]

-- build constants
RELEASE_BUILD = mode_manager.is_release()

-- warp constants
WARP_TIME = 1.2
WARP_OUT_TIME = 5 / 3
WARP_IDLE = 0
WARP_SPOOLING = 1
WARP_ABORTING = 1.5
WARP_RUNNING = 2
WARP_COOLING = 3
SLOW_FROM_WARP = 5 / 3
WARP_SOUND_LENGTH = 0.3

--these limits are the values for ares but we can go MUCH higher if we want to :3
MAX_PLAYERS = 4
MAX_COUNTERS = 3 --per player

SPEED_FACTOR = 64.0
TIME_FACTOR = 60.0
BEAM_LENGTH = 48

-- font constants
MAIN_FONT = "prototype"
TITLE_FONT = "sneakout"

--[SCOTT] Recharge rates need tuning
BASE_RECHARGE_RATE = 4.0
ENERGY_RECHARGE_RATIO = 11.0
SHIELD_RECHARGE_MAX = 1.0 / 2.0
SHIELD_RECHARGE_RATIO = 5.0
WEAPON_RESTOCK_RATIO = 2.0
WEAPON_RESTOCK_RATE = 4.0

DEFAULT_ROTATION_RATE = math.pi
RESTITUTION_COEFFICIENT = 1.0
CONSTRUCTION_POINTS_PER_TICK = 200
RESOURCES_PER_SEC = 20  

GRID_DIST_BLUE = 512
GRID_DIST_LIGHT_BLUE = 4096
GRID_DIST_GREEN = 32768

-- ship guiding arrow constants and variables
-- the all caps should remain constant, the others should change with the camera ratio
ARROW_LENGTH = 135
ARROW_VAR = (3 * math.sqrt(3))
ARROW_DIST = hypot(6, (ARROW_LENGTH - ARROW_VAR))
ARROW_ALPHA = math.atan2(6, ARROW_DIST)
arrowLength = ARROW_LENGTH
arrowVar = ARROW_VAR
arrowDist = ARROW_DIST
arrowAlpha = ARROW_ALPHA

MOUSE_RADIUS = 15

demoLevel = 26
shipSeek = false
blinkMode = "triangle"

-- mouse variables
oldMousePos = vec(0, 0)
mouseStart = 0

-- camera variables
cameraSnap = false
requestedCamRatio = 1

-- scenario variables
scen = nil
victoryTimer = nil
defeatTimer = 0
endGameData = nil

-- ship computer level variable
menuLevel = menuOptions

-- client-server variables
isMultiplayer = false

-- metatable variable?
weak = {__mode = "v"}
