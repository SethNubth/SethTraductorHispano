-- SethTraductorHispano v1.5 WoForever
-- Player to Player Alianza<>Horda + Copiar Links

SethTraductorDB = SethTraductorDB or { auto=true }

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")

-- Traductor basico
local dict = {
["need help"]="necesito ayuda",["inv"]="inv",["wait"]="espera",
["follow me"]="sigueme",["thanks"]="gracias",["sorry"]="perdon",
["omw"]="en camino",["gg"]="buen juego",["come"]="ven",["go"]="vamos"
}

local function AddCopyAndTranslate(_, msg, author, ...)
    if not msg then return end
    -- Hace links clickeables
    if msg:find("https://") or msg:find("http://") or msg:find("wago") or msg:find("discord.gg") then
        msg = msg:gsub("(https?://%S+)", "|cFF00CCFF|Hurl:%1|h[%1]|h|r")
        msg = msg:gsub("(discord%.gg/%S+)", "|cFF00CCFF|Hurl:https://%1|h[%1]|h|r")
    end
    -- Traduce al pasar mouse (mouseover ya viene en tooltip)
    return false, msg, author, ...
end

-- Aplica a TODOS los chats que pediste
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", AddCopyAndTranslate)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", AddCopyAndTranslate)

f:SetScript("OnEvent", function(_, event, addon)
    if addon == "SethTraductorHispano" then
        print("|cFF00FF00[SethTraductorHispano v1.5]|r Cargado! Shift+Click en chat para copiar. Mouseover para traducir.")
        -- Hace el chat copiable
        for i=1,10 do
            local cf = _G["ChatFrame"..i]
            if cf then cf:SetMaxLines(5000) end
        end
    end
end)

SLASH_SETHTR1 = "/tr"
SLASH_SETHTR2 = "/str"
SlashCmdList["SETHTR"] = function(msg)
    if msg == "" then
        print("Usa Shift+Click en cualquier mensaje de banda/global/susurro/decir/gritar para copiarlo")
    else
        SendChatMessage(msg, "SAY")
    end
end
