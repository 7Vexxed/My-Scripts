--This script is bad lol
print("Successfully Loaded")

getgenv().autoClick = false;
getgenv().autoRebirth = false;

function AutoC()
    spawn(function()
            while getgenv().autoClick == true do
                game:GetService("ReplicatedStorage").Remotes.Game.AirSlice:FireServer()
            wait()
        end
    end)
end

function AutoR()
    spawn(function()
            while getgenv().autoRebirth == true do
                local args = {[1] = 1, [2] = 1}
                game:GetService("ReplicatedStorage").Remotes.Other.Rebirth:FireServer(unpack(args))
            wait()
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Slashing Simulator")

local b = w:CreateFolder("Main")

local e = w:CreateFolder("Other")

b:Toggle("Auto Slash",function(bool)
    getgenv().autoClick = bool
    print('Auto Slash is: ', bool);
    if bool then
        AutoC();
    end
end)

b:Toggle("Auto Rebirth",function(bool)
    getgenv().autoRebirth = bool
    print('Auto Rebirth is: ', bool);
    if bool then
        AutoR();
    end
end)

b:Button("Rebirth",function()
    local args = {[1] = 3, [2] = 2}
    game:GetService("ReplicatedStorage").Remotes.Other.Rebirth:FireServer(unpack(args))
end)

e:DestroyGui()
