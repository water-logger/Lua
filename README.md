# Lua Scripts

This repository is about the scripts **I** have made.
 Please do not claim these scripts as yours.
 The scripts here are designed to be used with [Roblox exploits](https://roblox.fandom.com/wiki/Exploit), otherwise known as "hacks".
 <br />
  <br />
 I learned how to exploit around 2 years ago. It was fun thinking that everyone could see what I was doing to the server. Later, I discovered that the stuff I was doing was client side ( Only **you** can see ) and became a little sad. I then decided to learn how to script so I could make things that everyone could see. Long story short, I couldn't. These are client side.
 <br />
 <br />
Example Script ( Works on any exploit ):
<br />
```
local plr = game.Players.LocalPlayer --You
local char = plr.Character --Your avatar

local function changeSpeed(speed)
  local humanoid = char:FindFirstChild("Humanoid") --What makes you live
  
  humanoid.WalkSpeed = speed --Changes your walk speed to desired speed
end

changeSpeed(100) --Changes your walk speed to 100
```
### Notes
- Most scripts here are "r6"
- Before I made this repository, these scripts were private.
- These scripts were made directly in [Roblox Studio](https://create.roblox.com/).
