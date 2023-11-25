--Jetboots script mod by ,,guy with nose
--Meant to go into the original Jetboots script

print("Jet Boots loaded")

bin = script.Parent

walking = false
reloadtime = 0

local thrust = Instance.new("BodyVelocity")
local velocity = 0
local max_velocity = 30
local flight_time = 999999999



function onStart()
	print("start walking")
	walking = true
	reloadtime = 0
	
	thrust.Parent = game.Players.LocalPlayer.Character.PrimaryPart
	
	thrust.velocity = Vector3.new(0,velocity,0)
	thrust.maxForce = Vector3.new(0,8e+003,0) 
	
	local sound = game.Players.LocalPlayer.Character.PrimaryPart:findFirstChild("JetbootSound")
	if sound == nil then 
		sound = Instance.new("Sound")
		sound.Name = "JetbootSound"
		sound.SoundId = "rbxasset://sounds\\Rocket whoosh 01.wav"
		sound.Looped = true
		sound.Parent = game.Players.LocalPlayer.Character.PrimaryPart
	end
	sound:play()

end

function onEnd()
	print("stop walking")
	walking = false
	thrust.Parent = nil
	local sound = game.Players.LocalPlayer.Character.PrimaryPart:findFirstChild("JetbootSound")
	if sound ~= nil then sound:stop() end
	wait(reloadtime)
	reloadtime = 0
end

function onButton1Down(mouse)
	if reloadtime > 0 then return end
	if walking == true then return end
	
	onStart()
	mouse.Icon = "rbxasset://textures\\ArrowFarCursor.png"

	local time = 0
	while walking == true do
		--onWalk()
		wait(.2)
		time = time + .2
		--velocity = (max_velocity  * (time / flight_time)) + 3 
		velocity = velocity + 5
		thrust.velocity = Vector3.new(0,velocity,0)

		if time > flight_time then onButton1Up(mouse) end
	end
end

function onButton1Up(mouse)
	onEnd()
	mouse.Icon = "rbxasset://textures\\ArrowCursor.png"
end

function onSelected(mouse)
	print("ghostwalker selected")
	if reloadtime > 0 then
		mouse.Icon = "rbxasset://textures\\ArrowFarCursor.png"
	else
		mouse.Icon = "rbxasset://textures\\ArrowCursor.png"
	end
	mouse.Button1Down:connect(function() onButton1Down(mouse) end)
	mouse.Button1Up:connect(function() onButton1Up(mouse) end)
end

bin.Selected:connect(onSelected)




