rightPosition = {x = 1450, y = 100}
leftPosition = {x = 0, y = 100}
menuPosition = {x = 0, y = 200}

if Config.MenuPosition then
  if Config.MenuPosition == "left" then
    menuPosition = leftPosition
  elseif Config.MenuPosition == "right" then
    menuPosition = rightPosition
  end
end

if Config.CustomMenuEnabled then
  local RuntimeTXD = CreateRuntimeTxd('Custom_Menu_Head')
  local Object = CreateDui(Config.MenuImage, 512, 128)
  _G.Object = Object
  local TextureThing = GetDuiHandle(Object)
  local Texture = CreateRuntimeTextureFromDuiHandle(RuntimeTXD, 'Custom_Menu_Head', TextureThing)
  Menuthing = "Custom_Menu_Head"
else
  Menuthing = "shopui_title_sm_hangar"
end

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Kifejezések", "", menuPosition["x"], menuPosition["y"], Menuthing, Menuthing)
_menuPool:Add(mainMenu)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local EmoteTable = {}
local FavEmoteTable = {}
local DanceTable = {}
local PropETable = {}
local WalkTable = {}
local FaceTable = {}
local FavoriteEmote = ""

Citizen.CreateThread(function()
  while true do
    if Config.FavKeybindEnabled then
      if IsControlPressed(0, Config.FavKeybind) then
        if not IsPedSittingInAnyVehicle(PlayerPedId()) then
          if FavoriteEmote ~= "" then
            EmoteCommandStart(nil,{FavoriteEmote, 0})
            Wait(3000)
          end
        end
      end
    end
    Citizen.Wait(1)
  end
end)

function AddEmoteMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Kifejezések", "", "", Menuthing, Menuthing)
    local dancemenu = _menuPool:AddSubMenu(submenu, "🕺 Táncok", "", "", Menuthing, Menuthing)
    local propmenu = _menuPool:AddSubMenu(submenu, "📦 Tárgyas Kifejezések", "", "", Menuthing, Menuthing)
    local favmenu = _menuPool:AddSubMenu(submenu, "🌟 Bindelés", "Válassz ki egy kifejezést, amit gombnyomásra aktiválsz.", "", Menuthing, Menuthing)
    unbind2item = NativeUI.CreateItem("Bind törlése ", "Bind törlése")
    unbinditem = NativeUI.CreateItem("❓ Tárgyas Kifejezések a végén vannak!", "Bind törlése")
    favmenu:AddItem(unbinditem)
    favmenu:AddItem(unbind2item)
    table.insert(FavEmoteTable, "Bind törlése")
    table.insert(FavEmoteTable, "Bind törlése")
    table.insert(EmoteTable, "🕺 Táncok")
    table.insert(EmoteTable, "🌟 Bindelés")
    table.insert(EmoteTable, "🕺 Táncok")

    for a,b in pairsByKeys(DP.Emotes) do
      x,y,z = table.unpack(b)
      emoteitem = NativeUI.CreateItem(z, "/e ("..a..")")
      favemoteitem = NativeUI.CreateItem(z, "("..z..") beállítása?")
      submenu:AddItem(emoteitem)
      favmenu:AddItem(favemoteitem)
      table.insert(EmoteTable, a)
      table.insert(FavEmoteTable, a)
    end

    for a,b in pairsByKeys(DP.Dances) do
      x,y,z = table.unpack(b)
      danceitem = NativeUI.CreateItem(z, "/e ("..a..")")
      dancemenu:AddItem(danceitem)
      table.insert(DanceTable, a)
    end

    for a,b in pairsByKeys(DP.PropEmotes) do
      x,y,z = table.unpack(b)
      propitem = NativeUI.CreateItem(z, "/e ("..a..")")
      propfavitem = NativeUI.CreateItem(z, "("..z..") beállítása?")
      propmenu:AddItem(propitem)
      favmenu:AddItem(propfavitem)
      table.insert(PropETable, a)
      table.insert(FavEmoteTable, a)
    end

    favmenu.OnItemSelect = function(sender, item, index)
      if FavEmoteTable[index] == "Bind törlése" then
        FavoriteEmote = ""
        ShowNotification("Bind törölve :)", 2000)
      return end 

      if Config.FavKeybindEnabled then
        FavoriteEmote = FavEmoteTable[index]
        ShowNotification("~o~"..firstToUpper(FavoriteEmote).."~w~ kifejezés mentve, használd a ~g~CapsLock~w~ gombot, a használathoz.")
      end
    end

    dancemenu.OnItemSelect = function(sender, item, index)
      EmoteMenuStart(DanceTable[index], "dances")
    end

    propmenu.OnItemSelect = function(sender, item, index)
      EmoteMenuStart(PropETable[index], "props")
    end

    submenu.OnItemSelect = function(sender, item, index)
     if EmoteTable[index] ~= "🌟 Bindelés" then
      EmoteMenuStart(EmoteTable[index], "emotes")
    end
  end
end

function AddCancelEmote(menu)
    local newitem = NativeUI.CreateItem("Kifejezés megállítása ", "~r~X~w~ gomb megállítja a folyamatban lévő kifejezést.")
    menu:AddItem(newitem)
    menu.OnItemSelect = function(sender, item, checked_)
        if item == newitem then
          EmoteCancel()
          DestroyAllProps()
        end
    end
end

function AddWalkMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Séta típusok", "", "", Menuthing, Menuthing)

    walkreset = NativeUI.CreateItem("Normál (Megállítás)", "Megállítás")
    submenu:AddItem(walkreset)
    table.insert(WalkTable, "Megállítás")

    WalkInjured = NativeUI.CreateItem("Serült", "")
    submenu:AddItem(WalkInjured)
    table.insert(WalkTable, "move_m@injured")

    for a,b in pairsByKeys(DP.Walks) do
      x = table.unpack(b)
      walkitem = NativeUI.CreateItem(a, "")
      submenu:AddItem(walkitem)
      table.insert(WalkTable, x)
    end

    submenu.OnItemSelect = function(sender, item, index)
      if item ~= walkreset then
        WalkMenuStart(WalkTable[index])
      else
        ResetPedMovementClipset(PlayerPedId())
      end
    end
end

function AddFaceMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Hangulatok", "", "", Menuthing, Menuthing)

    facereset = NativeUI.CreateItem("Normál (Megállítás)", "Megállítás")
    submenu:AddItem(facereset)
    table.insert(FaceTable, "")

    for a,b in pairsByKeys(DP.Expressions) do
      x,y,z = table.unpack(b)
      faceitem = NativeUI.CreateItem(a, "")
      submenu:AddItem(faceitem)
      table.insert(FaceTable, a)
    end

    submenu.OnItemSelect = function(sender, item, index)
      if item ~= facereset then
        EmoteMenuStart(FaceTable[index], "expression")
      else
        ClearFacialIdleAnimOverride(PlayerPedId())
      end
    end
end

function AddInfoMenu(menu)
end

function OpenEmoteMenu()
    mainMenu:Visible(not mainMenu:Visible())
end


function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

AddEmoteMenu(mainMenu)
AddCancelEmote(mainMenu)
if Config.WalkingStylesEnabled then
  AddWalkMenu(mainMenu)
end
if Config.ExpressionsEnabled then
  AddFaceMenu(mainMenu)
end
AddInfoMenu(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    end
end)

