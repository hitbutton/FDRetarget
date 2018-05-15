FDRetarget = CreateFrame("frame")
local hunterTarget
function FDRetarget:OnEvent()
  if event == "PLAYER_TARGET_CHANGED" then
    if UnitExists("target") then
      hunterTarget = nil
      if UnitIsPlayer("target") and UnitCanAttack("player","target") then
        local _,class = UnitClass("target")
        if class == "HUNTER" then
          hunterTarget = true
        end
      end
    elseif hunterTarget then
      TargetLastTarget()
    end
  elseif event == "PLAYER_ENTERING_WORLD" then
    local _,instanceType = IsInInstance()
    if instanceType == "pvp" or instanceType == "none" then
      FDRetarget:RegisterEvent("PLAYER_TARGET_CHANGED")
    else
      FDRetarget:UnregisterEvent("PLAYER_TARGET_CHANGED")
    end
  end
end
FDRetarget:SetScript("OnEvent",FDRetarget.OnEvent)
FDRetarget:RegisterEvent("PLAYER_ENTERING_WORLD")