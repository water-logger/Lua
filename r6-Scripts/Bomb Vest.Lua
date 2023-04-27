wait(0.1)

local uis = game:GetService("UserInputService")
local cs = game:GetService("Chat")

local plr = game.Players.LocalPlayer
local char = plr.Character

local mesh = Instance.new("SpecialMesh")
local part = Instance.new("Part")
local weld = Instance.new("Weld")

part.Name = "a"
part.Parent = char:WaitForChild("HumanoidRootPart")
part.Size = Vector3.new(2, 2, 2)

mesh.Parent = part
mesh.MeshId = "rbxassetid://6773820661"
mesh.TextureId = "http://www.roblox.com/asset/?id=1179108570"
mesh.Scale = Vector3.new(0.012, 0.013, 0.01)

weld.Parent = char:FindFirstChild("HumanoidRootPart")
weld.Part0 = char:FindFirstChild("Torso") --FindFirstChild("HumanoidRootPart")
weld.Part1 = part

local function yabba(text)
	local explosion = Instance.new("Explosion")
	local light = Instance.new("PointLight")
	
	light.Color = Color3.new(1, 0, 0)
	light.Enabled = false
	light.Shadows = false
	light.Brightness = 40
	light.Parent = part
	light.Range = 8
	
	light.Enabled = true
	wait(0.2)
	light.Enabled = false
	wait(0.2)
	light.Enabled = true
	wait(0.2)
	light.Enabled = false
	cs:Chat(char:FindFirstChild("HumanoidRootPart"), text, "Red")
	wait(0.2)
	light.Enabled = true
	wait(0.2)
	light.Enabled = false
	wait(0.2)
	light.Enabled = true
	wait(0.2)
	light.Enabled = false
	wait(0.2)
	light.Enabled = true
	wait(0.2)
	light.Enabled = false
	wait(0.2)
	light.Enabled = true
	wait(0.2)
	light.Enabled = false
	wait(0.2)
	light.Enabled = true
	wait(0.2)
	light.Enabled = false
	
	explosion.Position = char:FindFirstChild("HumanoidRootPart").Position
	explosion.DestroyJointRadiusPercent = 1
	explosion.BlastRadius = 4
	explosion.BlastPressure = 500000
	explosion.ExplosionType = Enum.ExplosionType.CratersAndDebris
	explosion.TimeScale = 1
	explosion.Parent = workspace
	
	part:Destroy()
end

uis.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.F then
		yabba("\65\108\108\97\104\117\32\97\107\98\97\114\33") --yabba("A")
	end
end)
