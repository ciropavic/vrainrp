function loadtexture(texture)
    if not HasStreamedTextureDictLoaded(texture) then
            RequestStreamedTextureDict(texture, true)
            while not HasStreamedTextureDictLoaded(texture) do
                Citizen.Wait(1)
            end
        end
    end

    loadtexture("mp_gamer_info")