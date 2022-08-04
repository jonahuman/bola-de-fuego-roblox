--script en lua para poder lanzar bola de fuego en roblox, el script se debe copiar y pegar en roblox studio, si tienes experiencia con la app sabrás dónde irá el codigo

local Tool = script.Parent
play = Tool.Parent.Parent 
char = play.Character
hum = char.Humanoid 
root = char.HumanoidRootPart

local en = true


Tool.RemoteEvent.OnServerEvent:connect(function(play,mousehit)
local a = hum:LoadAnimation(Tool.Throw)
a:Play()
root.CFrame = CFrame.new(root.Position,root.Position + Vector3.new(mousehit.lookVector.x,0,mousehit.lookVector.z))
wait(0.6)
local fireball = Tool.Handle:clone()
fireball.CFrame = Tool.Handle.CFrame
local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(1e8,1e8,1e8)
 bv.Velocity = mousehit.lookVector * 50
bv.Parent = fireball
fireball.CanCollide = false
fireball.Parent = game.Workspace
game.Debris:AddItem(fireball,4)
local ten = true
fireball.Touched:connect(function(hit)
if not ten then return end
ten = false
local ehum = hit.Parent:findFirstChild("Humanoid") or hit.Parent.Parent:findFirstChild("Humanoid")
if ehum and ehum ~= hum then
ehum:TakeDamage(10)
elseif hit.Anchored  == true and hit.CanCollide == true then
for i=1,10 do
local part = fireball:clone()
part.Size = Vector3.new(0.5,0.5,0.5)
part.CFrame = fireball.CFrame
part.BodyVelcoity.MaxForce = Vector3.new(1e8,0,1e8)
part.ParticleEmitter.LockedToPart = false
part.BodyVelocity.Velocity = Vector3.new(math.random(-30,30),math.random(-30,30),math.random(-30,30))
part.Parent = game.Workspace
game.Debris:AddItem(part,1)
end
end
wait()
ten = true
end)
end)