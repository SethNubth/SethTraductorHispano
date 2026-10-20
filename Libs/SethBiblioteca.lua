-- SethBiblioteca.lua FULL - Forever Oficial 16001
SethLib = {
 -- UI BASE
 ["Quests"]="Misiones", ["Quest"]="Misión", ["Quest Log"]="Registro de misiones",
 ["Abandon"]="Abandonar", ["Share"]="Compartir", ["Track"]="Rastrear",
 ["Objectives"]="Objetivos", ["Requirements"]="Requisitos", ["Rewards"]="Recompensas",
 ["Choose your reward:"]="Elige tu recompensa:", ["Complete"]="Completar",
 ["Available"]="Disponible", ["Completed"]="Completado", ["Incomplete"]="Incompleto",
 ["Rested"]="Descansado", ["Inventory"]="Inventario", ["Character"]="Personaje",
 ["Spellbook"]="Libro de hechizos", ["Abilities"]="Habilidades", ["Spells"]="Hechizos",
 ["Talents"]="Talentos", ["Glyphs"]="Glifos", ["Options"]="Opciones",
 ["AddOn List"]="Lista de Addons", ["AddOns"]="Addons", ["Enable All"]="Activar todos",
 ["Disable All"]="Desactivar todos", ["Average CPU"]="CPU Promedio", ["Memory"]="Memoria",
 ["Search"]="Buscar", ["Close"]="Cerrar", ["Accept"]="Aceptar", ["Decline"]="Rechazar",

 -- CAZADOR (tu clase)
 ["Hunter"]="Cazador", ["Pet"]="Mascota", ["Call Pet"]="Llamar mascota",
 ["Dismiss Pet"]="Abandonar mascota", ["Feed Pet"]="Alimentar mascota",
 ["Mend Pet"]="Curar mascota", ["Revive Pet"]="Revivir mascota",
 ["Tame Beast"]="Domar bestia", ["Beast Mastery"]="Dominio de bestias",
 ["Steady Shot"]="Disparo firme", ["Auto Shot"]="Disparo automático",
 ["Arcane Shot"]="Disparo arcano", ["Concussive Shot"]="Disparo de conmoción",
 ["Hunter's Mark"]="Marca del cazador", ["Aspect of the Viper"]="Aspecto de la víbora",
 ["Aspect of the Hawk"]="Aspecto del halcón",

 -- OTRAS CLASES
 ["Fireball"]="Bola de Fuego", ["Frostbolt"]="Descarga de Escarcha",
 ["Heal"]="Sanar", ["Flash Heal"]="Sanación relámpago",
 ["Shadow Bolt"]="Descarga de las Sombras", ["Warrior"]="Guerrero",
 ["Mage"]="Mago", ["Priest"]="Sacerdote", ["Rogue"]="Pícaro",
 ["Druid"]="Druida", ["Paladin"]="Paladín", ["Shaman"]="Chamán",
 ["Warlock"]="Brujo", ["Death Knight"]="Caballero de la Muerte",

 -- CHAT
 ["Say"]="Decir", ["Yell"]="Gritar", ["Party"]="Grupo", ["Guild"]="Hermandad",
 ["Raid"]="Banda", ["Trade"]="Comercio", ["General"]="General",
 ["LookingForGroup"]="Buscando grupo",

 -- ADDONS QUE VISTE EN TU VIDEO
 ["Hunter Ammo Forever"]="Munición de Cazador Forever",
 ["Hunter Pet Atlas"]="Atlas de Mascotas",
 ["BetterBlizzPlates"]="Placas Mejoradas",
 ["MinimapButtonButton"]="Botón de Minimapa",
 ["Forever Companion"]="Compañero Forever",
}

function Seth_TranslateGlobal(txt)
  if not txt or type(txt)~="string" then return txt end
  for en, es in pairs(SethLib) do
    txt = string.gsub(txt, en, es)
  end
  return txt
end
