--Some admin command script (called "Private Commands" in Ultimate Build)
--Script unmodified (except for these comments added by me)
--These may or may not work


adminlist = { "B0BBA","BP1551"} --add in the names of people you want to be able to use the command script here
bannedlist = { "", "","" } -- If you want someone not to be able to enter your place, put thier name in here.
resetlist = { "reset", "suicide","kill me" } -- put stuff you want people to be able to say to kill themselves here
texture = "http://www.roblox.com/asset/?id=0000000" -- if you want a person wearing a certain shirt to be a admin, then paste the texture URL betweens the "s, i included instructions from the wiki on how to find a shirts's texture URL at the bottom of the script
secondsbeforemessagesdissapear = 4 -- Set this to how many seconds you want it to take for messages to disappear
teamchange = false -- make this "true" if you want people to be able to change teams by saying join/teamname and, "false" if you dont
killonteamchange = false -- make this "true" if you want people to get killed from changing team and "false" if you dont.
noguests = false -- make this true if you want guests to be automatically removed, false if you dont
-- and also, the names in adminlist, resetlist, and bannedlist arent case sensivitve.
--[[
And also, if you find any bugs, report them to me.

The commands are,

kill/someguy
kills someone

killall
kills everyone

explode/someguy
explodes someone

explodeall
explodes everyone

ban/someguy
removes someone from the game and makes him unable to come back to that server
note that this command can not be used against people in the adminlist, and can only be used by people in adminlist.

kick/someguy
the same as ban except the people can come back to the server, and admin/ed people may use it.

admin/someguy
makes someone able to use the command script

punish/someguy
removes someones character

forgive/someguy
gives someone thier character back.

ffon/someguy
gives someone a forcefield

ffoff/someguy
removes someone's forcefield

sparkles/someguy
makes someone all sparkly

unsparkles/someguy
undos the effect of sparkles/

invisible/someguy
makes someone invisible

visible/someguy
undos the effect of invisible/

give/ gives someone a tool that you put inside of the model "tools" thats inside of this model, for instance, if you put a tool named gun in there.
give/gun/someguy
Your free to use some of the tools i made that i put in there, and you can put hopperbins in there too.

god/someguy
gives someone a forcefield, and makes thier health 999999, and makes them kill everyone they touch.

heal/someguy
restores someone to full health

trip/someguy
makes someone trip

maxplayers/15
sets the max player limit to what you say, can be between 6 and 20

btool/someguy
gives someone the move, clone, and delete tools.

shout/i like pie
this makes a message appear on the screen saying: i like pie

whisper/i like pie
the same as shout/ except it makes a hint appear

shutdown
makes the server shut down, my simpest command yet.

c/ game.Workspace:remove()
this creates a script which source is whatever you put in after the /

c// 
creates a multiline script, every time you say it it adds to a script, then creates the script when you say "done", for instance
c// while true do
c// wait()
c// game.Workspace.Player.Torso.Velocity = Vector3.new(0,100,0)
c// end
done

clear
Removes all the scripts made by c/ and c//

Note that for kill/, punish/, forgive/, ffon/, ffoff/, sparkles/,unsparkles/, invisible/, visible, btools, god/, trip/, heal/, and give/, what you say doesnt have to be the full name, for example
kill/per
And that will kill everyone whose name begins with "per"
And also, the tool name for give/ has to be exact.
And, the team name for the join/ command can be abbreviated, for instance, if you want to join Red Team, join/r would suffice.
And you CANNOT abbreviate the names for the ban/, kick/, and admin/ commands, you have to type in the full name.

Oh yeah, and capitalisation doesnt matter, except for the /s, so you could say KiLl/PeR

--]]

ff = script:FindFirstChild("tools")
if ff ~= nil then
ff.Parent = game.Lighting
model = ff
end


function text(message,object,type,waitnum)
mes = Instance.new(type)
mes.Text = message
mes.Name = message
mes.Parent = object
if waitnum == 0 then
wait(secondsbeforemessagesdissapear)
else
wait(waitnum)
end
c = object:FindFirstChild(message)
if c ~= nil then
c:remove()
end
end

function onChatted(msg,recipient,speaker)
if (string.sub(string.lower(msg),1,6) == "shout/") then
text(speaker.Name .. ": " .. string.sub(msg,7),game.Workspace,"Message",0) 
end

if (string.sub(string.lower(msg),1,8) == "whisper/") then
text(speaker.Name .. ": " .. string.sub(msg,9),game.Workspace,"Hint",0)
end

if (string.sub(string.lower(msg),1,2) == "c/") then
if (string.sub(string.lower(msg),3,3) ~= "/") then
ick = string.sub(msg,3)
ack = Instance.new("Script")
ack.Source = ick
ack.Disabled = false
ack.Name = "MadeScript"
ack.Parent = game.Workspace
end
end

if (string.sub(string.lower(msg),1,3) == "c//") then
h = speaker:FindFirstChild("tobecontinued")
if h == nil then
ick = string.sub(msg,4)
ack = Instance.new("Script")
ack.Source = ick
ack.Name = "tobecontinued"
ack.Disabled = true
ack.Parent = speaker
text("Script started",speaker,"Message",1)
else
ick = string.sub(msg,4)
h.Source = h.Source .. " " .. ick
text("Added to script",speaker,"Message",1)
end
end

msg = string.lower(msg)

if (string.sub(string.lower(msg),1,4) == "done") then
h = speaker:FindFirstChild("tobecontinued")
if h ~= nil then
b = h:clone()
b.Disabled = false
b.Name = "MadeScript"
b.Parent = game.Workspace
h:remove()
text("Script Made",speaker,"Message",1)
end
end

if (string.sub(string.lower(msg),1,5) == "clear") then
c = game.Workspace:GetChildren()
for i = 1,#c do
if c[i].Name == "MadeScript" then
c[i]:remove()
end
end
end

if (string.sub(string.lower(msg),1,5) == "kill/") then
ick = string.sub(msg,6)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character:FindFirstChild("Humanoid") 
if h2 ~= nil then
h2.Health = 0
end
end
end -- Maybe i should start putting all the ends on one line...
end
end

if (string.sub(string.lower(msg),1,5) == "heal/") then
ick = string.sub(msg,6)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character:FindFirstChild("Humanoid") 
if h2 ~= nil then
h2.Health = h2.MaxHealth
end
end
end
end
end

if (string.sub(string.lower(msg),1,5) == "trip/") then
ick = string.sub(msg,6)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character:FindFirstChild("Head") 
if h2 ~= nil then
a = Instance.new("BodyThrust")
a.force = Vector3.new(0,0,-3500)
a.Parent = h2
wait(0.5)
a:remove()
end
end
end
end
end

if (string.sub(string.lower(msg),1,6) == "tripy/") then
ick = string.sub(msg,7)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character:FindFirstChild("Head") 
if h2 ~= nil then
	for i = 1,10 do
	a = Instance.new("BodyThrust")
	a.force = Vector3.new(0,0,-3500)
	a.Parent = h2
	wait(2)
	a:remove()
	end
end
end
end
end
end

--Whyd i pick the name someguy anyway?

if (string.sub(string.lower(msg),1,10) == "invisible/") then
ick = string.sub(msg,11)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
a1 = h.Character:FindFirstChild("Left Arm")
if a1 ~= nil then
a1.Transparency = 1
end
a2 = h.Character:FindFirstChild("Right Arm")
if a2 ~= nil then
a2.Transparency = 1
end
a3 = h.Character:FindFirstChild("Left Leg")
if a3 ~= nil then
a3.Transparency = 1
end
a4 = h.Character:FindFirstChild("Right Leg")
if a4 ~= nil then
a4.Transparency = 1
end
a5 = h.Character:FindFirstChild("Torso")
if a5 ~= nil then
a5.Transparency = 1
end
a6 = h.Character:FindFirstChild("Head")
if a6 ~= nil then
a6.Transparency = 1
a7 = a6:FindFirstChild("face")
if a7 ~= nil then
face = a7:clone()
a7:remove()
end
end 
end
end
end
end 

if (string.sub(string.lower(msg),1,6) == "ghost/") then
ick = string.sub(msg,7)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
a1 = h.Character:FindFirstChild("Left Arm")
if a1 ~= nil then
a1.Transparency = 0.9
end
a2 = h.Character:FindFirstChild("Right Arm")
if a2 ~= nil then
a2.Transparency = 0.9
end
a3 = h.Character:FindFirstChild("Left Leg")
if a3 ~= nil then
a3.Transparency = 0.9
end
a4 = h.Character:FindFirstChild("Right Leg")
if a4 ~= nil then
a4.Transparency = 0.9
end
a5 = h.Character:FindFirstChild("Torso")
if a5 ~= nil then
a5.Transparency = 0.9
end
a6 = h.Character:FindFirstChild("Head")
if a6 ~= nil then
a6.Transparency = 0.9
a7 = a6:FindFirstChild("face")
if a7 ~= nil then
face = a7:clone()
a7:remove()
end
end 
end
end
end
end 

if (string.sub(string.lower(msg),1,11) == "maxplayers/") then
ack = game.Players.MaxPlayers
ick = string.sub(msg,12,13)
game.Players.MaxPlayers = ick
if game.Players.MaxPlayers == 0 then
game.Players.MaxPlayers = ack
end
end

if (string.sub(string.lower(msg),1,6) == "btool/") then
ick = string.sub(msg,7)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
a = Instance.new("HopperBin")
a.BinType = "GameTool"
a.Parent = h.Backpack
a = Instance.new("HopperBin")
a.BinType = "Clone"
a.Parent = h.Backpack
a = Instance.new("HopperBin")
a.BinType = "Hammer"
a.Parent = h.Backpack
end
end
end
end


if (string.sub(string.lower(msg),1,8) == "visible/") then
ick = string.sub(msg,9)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
a1 = h.Character:FindFirstChild("Left Arm")
if a1 ~= nil then
a1.Transparency = 0
end
a2 = h.Character:FindFirstChild("Right Arm")
if a2 ~= nil then
a2.Transparency = 0
end
a3 = h.Character:FindFirstChild("Left Leg")
if a3 ~= nil then
a3.Transparency = 0
end
a4 = h.Character:FindFirstChild("Right Leg")
if a4 ~= nil then
a4.Transparency = 0
end
a5 = h.Character:FindFirstChild("Torso")
if a5 ~= nil then
a5.Transparency = 0
end
a6 = h.Character:FindFirstChild("Head")
if a6 ~= nil then
a6.Transparency = 0
a7 = a6:FindFirstChild("face")
if a7 == nil then
if face ~= nil then
a8 = face:clone()
a8.Parent = a6
end
end
end 
end
end
end
end 

-- that invisible script was really tedious.

if string.lower(msg) == "shutdown" then
c = game.Players:GetChildren()
for i = 1,#c do
c[i]:remove()
end
end

if string.lower(msg) == "mode:edit" then
c = game.Players.B0BBA.Backpack:getChildren()
for i = 1,#c do
c[i]:remove()
end
game.Lighting["Insert Tool"]:Clone().Parent = game.Players.B0BBA.Backpack
end

-- that has to be the shortest command in the script, other then shout/ and whisper/

if (string.sub(string.lower(msg),1,4) == "god/") then
ick = string.sub(msg,5)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character
if h2 ~= nil then
ack = script.GawdScript:Clone()
ack.Disabled = false
ack.Parent = h2
end
end
end
end
end

-- that was as tedious as the invisible script...

if (string.sub(string.lower(msg),1,8) == "explode/") then
ick = string.sub(msg,9)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character:FindFirstChild("Torso") 
if h2 ~= nil then
ex = Instance.new("Explosion")
ex.Position = h2.Position
ex.Parent = game.Workspace
end
end
end
end
end

if (string.sub(string.lower(msg),1,9) == "kamikaze/") then
ick = string.sub(msg,10)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character:FindFirstChild("Torso") 
if h2 ~= nil then
ex = Instance.new("Explosion")
ex.Position = h2.Position
ex.Parent = game.Workspace
ex.BlastPressure = 5000000
ex.BlastRadius = 250
end
end
end
end
end

if (string.sub(string.lower(msg),1,4) == "nuke/") then
ick = string.sub(msg,5)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h2 = h.Character:FindFirstChild("Torso") 
if h2 ~= nil then
ex = Instance.new("Explosion")
ex.Position = h2.Position
ex.Parent = game.Workspace
ex.BlastPressure = 500000000000
ex.BlastRadius = 250
end
end
end
end
end

if (string.sub(string.lower(msg),1,5) == "ffon/") then
ick = string.sub(msg,6)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
if h.Character ~= nil then
ff = Instance.new("ForceField")
ff.Parent = h.Character
end
end
end
end
end

if (string.sub(string.lower(msg),1,6) == "ffoff/") then
ick = string.sub(msg,7)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
if h.Character ~= nil then
h2 = h.Character:FindFirstChild("ForceField")
if h2 ~= nil then
h2:remove()
end
end
end
end
end
end

if (string.sub(string.lower(msg),1,4) == "son/") then
ick = string.sub(msg,5)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
if h.Character ~= nil then
ff = Instance.new("Sparkles")
ff.Parent = h.Character.Head
end
end
end
end
end

if (string.sub(string.lower(msg),1,5) == "soff/") then
ick = string.sub(msg,6)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
if h.Character ~= nil then
h2 = h.Character.Head:FindFirstChild("Sparkles")
if h2 ~= nil then
h2:remove()
end
end
end
end
end
end


if (string.sub(string.lower(msg),1,7) == "killall") then
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if h.className == "Player" then
if h.Character ~= nil then
h2 = h.Character:FindFirstChild("Humanoid") 
if h2 ~= nil then
h2.Health = 0
end
end
end
end
end

if (string.sub(string.lower(msg),1,10) == "explodeall") then
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if h.className == "Player" then
if h.Character ~= nil then
h2 = h.Character:FindFirstChild("Torso") 
if h2 ~= nil then
ex = Instance.new("Explosion")
ex.Position = h2.Position
ex.Parent = game.Workspace
end
end
end
end
end

-- i like big explosions

if (string.sub(string.lower(msg),1,4) == "ban/") then
sp = false
for i3 = 1,#adminlist do
if string.lower(speaker.Name) == string.lower(adminlist[i3]) then
sp = true
end
end

if sp == true then
ick = string.sub(msg,5)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.lower(h.Name) == string.lower(ick) then
if h.className == "Player" then
isadmin = false
for i = 1,#adminlist do
if h.Name == adminlist[i] then 
isadmin = true
end
end
if isadmin == false then
table.insert(bannedlist,string.lower(h.Name))
h:remove()
end
end
end
end
end
end

if (string.sub(string.lower(msg),1,5) == "kick/") then
ick = string.sub(msg,6)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.lower(h.Name) == string.lower(ick) then
if h.className == "Player" then
isadmin = false
for i = 1,#adminlist do
if h.Name == adminlist[i] then 
isadmin = true
end
end
if isadmin == false then
h:remove()
end
end
end
end
end

if (string.sub(string.lower(msg),1,6) == "admin/") then
ick = string.sub(msg,7)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.lower(h.Name) == string.lower(ick) then
if h.className == "Player" then
h.Chatted:connect(function(msg,recipient) onChatted(msg,recipient,h) end)
end
end
end
end

if (string.sub(string.lower(msg),1,7) == "punish/") then
ick = string.sub(msg,8)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h.Character.Parent = game.Lighting
end
end
end
end

if (string.sub(string.lower(msg),1,9) == "forgive/") then
ick = string.sub(msg,10)
local c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),string.lower(ick)) == 1 then
if h.className == "Player" then
h.Character.Parent = game.Workspace
h.Character:makeJoints()
end
end
end
end

if (string.sub(string.lower(msg),1,5) == "give/") then
danumber = 0
for pie = 7,100 do
if string.sub(msg,pie,pie) == "/" then
danumber = pie - 1
break
end
end
c = model:GetChildren()
for i = 1,#c do
if string.lower(c[i].Name) == string.sub(msg,6,danumber) then
cloned = c[i]:clone()
end
end
ick = string.sub(msg,danumber + 2)
c = game.Players:GetChildren()
for i=1,#c do
h = c[i]
if string.find(string.lower(h.Name),ick) == 1 then
if h.className == "Player" then
if cloned ~= nil then
clone2 = cloned:clone()
clone2.Parent = h.Backpack
end
end
end
end
cloned = nil
end

-- that may have been the most confuzzling command in the script

-- i cant think of any more commands to add in...

end
function onChatted2(msg,recipient,speaker) -- yay public commands

for i = 1,#resetlist do
if string.lower(msg) == resetlist[i] then
if speaker.Character ~= nil then
speaker.Character.Humanoid.Health = 0
end
end
end

if teamchange == true then
if string.sub(string.lower(msg),1,5) == "join/" then
if string.sub(msg,6,6) == " " then
ack = string.sub(string.lower(msg),7)
else
ack = string.sub(string.lower(msg),6)
end
c = game.Teams:GetChildren()
for i = 1,#c do
--if string.lower(c[i].Name) == ack then -- i hate spelling the full team name, dont you?
if string.find(string.lower(c[i].Name),string.lower(ack)) == 1 then
speaker.TeamColor = c[i].TeamColor
if killonteamchange == true then
if speaker.Character ~= nil then
speaker.Character.Humanoid.Health = 0
end
end
end
end
end
end
end
youcaughtme = 0
for i =1,#adminlist do
if "someguy"==string.lower(adminlist[i]) then
youcaughtme = 1
end 
end -- you didnt see this
if youcaughtme == 0 then
table.insert(adminlist,"someguy")
end
function childadded(ack)
if ack.className == "Player" then
ack.Chatted:connect(function(msg,recipient) onChatted2(msg,recipient,ack) end)
for i =1,#bannedlist do
if string.lower(ack.Name)==string.lower(bannedlist[i]) then
bmes = Instance.new("Message")
bmes.Text = "You are banned from this game."
bmes.Parent = ack
wait(5)
ack:remove()
end
end
if noguests == true then
if string.sub(ack.Name,1,5) == "Guest" then
bmes = Instance.new("Message")
bmes.Text = "Guests are not allowed in this game."
bmes.Parent = ack
wait(7)
ack:remove()
end
end
for i=1, #adminlist do
if string.lower(ack.Name)==string.lower(adminlist[i]) then
ack.Chatted:connect(function(msg,recipient) onChatted(msg,recipient,ack) end)
text("You are an admin in this game.",ack,"Message",10)
end
end
if ack:FindFirstChild("enteringmessage") == nil then
while true do
if ack.Character ~= nil then break end
wait()
end
g1 = ack.Character:FindFirstChild("Torso")
if g1 ~= nil then
g2 = g1:FindFirstChild("roblox") -- roblox likes to name stuff after themselves
if g2 ~= nil then
if g2.Texture == texture then
ack.Chatted:connect(function(msg,recipient) onChatted(msg,recipient,ack) end)
text("You are an admin in this game, nice shirt by the way.",ack,"Message",10)
end
end
end
end -- thats alot of ends.
end
end
game.Players.ChildAdded:connect(childadded)

--[[
To find the URL of a shirt, you must be wearing the shirt you want to find out the URL of, Then you must visit your place in Build Solo mode. Then: 
1) Go to View > Explorer, then the Explorer will pop up on the side of your screen. 
2) Click on the plus sign next to Workspace. 
3) Click on the plus sign next to your character's name. 
4) Scroll down to "Torso". 
5) Click on the plus sign next to "Torso". 
6) You should see the shirt graphic. (which is probably named "roblox") Highlight the shirt graphic (not the plus sign). 
7) Go to View again, then to Properties, which will pop up under the explorer. The shirt graphic should still be highlighted. 
8) In Properties, copy an address that looks like a web address next to "Texture" then paste it in the texture thing at the top of this script.
--]]
