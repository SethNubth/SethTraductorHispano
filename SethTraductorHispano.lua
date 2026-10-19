-- SethTraductorHispano 1.5.1-Fixed Forever
-- Hecho por SethNubth

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")

-- Hacer que se puedan copiar links de todos los chats
local function AddCopyChat()
  for i=1,7 do
    local frame = _G["ChatFrame"..i]
    if frame then
      frame:EnableMouseWheel(true)
    end
  end
end

f:SetScript("OnEvent", function(self, event, addon)
  if addon == "SethTraductorHispano" then
    if not SethTraductorDB then SethTraductorDB = {} end
    print("|cFF00FF00[SethTraductorHispano]|r v1.5.1-Fixed Forever cargado - /seth")
    AddCopyChat()
  end
end)

SLASH_SETHTRADUCTOR1 = "/seth"
SlashCmdList["SETHTRADUCTOR"] = function()
  print("|cFF00FF00SethTraductorHispano|r - Traductor + Copiar links activo para Forever")
end
