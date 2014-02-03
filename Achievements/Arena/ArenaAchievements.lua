local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ArenaAchievements()

    local function ARENACLASS(tbl,event,...)
        if arg1:find("wins") then
            winner = GetBattlefieldWinner()
            teamNamePlayer = GetArenaTeam(1)
            teamNameWinner = GetBattlefieldTeamInfo(winner)

            name1, _, _, _, _, _, _, _, class1 = GetBattlefieldScore(1);
            name2, _, _, _, _, _, _, _, class2 = GetBattlefieldScore(2);
            name3, _, _, _, _, _, _, _, class3 = GetBattlefieldScore(3);
            name4, _, _, _, _, _, _, _, class4 = GetBattlefieldScore(4);

            names = { name1 , name2 , name3 , name4 }
            classes = { class1 , class2 , class3 , class4 }
            playingAgainst = {}

            if teamNamePlayer == teamNameWinner then
                for p=1,4 do
                    if names[p] ~= UnitName("player") and names[p]~= UnitName("party1") then
                       if playingAgainst[1] == nil and playingAgainst[0] ~= nil then
                           playingAgainst[1] = classes[p]
                       elseif playingAgainst[0] == nil then
                           playingAgainst[0] = classes[p]
                       end
                    end
                end
                return ( playingAgainst[0] == tbl.class1 and playingAgainst[1] == tbl.class2 ) or ( playingAgainst[1] == tbl.class1 and playingAgainst[0] == tbl.class2 )
            end
        end
    end

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Nem megy a Sap Blind",
	    description = "Nyerj meg egy 2v2 arénat Rogue plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\inv_throwingknife_04",
        points = 30,
	    key = "AAAA",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Priest",
                class1 = "Rogue",
                class2 = "Priest",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAA1",
		    },
            {
			    name = "Mage",
                class1 = "Rogue",
                class2 = "Mage",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAA2",
		    },
            {
			    name = "Paladin",
                class1 = "Rogue",
                class2 = "Paladin",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAA3",
		    },
	    },
    });

    TA:AddAchievement(
    {
        category = TA_ARENA_SETUP,
        name = "Nemadja a Charge Bladestorm",
        description = "Nyerj meg egy 2v2 arénat Warrior plusz az alábbi kasztok ellen",
        texture = "Interface\\Icons\\inv_sword_27",
        points = 30,
        key = "AAAB",
        save = TAchik,
        criteria =
        {
            {
                name = "Paladin",
                class1 = "Warrior",
                class2 = "Paladin",
                events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
                objective = ARENACLASS,
                key = "AAAB1",
            },
            {
                name = "Shaman",
                class1 = "Warrior",
                class2 = "Shaman",
                events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
                objective = ARENACLASS,
                key = "AAAB2",
            },
            {
                name = "Druid",
                class1 = "Warrior",
                class2 = "Druid",
                events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
                objective = ARENACLASS,
                key = "AAAB3",
            },
         },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "CD-n a Grounding",
	    description = "Nyerj meg egy 2v2 arénat Shaman plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\spell_nature_bloodlust",
        points = 30,
	    key = "AAAC",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Warlock",
                class1 = "Shaman",
                class2 = "Warlock",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAC1",
		    },
            {
			    name = "Druid",
                class1 = "Shaman",
                class2 = "Druid",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAC2",
		    },
            {
			    name = "Paladin",
                class1 = "Shaman",
                class2 = "Paladin",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAC3",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Kevés volt a Poli",
	    description = "Nyerj meg egy 2v2 arénat Mage plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\inv_staff_13",
        points = 30,
	    key = "AAAD",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Rogue",
                class1 = "Mage",
                class2 = "Rogue",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAD1",
		    },
            {
			    name = "Priest",
                class1 = "Mage",
                class2 = "Priest",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAD2",
		    },
            {
			    name = "Warlock",
                class1 = "Mage",
                class2 = "Warlock",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAD3",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Nyaralt a Gargoyle",
	    description = "Nyerj meg egy 2v2 arénat Death Knight plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\spell_deathknight_classicon",
        points = 30,
	    key = "AAAE",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Paladin",
                class1 = "Paladin",
                class2 = "Death Knight",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAE1",
		    },
            {
			    name = "Druid",
                class1 = "Druid",
                class2 = "Death Knight",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAE2",
		    },
            {
			    name = "Shaman",
                class1 = "Shaman",
                class2 = "Death Knight",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAE3",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Elégtelen Lövedék",
	    description = "Nyerj meg egy 2v2 arénat Hunter plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\inv_weapon_bow_07",
        points = 30,
	    key = "AAAG",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Druid",
                class1 = "Hunter",
                class2 = "Druid",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAG",
		    },
            {
			    name = "Paladin",
                class1 = "Hunter",
                class2 = "Paladin",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAG",
		    },
            {
			    name = "Shaman",
                class1 = "Hunter",
                class2 = "Shaman",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAG",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Lejárt a Sacred",
	    description = "Nyerj meg egy 2v2 arénat Paladin plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\ability_thunderbolt",
        points = 30,
	    key = "AAAR",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Warrior",
                class1 = "Paladin",
                class2 = "Warrior",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAR1",
		    },
            {
			    name = "Death Knight",
                class1 = "Death Knight",
                class2 = "Paladin",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAR2",
		    },
            {
			    name = "Hunter",
                class1 = "Paladin",
                class2 = "Hunter",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAR3",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Mindegy melyik Form",
	    description = "Nyerj meg egy 2v2 arénat Druid plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\ability_druid_maul",
        points = 30,
	    key = "AAAT",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Warrior",
                class1 = "Warrior",
                class2 = "Druid",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAT1",
		    },
            {
			    name = "Death Knight",
                class1 = "Death Knight",
                class2 = "Druid",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAT2",
		    },
            {
			    name = "Rogue",
                class1 = "Rogue",
                class2 = "Druid",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAT3",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Kéne még Absorb",
	    description = "Nyerj meg egy 2v2 arénat Priest plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\inv_staff_30",
        points = 30,
	    key = "AAAP",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Mage",
                class1 = "Mage",
                class2 = "Priest",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAP1",
		    },
            {
			    name = "Druid",
                class1 = "Priest",
                class2 = "Druid",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAP2",
		    },
            {
			    name = "Rogue",
                class1 = "Rogue",
                class2 = "Priest",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAP3",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_ARENA_SETUP,
	    name = "Elfogyott a Fear",
	    description = "Nyerj meg egy arénat Warlock plusz az alábbi kasztok ellen",
	    texture = "Interface\\Icons\\spell_nature_drowsy",
        points = 30,
	    key = "AAAL",
	    save = TAchik,
	    criteria =
	    {
		    {
			    name = "Paladin",
                class1 = "Warlock",
                class2 = "Paladin",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAL1",
		    },
		    {
			    name = "Druid",
                class1 = "Warlock",
                class2 = "Druid",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAL2",
		    },
		    {
			    name = "Shaman",
                class1 = "Warlock",
                class2 = "Shaman",
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = ARENACLASS,
			    key = "AAAL3",
		    },
	    },
    });

end
