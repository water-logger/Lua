--Simple Lerp
--	Made by _water#3201
--  This example is r6

--Variables
local plr = game.Players.LocalPlayer
local char =  plr.Character

local LS = char.Torso["Left Shoulder"]
local RS = char.Torso["Right Shoulder"]
--End

--Main Function ( Does everything )
local function createLerp(autoConvertAngles, object, px, py, pz, rx, ry, rz, alpha) --you gotta get all the angles and positions yourself lol
	if object:IsA("Motor6D") then
		if autoConvertAngles == false then
			object.C0 = object.C0:Lerp((object.C0 * CFrame.new(px, py, pz)) * CFrame.fromEulerAnglesXYZ(rx, ry, rz), alpha)
		elseif autoConvertAngles == true then
			object.C0 = object.C0:Lerp((object.C0 * CFrame.new(px, py, pz)) * CFrame.fromEulerAnglesXYZ(math.rad(rx), math.rad(ry), math.rad(rz)), alpha)
		end
	else
		local name = object.ClassName
    error("The object's class has to be Motor6D; Object Class = "..name.."", 1)
	end
end
--End

--Zombie animation example with both autoConvert on and off
createLerp(false, RS, 0, 0, 0, math.rad(0), math.rad(0), math.rad(90), 1) --Longer
createLerp(true, LS, 0, 0, 0, 0, 0, -90, 1) --Smaller
--End

--Error Test
createLerp(false, plr, 0, 0, 0, math.rad(0), math.rad(0), math.rad(-90), 1)
--End
