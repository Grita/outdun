function SD_OUTDUN_ON_INIT(addon, frame)
  if SD_OUTDUN_IS_IN_DUN() then
    frame:ShowFrame(1);
  end
end

function SD_OUTDUN_ON_CLICK()
  ui.MsgBox('Are you sure?', 'SD_OUTDUN_EXEC()', 'None');
end

-- Honest and Hardworking
function SD_OUTDUN_IS_IN_DUN()
  if world.GetLayer() ~= 0 then
    return false;
  end
  
  local zone_cls = GetClass('Map', GetZoneName(GetMyPCObject()));
  
  if zone_cls == nil then
    return false;
  end
  
  local linked_zones = TryGetProp(zone_cls, 'PhysicalLinkZone');
  
  if linked_zones == nil or linked_zones == 'None' then
    return true;
  end
  
  return false;
end

function SD_OUTDUN_EXEC()
  control.RequesDungeonLeave();
end
