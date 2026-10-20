-- SethTraductorHispano v1.8 + Traductor de Chat (CurseForge fusion)
-- Para WoW Forever Oficial 16001

local ADDON_NAME = "SethTraductorHispano"
local VERSION_ACTUAL = "1.8"
local LINK_GITHUB = "https://github.com/SethNubth/SethTraductorHispano"

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event, arg1)
  if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
    if not SethTraductorDB then SethTraductorDB = {} end
    return
  end
  if event == "PLAYER_LOGIN" then
    print("|cFF00FF00[Seth]|r v"..VERSION_ACTUAL.." + Traductor de Chat cargado! /seth")

    -- TRADUCTOR DE CHAT - ESTILO CURSEFORGE
    local function TraducirChat(_, _, msg, ...)
      if not msg or not SethLib then return false end
      local original = msg
      local traducido = Seth_TranslateGlobal(msg)
      if traducido ~= original then
        -- Formato tipo CurseForge: [ES] Mensaje traducido
        return false, "|cFF00FF00[ES]|r "..traducido.." |cFF888888[Original: "..original.."]|r", ...
      end
      return false
    end

    -- Activa traducción automática en canales
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", TraducirChat)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", TraducirChat)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", TraducirChat)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", TraducirChat)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", TraducirChat)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", TraducirChat)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", TraducirChat)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", TraducirChat)

    -- Tooltip ALT para traducir (igual que Traductor de Chat de CurseForge)
    for i=1,15 do
      local cf = _G["ChatFrame"..i]
      if cf then
        cf:SetScript("OnHyperlinkEnter", function(self, link, text)
          if IsAltKeyDown() and text and SethLib then
            local t = Seth_TranslateGlobal(text)
            if t ~= text then
              GameTooltip:SetOwner(self, "ANCHOR_TOP")
              GameTooltip:AddLine("Traductor de Chat:", 0,1,0)
              GameTooltip:AddLine(t, 1,1,1, true)
              GameTooltip:Show()
            end
          end
        end)
        cf:SetScript("OnHyperlinkLeave", function() GameTooltip:Hide() end)
        -- Copiar links Shift+Click (tu función)
        local orig = cf:GetScript("OnHyperlinkShow")
        cf:SetScript("OnHyperlinkShow", function(self, link, text, button)
          if IsShiftKeyDown() then
            ChatFrame1EditBox:Show()
            ChatFrame1EditBox:SetText(link)
            ChatFrame1EditBox:HighlightText()
            return
          end
          if orig then return orig(self, link, text, button) end
        end)
      end
    end

    -- Frame Loro
    local loroFrame = CreateFrame("Frame", "SethLoroFrame", UIParent)
    loroFrame:SetSize(420,420) loroFrame:SetPoint("CENTER",0,80)
    loroFrame:SetFrameStrata("DIALOG") loroFrame:EnableMouse(true)
    loroFrame:SetMovable(true) loroFrame:RegisterForDrag("LeftButton")
    loroFrame:SetScript("OnDragStart", function(s) s:StartMoving() end)
    loroFrame:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)
    local bg=loroFrame:CreateTexture(nil,"BACKGROUND") bg:SetAllPoints() bg:SetColorTexture(0,0,0,0.5)
    local tex=loroFrame:CreateTexture(nil,"ARTWORK") tex:SetPoint("TOP",0,0) tex:SetSize(350,350)
    tex:SetTexture("Interface\\AddOns\\SethTraductorHispano\\Loro.tga")
    C_Timer.After(6, function() if loroFrame then loroFrame:Hide() end end)
    loroFrame:SetScript("OnMouseDown", function(self) self:Hide() end)
    _G.SethLoroFrame = loroFrame
  end
end)

SLASH_SETHTRADUCTOR1="/seth" SLASH_SETHTRADUCTOR2="/loro"
SlashCmdList["SETHTRADUCTOR"]=function(m)
  m=string.lower(m or "")
  if m=="show" then _G.SethLoroFrame:Show()
  elseif m=="hide" then _G.SethLoroFrame:Hide()
  else print("|cFF00FF00Seth v1.8|r - /seth show | /seth hide | ALT sobre chat para traducir | Shift+Click copia link") end
end
