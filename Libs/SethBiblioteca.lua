-- SethBiblioteca.lua - Biblioteca de traducción EN -> ES para Forever Oficial
-- Contiene Quest, Spells, Talents, Items, UI - Basado en esES Client

SethLib = {
 -- QUESTS
 ["Quests"] = "Misiones",
 ["Quest"] = "Misión",
 ["Quest Log"] = "Registro de misiones",
 ["Abandon"] = "Abandonar",
 ["Share"] = "Compartir",
 ["Rested"] = "Descansado",
 ["Available"] = "Disponible",
 ["Completed"] = "Completado",
 ["Incomplete"] = "Incompleto",
 ["Objectives"] = "Objetivos",
 ["Requirements"] = "Requisitos",
 ["Rewards"] = "Recompensas",
 ["Choose your reward:"] = "Elige tu recompensa:",

 -- HABILIDADES / SPELLS
 ["Spellbook"] = "Libro de hechizos",
 ["Abilities"] = "Habilidades",
 ["Spells"] = "Hechizos",
 ["Talents"] = "Talentos",
 ["Glyphs"] = "Glifos",
 ["Pet Spells"] = "Hechizos de mascota",
 ["Fireball"] = "Bola de Fuego",
 ["Frostbolt"] = "Descarga de Escarcha",
 ["Heal"] = "Sanar",
 ["Steady Shot"] = "Disparo firme",
 ["Hunter Pet"] = "Mascota de cazador",
 ["Call Pet"] = "Llamar mascota",
 ["Dismiss Pet"] = "Abandonar mascota",
 ["Feed Pet"] = "Alimentar mascota",
 ["Mend Pet"] = "Curar mascota",

 -- INVENTORY / UI
 ["Inventory"] = "Inventario",
 ["Character"] = "Personaje",
 ["Options"] = "Opciones",
 ["AddOn List"] = "Lista de Addons",
 ["AddOns"] = "Addons",
 ["Enable All"] = "Activar todos",
 ["Disable All"] = "Desactivar todos",
 ["Average CPU"] = "CPU Promedio",
 ["Memory Usage"] = "Uso de memoria",
 ["Current CPU"] = "CPU actual",
 ["Hunter Ammo Forever"] = "Munición de Cazador Forever",
 ["Hunter Pet Atlas"] = "Atlas de Mascotas",
 ["MinimapButtonButton"] = "Botón de Minimapa",
 ["BetterBlizzPlates"] = "Placas Mejoradas",

 -- CHAT / GENERAL
 ["Say"] = "Decir",
 ["Yell"] = "Gritar",
 ["Party"] = "Grupo",
 ["Guild"] = "Hermandad",
 ["Raid"] = "Banda",
 ["Trade"] = "Comercio",
 ["LookingForGroup"] = "Buscando Grupo",
 ["General"] = "General",
}

-- Función global que usará tu main lua
function Seth_TranslateGlobal(text)
  if not text or type(text) ~= "string" then return text end
  for en, es in pairs(SethLib) do
    if text == en then return es end
    -- para frases que contienen la palabra
    if string.find(text, en) then
      text = string.gsub(text, en, es)
    end
  end
  return text
end
