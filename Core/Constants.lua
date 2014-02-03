
--Folder structures
TAURIACHIK_PLACEHOLDER_ICON = "Interface\\Addons\\TauriAchik\\Icons\\misc_tauriachik_placeholder.tga"
ICONS_ROOT = "Interface\\Icons\\"

--Function abbrevations
iam = UnitName("player")

TA_UNIX = 1374299992
TA_INCOMPLETE = "Befejezetlen"
TA_INEXISTENT = "Nem létezö"

ACHIEVEMENTUI_BLUEBORDER_R = 0.129;
ACHIEVEMENTUI_BLUEBORDER_G = 0.671;
ACHIEVEMENTUI_BLUEBORDER_B = 0.875;
ACHIEVEMENTUI_BLUEBORDER_A = 1;


ACHIEVEMENTUI_GREENBORDER_R = 0.13;
ACHIEVEMENTUI_GREENBORDER_G = 0.95;
ACHIEVEMENTUI_GREENBORDER_B = 0.10;
ACHIEVEMENTUI_GREENBORDER_A = 1;

ACHIEVEMENTUI_PURPLEBORDER_R = 0.7;
ACHIEVEMENTUI_PURPLEBORDER_G = 0.3;
ACHIEVEMENTUI_PURPLEBORDER_B = 0.9;
ACHIEVEMENTUI_PURPLEBORDER_A = 1;

--events - aka I'm too lazy to type " two times.
COMBAT_LOG_EVENT_UNFILTERED = "COMBAT_LOG_EVENT_UNFILTERED"
SPELL_AURA_REMOVED = "SPELL_AURA_REMOVED"
SPELL_AURA_APPLIED = "SPELL_AURA_APPLIED"
UNIT_DIED = "UNIT_DIED"

-- Simple variables
MIN_JUMP_LENGTH = 0.5

-- strings
CA_ADDON_NAME = "TauriAchik"
CA_HIDDEN_UNTILL_EARNED = "Rejtve mig meg nem szerzed"
CA_ACHIEVEMENT_SUMMARY_CATEGORY = "Összegzés"
CA_ACHIEVEMENT_TITLE = "TauriAchi Pontok"

CA_HIDDEN_NOHELP = "Rejtett achievementekhez nincs segítség ;)"
CA_THISACHI_NOHELP = "Ehhez az achievementhez nincs segítség."

CA_LATEST_ACHIEVEMENTS = "Legutóbbi TauriAchievementek"
CA_PROGRESS_OVERVIEW = "Állapot Áttekintés"
CA_EARNED_TAURIACHIEVEMENTS = "Megszerzett TauriAchik"
CA_ACCOUNT_WIDE_ACHIEVEMENT = "Minden karaktered az accounton befojásolja ezt az achievementet";
CA_ACCOUNT_WIDE_ACHIEVEMENT_COMPLETED = "Minden karaktered az accounton befojásolta ezt az achievementet"
CA_ACHIEVEMENT_EARNED_BY = "Megszerezte:"
CA_ACHIEVEMENT_HELPED_BY = "Hozzájárul:"
CA_ACHIEVEMENT_WAS_HIDDEN = "Ez rejtve volt"
CA_SUMMARY_ACHIEVEMENT_INCOMPLETE = "Befejezetlen TauriAchi"
CA_SUMMARY_ACHIEVEMENT_INCOMPLETE_TEXT = "Teljesítsd az achievement követelményeit TauriAchi pontokért, jutalmakért és dicsöségért!"
CA_EARNED = "Megszerzett "
CA_LINK_EARNED_BY = "Achievement earned by "
CA_LINK_PROGRESS = "Achievement in progress by"


TACHIK_TAURI_VENDOR_REQUIRED_STATE =
{
    ["Stormwind City"] =
	{
		requiredState = "Trade District",
		requiredFunction = "GetSubZoneText",
        requiredEvents = { "ZONE_CHANGED" }
	},
	["City of Ironforge"] =
	{
	    requiredState = "The High Seat",
		requiredFunction = "GetSubZoneText",
        requiredEvents = { "ZONE_CHANGED_INDOORS" },
	},
	"Darnassus",
	"Thunder Bluff",
	["Orgrimmar"] =
    {
		requiredState = "Valley of Strength",
		requiredFunction = "GetSubZoneText",
        requiredEvents = { "ZONE_CHANGED_INDOORS" }
	},
	["Undercity"] =
    {
	    requiredState = "Trade Quarter",
		requiredFunction = "GetSubZoneText",
        requiredEvents = { "ZONE_CHANGED_INDOORS" }
    }
}
