candraw=true
Keys = {["E"] = 38}

function creatblip()
  CreateThread(function()
	  Wait(1)
    RemoveBlip(blip)
    RemoveBlip(radiusBlip)
    blip = AddBlipForCoord(config.blip.coords.x, config.blip.coords.y, config.blip.coords.z)
    radiusBlip = AddBlipForRadius(config.blip.coords.x, config.blip.coords.y, config.blip.coords.z,config.blip.radiusBlip)
    SetBlipSprite(blip, 0)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, config.blip.blipCol)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(config.blip.blipName)
    EndTextCommandSetBlipName(blip)
    SetBlipAlpha(radiusBlip, 100)
    SetBlipColour(radiusBlip, config.blip.blipCol)

  end)
end
function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end
function creatmarker()
  CreateThread(function ()
    while candraw==true do
      Wait(0)
      local pedCoords = GetEntityCoords(PlayerPedId())
      local distance    = Vdist(pedCoords.x, pedCoords.y, pedCoords.z, config.marker.coords.x, config.marker.coords.y, config.marker.coords.z)
      marker=DrawMarker(config.marker.type, config.marker.coords.x, config.marker.coords.y, config.marker.coords.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 67, 57, 111, 255, false, true, 2, nil, nil, false)
      if ( distance <= 1 ) then
        alert("~b~Press ~INPUT_PICKUP~ For Start")
        if IsControlJustReleased(0, Keys['E']) then
          candraw=false
          GiveWeaponToPed(PlayerPedId() ,"weapon_pistol",20, true , true)
          while true do
            Wait(0)
                      inpvpmarker=DrawMarker(28, config.marker.coords.x, config.marker.coords.y, config.marker.coords.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 10.0, 10.0, 10.0, 255, 0, 0, 50, false, true, 2, nil, nil, false)

          end





        creatblip()
        end
      end
    end

  end)
	
end

RegisterCommand("ccap",function (source,args)  capname=args[1] end , false)


CreateThread(function ()
  -- while true do
  --   Wait(0)
    if capname then
      loc1=nil
      loc2=nil
      loc3=nil
    RegisterCommand("capdata",function (source,args)  

        if args[1]=="loc1" and loc1 == nil then
        local pedCoords = GetEntityCoords(PlayerPedId())
        loc1=pedCoords
        print(loc1)
        elseif args[1]=="loc2" and loc2==nil then
          local pedCoords = GetEntityCoords(PlayerPedId())
          loc2=pedCoords
          print(loc2)

        elseif args[1]=="loc3" and loc3==nil then
          local pedCoords = GetEntityCoords(PlayerPedId())
          loc3=pedCoords
          print(loc3)
        elseif args[1]=="time" then
          if args[2]==nil then
            print("Enter a Time")
          elseif args[2]<0 then 
            print("Enter a number")
          elseif args[2] >0 then
            captime=args[1]
            print(captime)
          else 
            print("enter valid number")
          end

        end

    end , false)
  
  end
  -- end
end)

