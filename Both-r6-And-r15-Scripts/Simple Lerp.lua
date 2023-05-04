--Simple Lerp
--	Made by _water#3201
--  	This example is r6

--Example Variables
local plr = game.Players.LocalPlayer --Needed for basically every exploit
local char =  plr.Character --Needed for basically every exploit

local LS = char.Torso["Left Shoulder"]
local RS = char.Torso["Right Shoulder"]
--End

--Math ( So you don't have to spend extra time typing "math.blahblahblah(Integer)" )
local randomseed = math.randomseed
local random = math.random
local floor = math.floor
local clamp = math.clamp
local atan2 = math.atan2
local log10 = math.log10
local noise = math.noise
local round = math.round
local frexp = math.frexp
local ldexp = math.ldexp
local sinh = math.sinh
local acos = math.acos
local asin = math.asin
local atan = math.atan 
local huge = math.huge
local tanh = math.tanh
local modf = math.modf
local sign = math.sign
local cosh = math.cosh
local sqrt = math.sqrt
local ceil = math.ceil
local fmod = math.fmod
local log = math.log
local sin = math.sin
local cos = math.cos
local tan = math.tan
local rad = math.rad
local abs = math.abs
local max = math.max
local min = math.min
local deg = math.deg
local exp = math.exp
local pow = math.pow
local pi = math.pi
--End

--Main Function ( Does everything )
local function createLerp(autoConvertAngles, object, px, py, pz, rx, ry, rz, alpha) --you gotta get all the angles and positions yourself lol
	if object:IsA("Motor6D") then
		if autoConvertAngles == false then
			object.C0 = object.C0:Lerp((object.C0 * CFrame.new(px, py, pz)) * CFrame.fromEulerAnglesXYZ(rx, ry, rz), alpha)
		elseif autoConvertAngles == true then
			object.C0 = object.C0:Lerp((object.C0 * CFrame.new(px, py, pz)) * CFrame.fromEulerAnglesXYZ(rad(rx), rad(ry), rad(rz)), alpha)
		end
	else
		local name = object.ClassName
		error("The object's class has to be Motor6D; Object Class = "..name.."", 1)
	end
end
--End

--Zombie animation example with both autoConvert on and off
createLerp(false, RS, 0, 0, 0, rad(0), rad(0), rad(90), 1) --Longer
createLerp(true, LS, 0, 0, 0, 0, 0, -90, 1) --Smaller
--End

--Error Test
createLerp(false, plr, 0, 0, 0, rad(0), rad(0), rad(-90), 1)
--End
