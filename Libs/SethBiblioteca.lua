-- SethBiblioteca FULL v1.8 + Traductor de Chat frases
SethLib = {
 -- UI
 ["Quests"]="Misiones", ["Quest"]="Misión", ["Abandon"]="Abandonar", ["Share"]="Compartir",
 ["Objectives"]="Objetivos", ["Rewards"]="Recompensas", ["Completed"]="Completado",
 ["Inventory"]="Inventario", ["Character"]="Personaje", ["Spellbook"]="Hechizos",
 ["Talents"]="Talentos", ["AddOn List"]="Lista de Addons",

 -- CHAT TRADUCTOR - Frases de CurseForge
 ["LFG"]="Busco Grupo", ["LFM"]="Busco Más", ["Looking for group"]="Buscando grupo",
 ["Looking for more"]="Buscando más", ["WTS"]="Vendo", ["WTB"]="Compro",
 ["WTT"]="Intercambio", ["WTS"]="Vendo", ["LF Tank"]="Busco Tanque",
 ["LF Healer"]="Busco Sanador", ["LF DPS"]="Busco DPS", ["Healer"]="Sanador",
 ["Tank"]="Tanque", ["DPS"]="Daño", ["Dungeon"]="Mazmorra", ["Raid"]="Banda",
 ["Heroic"]="Heroico", ["Need all"]="Necesito todo", ["Need healer"]="Necesito sanador",
 ["Need tank"]="Necesito tanque", ["Invite"]="Invitar", ["Inv"]="Inv",
 [" whisper me"]=" susurrame", [" whisper"]=" susurro",
 ["Gold"]="Oro", ["Cheap"]="Barato", ["Free"]="Gratis",

 -- RAE CORRECTO ESPAÑOL
  ["Hello!"] = "¡Hola!",
  ["Hi!"] = "¡Hola!",
  ["Hello"] = "¡Hola!",
  ["What are you doing?"] = "¿Qué haces?",
  ["What are you doing"] = "¿Qué haces?",
  ["What?"] = "¿Qué?",
  ["What!"] = "¡Qué!",
  ["How are you?"] = "¿Cómo estás?",
  ["Where are you?"] = "¿Dónde estás?",
  ["Help!"] = "¡Ayuda!",
  ["Help me!"] = "¡Ayúdame!",
  
 -- Cazador
 ["Hunter"]="Cazador", ["Pet"]="Mascota", ["Feed Pet"]="Alimentar mascota",
 ["Mend Pet"]="Curar mascota", ["Call Pet"]="Llamar mascota",
}

function Seth_TranslateGlobal(txt)
  if not txt or type(txt)~="string" then return txt end
  -- Traduce frases largas primero
  for en, es in pairs(SethLib) do
    txt = string.gsub(txt, en, es)
  end
  return txt
end
