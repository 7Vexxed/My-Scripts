print("Successfully Loaded")

getgenv().autoClick = false;
getgenv().autoRebirth = false;

function AutoC()
    spawn(function()
            while getgenv().autoClick == true do
                local args = {    [1] = false,    [2] = "Clicker!"}
                game:GetService("ReplicatedStorage").Remotes.ClickRemote:FireServer(unpack(args))
            wait()
        end
    end)
end

function AutoR()
    spawn(function() 
        while getgenv().autoRebirth == true do
                local args = {[1] = 1}
                game:GetService("ReplicatedStorage").Remotes.RebirthRemote:FireServer(unpack(args))
            wait()
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Anime Clickers")

local b = w:CreateFolder("Main")

local c = w:CreateFolder("Pets")

local d = w:CreateFolder("Teleport")

local e = w:CreateFolder("Other")

b:Toggle("Autoclicker",function(bool)
    getgenv().autoClick = bool
    print('Auto Click is: ', bool);
    if bool then
        AutoC();
    end
end)

b:Toggle("Auto Rebirth",function(bool)
    getgenv().autoRebirth = bool
    print('Auto Rebirth is: ', bool);
    if bool then
        AutoR(1000);
    end
end)

local selectedWorld;

d:Dropdown("Dropdown",{"Anime Village", "Pirate Docks","Purple Forest","Shinobi Village", 
    "Spirit Society", "Walled City", "Narmek", "Hero Academy", "Stand City", 
    "Hunter Kingdom", "Jiu Jitsu Sewers", "The Sin Zone", "World of Fate", "AC City",
    "Town of Dawn", "Clover Kingdom", "Ghoul City", },true,function(value)
    selectedWorld = value;
    print(value)
end)

d:Button("Teleport Selected",function()
    if selectedWorld then
    local args = {[1] = "world", [2] = selectedWorld}
    game:GetService("ReplicatedStorage").Remotes.RequestTeleport:InvokeServer(unpack(args))
    end
end)

local selectedEgg;

c:Dropdown("Dropdown",{"Dragon Star","Demon Star","Pirate Star", "Slayer Star", "Spirit Star", 
    "Walled Star", "Narmekian Star", "Quirky Star", "Crazy Star", "Hunter Star", "Fighting Star",
    "Sinful Star", "Fate Star", "Punch Star", "Dawn Star", "Pearl Star",},true,function(value)
    selectedEgg = value;
    print(value)
end)

c:Button("Buy Selected",function()
    if selectedEgg then
        local args = {[1] = selectedEgg, [2] = false, [3] = false}
        game:GetService("ReplicatedStorage").Remotes.OpenEgg:InvokeServer(unpack(args))
    end
end)

e:Button("Daily Rewards",function()
    local args = {[1] = "DailyRewards"}
    game:GetService("ReplicatedStorage").Remotes.CollectChest:InvokeServer(unpack(args))
end)

e:Button("Group Rewards",function()
    local args = {[1] = "GroupRewards"}
    game:GetService("ReplicatedStorage").Remotes.CollectChest:InvokeServer(unpack(args))
end)

e:DestroyGui()
