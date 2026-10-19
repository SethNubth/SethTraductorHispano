-- SethTraductorHispano v1.6-Loro Edition
-- Para WoW Forever Oficial (16001) - SethNubth

local ADDON_NAME = "SethTraductorHispano"
local VERSION_ACTUAL = "1.6"
local VERSION_GITHUB = "1.7" -- Cambia esto cuando saques nueva
local LINK_GITHUB = "https://github.com/SethNubth/SethTraductorHispano"

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, arg1)
  if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
    if not SethTraductorDB then SethTraductorDB = {} end
    if not SethTraductorDB.lastCheck then SethTraductorDB.lastCheck = time() end
    return
  end
  if event == "PLAYER_LOGIN" then
    print("|cFF00FF00[SethTraductorHispano]|r v"..VERSION_ACTUAL.." Loro Edition cargado! Shift+Click para copiar - /seth")
    
    if VERSION_ACTUAL ~= VERSION_GITHUB then
      print("|cFFFF0000[Seth]|r ¡NUEVA VERSIÓN v"..VERSION_GITHUB.."! -> "..LINK_GITHUB)
      StaticPopupDialogs["SETH_UPDATE"] = {
        text = "SethTraductorHispano\nTienes v"..VERSION_ACTUAL.."\n¡Hay v"..VERSION_GITHUB.." disponible!\n\nCopiar link?",
        button1 = "Copiar Link", button2 = "Luego",
        OnAccept = function()
          ChatFrame1EditBox:Show()
          ChatFrame1EditBox:SetText(LINK_GITHUB)
          ChatFrame1EditBox:HighlightText()
        end,
        timeout = 0, whileDead = true, hideOnEscape = true,
      }
      C_Timer.After(4, function() StaticPopup_Show("SETH_UPDATE") end)
    end

    for i=1,15 do
      local cf = _G["ChatFrame"..i]
      if cf then
        local orig = cf:GetScript("OnHyperlinkShow")
        cf:SetScript("OnHyperlinkShow", function(self, link, text, button)
          if IsShiftKeyDown() then
            ChatFrame1EditBox:Show()
            ChatFrame1EditBox:SetText(link)
            ChatFrame1EditBox:HighlightText()
            ChatFrame1EditBox:SetFocus()
            print("|cFF00FF00[Seth]|r Link copiado: "..link)
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
    bg:SetColorTexture(0,0,0,0.5)
    local tex = loroFrame:CreateTexture(nil, "ARTWORK")
    tex:SetPoint("TOP", 0, 0)
    tex:SetSize(350, 350)
    tex:SetTexture("Interface\\AddOns\\SethTraductorHispano\\Loro.tga")
    local txt = loroFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    txt:SetPoint("BOTTOM", 0, 20)
    txt:SetText("|cFF00FF00SethTraductorHispano|r v"..VERSION_ACTUAL.." Loro Edition")
    C_Timer.After(6, function() loroFrame:Hide() end)
    loroFrame:SetScript("OnMouseDown", function(self) self:Hide() end)
    _G.SethLoroFrame = loroFrame
  end
end)

SLASH_SETHTRADUCTOR1 = "/seth"
SLASH_SETHTRADUCTOR2 = "/loro"
SlashCmdList["SETHTRADUCTOR"] = function(msg)
  if _G.SethLoroFrame then _G.SethLoroFrame:Show() end
end
