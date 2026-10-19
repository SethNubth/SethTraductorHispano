-- SethTraductorHispano v1.5 - Copiar Links + Traduccion Player to Player
local function MakeChatCopyable()
    for i = 1, NUM_CHAT_WINDOWS do
        local frame = _G["ChatFrame"..i]
        if frame then
            -- Hace que el chat sea clickeable
            frame:SetScript("OnHyperlinkClick", function(self, link, text, button)
                if button == "LeftButton" then
                    if IsShiftKeyDown() then
                        -- Copia todo el texto
                        local editBox = ChatEdit_ChooseBoxForSend()
                        editBox:Show()
                        editBox:SetText(text)
                        editBox:HighlightText()
                        print("|cFF00FF00[SethTraductor]|r Texto copiado: "..text)
                    else
                        -- Link normal
                        if link:sub(1,4) == "http" then
                            print("|cFF00FF00[SethTraductor]|r Link: "..link)
                        end
                    end
                end
            end)
        end
    end
end

-- Detecta URLs y los convierte en links clickeables
local function AddCopyLinkFilter(event, msg, author, ...)
    if msg and msg:find("https?://") then
        msg = msg:gsub("(https?://%S+)", "|Hurl:%1|h|cFF00CCFF[%1]|r|h")
    end
    -- Detecta invite links, wa, etc
    if msg and (msg:find("wago") or msg:find("curseforge") or msg:find("discord%.gg")) then
        msg = msg:gsub("(%S+%.%S+/%S+)", "|Hurl:%1|h|cFF00CCFF[%1]|r|h")
    end
    return false, msg, author, ...
end

-- Hooks para TODOS los canales
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", AddCopyLinkFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", AddCopyLinkFilter) -- Global

-- Copiar con click derecho en el chat
hooksecurefunc("ChatFrame_OnHyperlinkShow", function(self, link, text, button)
    if IsModifiedClick("CHATLINK") then
        local box = ChatEdit_ChooseBoxForSend()
        box:Insert(text)
    end
end)
