function DrawSprite3D(dict, sprite, x, y, z, s, a)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)
    if s == nil then
        s = 1.0
    end
    if a == nil then
        s = 255
    end
    local scale = ((1 / (dist * 4)) * 2) * s
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetDrawOrigin(x, y, z, 0)
        DrawSprite(dict, sprite, 0.0, 0.0, scale, scale * GetAspectRatio(0), 0.0, 255, 255, 255, a)
        ClearDrawOrigin()
    end
end

Citizen.CreateThread(function()
    while (true) do 
        while (not HasStreamedTextureDictLoaded('srvlogodict')) do 
            RequestStreamedTextureDict('srvlogodict', true);
            Wait(250);
        end 

        DrawSprite(
            'srvlogodict', 'logo-wide', 0.5, 0.03, 
            0.1, 0.09, 0.0, 255, 255, 255, 80
        );

        -- DrawSprite3D("srvlogodict", "logo-wide", 0.0, 0.0, 75.0, 2.0, 255);

        Wait(0);
    end
end);

