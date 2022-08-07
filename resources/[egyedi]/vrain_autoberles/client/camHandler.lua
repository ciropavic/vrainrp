local _previewCam = nil
tempVeh = nil
local tempModel = nil


function RemoveCam()
    RenderScriptCams(0, 0, 500, 0, 0)
    SetCamActive(_previewCam, false)
    DestroyCam(_previewCam, false)
    TriggerEvent("InitCamModulePause", false)

    DeleteEntity(tempVeh)
    tempVeh = nil
    tempModel = nil
end


function CreatePreviewCam()
    TriggerEvent("InitCamModulePause", true)
    _previewCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    SetCamActive(_previewCam, 1)
    SetCamCoord(_previewCam, GetEntityCoords(GetPlayerPed(-1)))
    SetCamFov(_previewCam, 80.0)
    RenderScriptCams(1, 1, 1000, 0, 0)
end


function UpdateCam(model, coords, heading)
    if model == tempModel then
        return
    else
        if tempVeh ~= nil then
            DeleteEntity(tempVeh)
            tempVeh = nil
        end

        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
        
        tempModel = model
        tempVeh = CreateVehicle(GetHashKey(model), coords, heading, 0, 0)
        FreezeEntityPosition(tempVeh, true)
        SetEntityAlpha(tempVeh, 240, 240)

        local camCoords = GetOffsetFromEntityInWorldCoords(tempVeh, 3.0, 2.0, 2.0)
        SetCamCoord(_previewCam, camCoords)
        PointCamAtEntity(_previewCam, tempVeh, 0, 0, 0, 0)
    end
end