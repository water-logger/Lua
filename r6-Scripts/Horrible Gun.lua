wait(1) --Does stuff

local Root =           game.Players.LocalPlayer.Character.HumanoidRootPart
local RunService =     game:GetService("RunService")
local mesh =           Instance.new("SpecialMesh")
local anim =           Instance.new("Animation")
local Player =         game.Players.LocalPlayer
local han =            Instance.new("Part")
local gun =            Instance.new("Tool")
local Mouse =          Player:GetMouse()
local Character =      Player.Character
local pod =            false
local ricochet =       false                          --turns off ricochet
local track =          nil
local velocity =       100
local GunYes =         Instance.new("Accessory")
local Mesh =           Instance.new("SpecialMesh")
local Handle =         Instance.new("Part")
local AccessoryWeld =  Instance.new("Weld")
local RootAttachment = Instance.new("Attachment")
local OriginalSize1 =  Instance.new("Vector3Value")
local OriginalSize =   Instance.new("Vector3Value")
local objectSpace =    CFrame.new(Vector3.new(1, -1.25, 0)) * CFrame.Angles(math.rad(-90), 0, 0)
local newCFrame =      AccessoryWeld.C1:ToWorldSpace(objectSpace)
local fold =           Instance.new("Folder")

fold.Name = "sfx"
fold.Parent = workspace

Character["Right Arm"].CanTouch = false

anim.AnimationId = "http://www.roblox.com/Asset?ID=13294513038"

gun.Name = "Pistol"
gun.RequiresHandle = true
gun.Parent = Player.Backpack

han.Size = Vector3.new(1, 1, 1)
han.Color = Color3.fromRGB(0, 0, 0)
han.Parent = gun
han.Name = "Handle"
han.CanTouch = false
han.CanCollide = false

mesh.MeshId = "rbxassetid://431083592"
mesh.TextureId = "rbxassetid://431083723"
mesh.Scale = Vector3.new(0.17, 0.17, 0.17)
mesh.Parent = han
mesh.Offset = mesh.Offset - Vector3.new(0, 0, 0.4)

GunYes.Name = "GunYes"

Handle.Name = "Handle"
Handle.BottomSurface = Enum.SurfaceType.Smooth
Handle.CanCollide = false
Handle.TopSurface = Enum.SurfaceType.Smooth
Handle.Size = Vector3.new(0.6249997615814209, 1, 2)
Handle.CFrame = CFrame.new(47.18254852294922, 6.529199600219727, -79.93499755859375)
Handle.Parent = GunYes

Mesh.Scale = Vector3.new(0.17000000178813934, 0.17000000178813934, 0.17000000178813934)
Mesh.MeshId = "rbxassetid://431083592"
Mesh.TextureId = "rbxassetid://431083723"
Mesh.MeshType = Enum.MeshType.FileMesh
Mesh.Parent = Handle

RootAttachment.Name = "RootAttachment"
RootAttachment.WorldPosition = Vector3.new(47.18254852294922, 6.529199600219727, -79.93499755859375)
RootAttachment.WorldCFrame = CFrame.new(47.18254852294922, 6.529199600219727, -79.93499755859375)
RootAttachment.Parent = Handle

OriginalSize.Name = "OriginalSize"
OriginalSize.Value = Vector3.new(0.6249997615814209, 1, 2)
OriginalSize.Parent = Handle

OriginalSize1.Name = "OriginalSize"
OriginalSize1.Value = Vector3.new(0.6249997615814209, 1, 2)
OriginalSize1.Parent = Handle

AccessoryWeld.Archivable = true
AccessoryWeld.Name = "AccessoryWeld"
AccessoryWeld.Parent = Handle

AccessoryWeld.Part1 = Character.HumanoidRootPart
AccessoryWeld.Part0 = Handle

AccessoryWeld.C1 = newCFrame

Character.Humanoid:AddAccessory(GunYes)

RunService.RenderStepped:Connect(function()
	if pod == true then
		local RootPos, MousePos = Root.Position, Mouse.Hit.Position
		Root.CFrame = CFrame.new(RootPos, Vector3.new(MousePos.X, RootPos.Y, MousePos.Z))
	end
end)

gun.Equipped:Connect(function()
	track = Character.Humanoid:LoadAnimation(anim)
	track.Priority = Enum.AnimationPriority.Action
	track.Looped = true
	track:Play()
	
	pod = true
	
	if GunYes.Parent == Character then
		GunYes.Parent = Player.PlayerGui
	end
end)

gun.Unequipped:Connect(function()
	pod = false
	
	if track then
		track:Stop()
	end
	
	if GunYes.Parent == Player.PlayerGui then
		GunYes.Parent = Character
	end
end)


gun.Activated:Connect(function()
	local bodyVelocity = Instance.new("BodyVelocity")
	local light = Instance.new("PointLight")
	local bullet = Instance.new("Part")
	local GunShot = Instance.new("Sound")
	local mousePos = Mouse.Hit.p
	
	GunShot.Name = "pew"
	GunShot.SoundId = "rbxassetid://1905367471"
	GunShot.Volume = 100
	GunShot.Parent = fold
	GunShot.Playing = true
	
	bullet.Size = Vector3.new(0.25, 0.25, 1)
	bullet.Color = Color3.new(1, 1, 0)
	bullet.Material = Enum.Material.Neon
	bullet.CFrame = CFrame.new(han.CFrame.p + Vector3.new(0, 0.5 ,0), mousePos)
	
	if ricochet == false then
		bullet.CanCollide = false
	else
		bullet.CanCollide = true
	end
	
	light.Range = 4
	light.Brightness = 15
	light.Shadows = false
	light.Enabled = true
	light.Color = Color3.fromRGB(255, 200, 0)
	light.Parent = bullet

	bodyVelocity.Velocity = bullet.CFrame.lookVector * velocity
	bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodyVelocity.Parent = bullet

	bullet.Parent = workspace
	
	bullet.Touched:Connect(function(touch)
		if touch.Name == "Head" then
			if touch.Parent:FindFirstChild("Humanoid") then
				touch.Parent.Humanoid.Health = 0
			end
		elseif touch.Parent:FindFirstChild("Humanoid") then
			if touch.Name == "HumanoidRootPart" then
				print("Collision Disabled")
			else
				touch.Parent.Humanoid.Health = touch.Parent.Humanoid.Health - 25
			end
		end
	end)
	
	game.Debris:AddItem(bullet, 2)
end)
