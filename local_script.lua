-- link: https://www.roblox.com/library/1595193683/Particulas-de-Bola-de-fuego

-- localscript, este va si o si... si no tienes problemas en usar el interfaz de roblox studio estas listo, ya tienes el primer poder, lo que es la bola de fuego, descarga 

-- también la librería que esta arriba

local Tool = script.Parent
play = game.Players.LocalPlayer
local mouse = play:GetMouse()
char = play.Character
hum = char.Humanoid 
root = char.HumanoidRootPart

local en = true
Tool.Activated:connect(function()
if not en then return end
en = false
Tool.RemoteEvent:FireServer(mouse.Hit)
wait(0.5)
en = true
end)