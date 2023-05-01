wait(1)

local ParticleEmitter = Instance.new("ParticleEmitter")
local part = Instance.new("Part")
local mesh = Instance.new("SpecialMesh")
local timer = 0

part.Parent = workspace
part.Size = Vector3.new(5, 5, 5)
part.Color = Color3.new(1, 1, 1)
part.Anchored = true
part.Name = "stupid cloud"

mesh.Parent = part
mesh.Scale = Vector3.new(4, 2, 4)
mesh.MeshId = "rbxassetid://11328480674"
mesh.Name = "i am the storm that is approaching, provoking, black clouns in isolation. I am reclaimer of my name, born in flame. I have been blessed, my family crest is a demon of death!"

ParticleEmitter.LightInfluence = 1
ParticleEmitter.Lifetime = NumberRange.new(1, 1)
ParticleEmitter.Speed = NumberRange.new(100, 100)
ParticleEmitter.Rate = 1000
ParticleEmitter.EmissionDirection = Enum.NormalId.Bottom
ParticleEmitter.Texture = "rbxassetid://671728795"
ParticleEmitter.Parent = part
ParticleEmitter.Name = "rainwaa"

while true do
	local player = game.Players.LocalPlayer
	local char = player.Character
	
	local posX = char.HumanoidRootPart.Position.X
	local posZ = char.HumanoidRootPart.Position.Z
	
	wait(0.025)
	timer = timer + 0.025
	part.Position = Vector3.new(posX, (math.cos(timer - 2) * 1.25) * 3 + 10, posZ)
end
