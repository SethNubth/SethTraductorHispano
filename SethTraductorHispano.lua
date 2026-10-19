-- SethTraductorHispano 1.6-Loro Edition - Hecho por SethNubth
local ADDON_NAME = "SethTraductorHispano"
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, arg1)
  if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
    if not SethTraductorDB then SethTraductorDB = {} end
    return
  end
  if event == "PLAYER_LOGIN" then
    print("|cFF00FF00[SethTraductorHispano]|r v1.6 Loro Edition cargado! |cFFFFFF00Shift+Click en link para copiar|r - /seth")
    for i=1,10 do
      local cf = _G["ChatFrame"..i]
      if cf then
        local orig = cf:GetScript("OnHyperlinkShow")
        cf:SetScript("OnHyperlinkShow", function(self, link, text, button)
          if IsShiftKeyDown() then
            local eb = ChatFrame1EditBox or DEFAULT_CHAT_FRAME.editBox
            if eb then eb:Show() eb:SetText(link) eb:HighlightText() eb:SetFocus() print("|cFF00FF00[Seth]|r Link copiado: "..link) end
            return
          end
          if orig then return orig(self, link, text, button) end
        end)
      end
    end
    local loroFrame = CreateFrame("Frame", "SethLoroFrame", UIParent)
    loroFrame:SetSize(420, 420)
    loroFrame:SetPoint("CENTER", 0, 80)
    loroFrame:SetFrameStrata("DIALOG")
    loroFrame:EnableMouse(true)
    loroFrame:SetMovable(true)
    loroFrame:RegisterForDrag("LeftButton")
    loroFrame:SetScript("OnDragStart", function(s) s:StartMoving() end)
    loroFrame:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)
    local bg = loroFrame:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetTexture(0,0,0,0.5)
    local tex = loroFrame:CreateTexture(nil, "ARTWORK")
    tex:SetPoint("TOP", 0, 0)
    tex:SetSize(350, 350)
    tex:SetTexture("Interface\\AddOns\\SethTraductorHispano\\Loro.tga")
    local txt = loroFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    txt:SetPoint("BOTTOM", 0, 40)
    txt:SetText("|cFF00FF00SethTraductorHispano|r v1.6\n|cFFFFFF00Loro Edition - Traductor Activo|r")
    local txt2 = loroFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    txt2:SetPoint("BOTTOM", 0, 20)
    txt2:SetText("|cFFAAAAAAClick para cerrar - Se cierra solo en 6s|r")
    local elapsed = 0
    loroFrame:SetScript("OnUpdate", function(self, e) elapsed = elapsed + e if elapsed > 6 then self:Hide() end end)
    loroFrame:SetScript("OnMouseDown", function(self) self:Hide() end)
    _G.SethLoroFrame = loroFrame
  end
end)

SLASH_SETHTRADUCTOR1 = "/seth"
SLASH_SETHTRADUCTOR2 = "/loro"
SlashCmdList["SETHTRADUCTOR"] = function(msg)
  msg = string.lower(msg or "")
  if msg == "show" or msg == "" then if _G.SethLoroFrame then _G.SethLoroFrame:Show() end
  elseif msg == "hide" then if _G.SethLoroFrame then _G.SethLoroFrame:Hide() end end
end
