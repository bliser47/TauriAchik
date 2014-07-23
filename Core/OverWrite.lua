--[[

                   OverWrite for TauriAchik Core 2.0
     Overwrite some functions that are found in the Blizzard_AchievementUI
                          By Bliser and Exedru


]]--

local TA = LibStub:GetLibrary("TauriAchikLib")
local numtabs;

function TAchik_OverWriteScript()
    -- Custom Functions --

    local BaseTabWasLoaded = false
    function ShowTauriAchik(self,button)
        if ( achievementFunctions ~= COMPARISON_ACHIEVEMENT_FUNCTIONS and achievementFunctions ~= COMPARISON_STAT_FUNCTIONS ) then
           AchievementFrameBaseTab_OnClick(numtabs)
           BaseTabWasLoaded = true
        elseif TA.comparisonData.comparisonEnded then
            if BaseTabWasLoaded then
                AchievementFrameComparisonTab_OnClick (numtabs)
            else
                AchievementFrameBaseTab_OnClick(1)
                BaseTabWasLoaded = true
                AchievementFrameComparisonTab_OnClick (numtabs)
            end
        end
    end

    -- Custom Functions --
	numtabs = 0
    repeat
        numtabs = numtabs + 1
    until (not _G["AchievementFrameTab"..numtabs] )
	

    TauriAchikTab = CreateFrame("Button", "AchievementFrameTab"..numtabs, AchievementFrame, "AchievementFrameTabButtonTemplate")
    TauriAchikTab:SetText(CA_ADDON_NAME)
    TauriAchikTab:SetPoint("LEFT", "AchievementFrameTab"..numtabs-1, "RIGHT", -5, 0)
    TauriAchikTab:SetID(numtabs)
    TauriAchikTab:SetScript("OnClick",ShowTauriAchik)
    PanelTemplates_SetNumTabs(AchievementFrame, numtabs)
    TauriAchikTab:SetAlpha(1)

    TAURIACHI_FUNCTIONS =
    {
	    categoryAccessor = TA.GetCategoryList,
	    clearFunc = AchievementFrameAchievements_ClearSelection,
	    updateFunc = AchievementFrameAchievements_Update,
	    selectedCategory = "summary",
    }

    COMPARISON_TAURIACHI_FUNCTIONS =
    {
	    categoryAccessor = TA.GetCategoryList,
	    clearFunc = AchievementFrameComparison_ClearSelection,
	    updateFunc = AchievementFrameComparison_Update,
	    selectedCategory = -1,
    }

	local old_AchievementFrameBaseTab_OnClick = AchievementFrameBaseTab_OnClick
	function AchievementFrameBaseTab_OnClick(id)
        if TauriAchikTab then
		    TauriAchikTab:SetAlpha(1)
		end
	    if id == numtabs then
            PanelTemplates_Tab_OnClick(_G["AchievementFrameTab"..id], AchievementFrame);
	        local isSummary = false
	        if ACHIEVEMENT_SUMMARY_CATEGORY ~= CA_ACHIEVEMENT_SUMMARY_CATEGORY then
	            ACHIEVEMENT_SUMMARY_CATEGORY_SAVED = ACHIEVEMENT_SUMMARY_CATEGORY
	        end
	        ACHIEVEMENT_SUMMARY_CATEGORY = CA_ACHIEVEMENT_SUMMARY_CATEGORY
	        AchievementFrameHeaderTitle:SetText(CA_ACHIEVEMENT_TITLE)
	        achievementFunctions = TAURIACHI_FUNCTIONS;
	        AchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES);
	        AchievementFrameHeaderPoints:SetText(TA:GetTotalAchievementPoints());
	        AchievementFrameWaterMark:SetTexture("")
	        if ( achievementFunctions.selectedCategory == "summary" ) then
	            isSummary = true;
			    AchievementFrame_ShowSubFrame(AchievementFrameSummary);
			    AchievementFrameSummary_Update(false)
		    else
	            AchievementFrame_ShowSubFrame(AchievementFrameAchievements);
	        end
	        AchievementFrameCategories_Update();
	        if ( not isSummary ) then
		        achievementFunctions.updateFunc();
	        end
		else
		    ACHIEVEMENT_SUMMARY_CATEGORY = ACHIEVEMENT_SUMMARY_CATEGORY_SAVED or ACHIEVEMENT_SUMMARY_CATEGORY
	        AchievementFrameHeaderTitle:SetText(ACHIEVEMENT_TITLE)
		    AchievementFrameHeaderPoints:SetText(GetTotalAchievementPoints())
		    old_AchievementFrameBaseTab_OnClick(id)
			AchievementFrameSummary_Update(false)
		end
	end

	local old_AchievementFrameComparisonTab_OnClick = AchievementFrameComparisonTab_OnClick
	function AchievementFrameComparisonTab_OnClick(id)
	    if id == numtabs then
		    if ACHIEVEMENT_SUMMARY_CATEGORY ~= CA_ACHIEVEMENT_SUMMARY_CATEGORY then
		        ACHIEVEMENT_SUMMARY_CATEGORY_SAVED = ACHIEVEMENT_SUMMARY_CATEGORY
		    end
		    ACHIEVEMENT_SUMMARY_CATEGORY = CA_ACHIEVEMENT_SUMMARY_CATEGORY
		    AchievementFrameCategoriesContainerButton1.label:SetText(CA_ACHIEVEMENT_SUMMARY_CATEGORY)
		    AchievementFrameHeaderTitle:SetText(CA_ACHIEVEMENT_TITLE)
			AchievementFrameHeaderPoints:SetText(TA:GetTotalAchievementPoints())
            AchievementFrameComparisonHeaderPoints:SetText(TA:GetComparisonTotalAchievementPoints())
		    achievementFunctions = COMPARISON_TAURIACHI_FUNCTIONS;
			AchievementFrame_ShowSubFrame(AchievementFrameComparison, AchievementFrameComparisonStatsContainer);
			AchievementFrameWaterMark:SetTexture("");
			AchievementFrameCategories_SelectButton(AchievementFrameCategoriesContainerButton1)
	        AchievementFrameCategories_GetCategoryList(ACHIEVEMENTUI_CATEGORIES);
	        AchievementFrameCategories_Update();
			AchievementFrameSummary_Update(true)
	        PanelTemplates_Tab_OnClick(_G["AchievementFrameTab"..id], AchievementFrame);
	        achievementFunctions.updateFunc();
		else
		    ACHIEVEMENT_SUMMARY_CATEGORY = ACHIEVEMENT_SUMMARY_CATEGORY_SAVED or ACHIEVEMENT_SUMMARY_CATEGORY
		    AchievementFrameCategoriesContainerButton1.label:SetText(ACHIEVEMENT_SUMMARY_CATEGORY)
		    AchievementFrameHeaderTitle:SetText(ACHIEVEMENT_TITLE)
			AchievementFrameHeaderPoints:SetText(GetTotalAchievementPoints())
            AchievementFrameComparisonHeaderPoints:SetText(GetComparisonAchievementPoints());
		    old_AchievementFrameComparisonTab_OnClick(id)
		    AchievementFrameComparison_UpdateStatusBars(-1)
		end
	end

	function AchievementAlertFrame_ShowAlert (achievementID)
		local frame = AchievementAlertFrame_GetAlertFrame();
		local _, name, points, completed, month, day, year, description, flags, icon
		if type(achievementID) == "number" then
		    _, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfo(achievementID);
		else
            name = achievementID
			points = 0
		end
		if ( not frame ) then
			-- We ran out of frames! Bail!
			return;
		end

		_G[frame:GetName() .. "Name"]:SetText(name);

		local shield = _G[frame:GetName() .. "Shield"];
		--AchievementShield_SetPoints(points, shield.points, GameFontNormal, GameFontNormalSmall);
		if ( points == 0 ) then
			shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
		else
			--shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
		end

		_G[frame:GetName() .. "IconTexture"]:SetTexture(icon);

		frame.id = achievementID or 1
		AlertFrame_AnimateIn(frame);
		AlertFrame_FixAnchors();
		-- note for executioner, insert here somethingsomething
    end

	local old_AchievementFrameComparison_DisplayAchievement = AchievementFrameComparison_DisplayAchievement
	function AchievementFrameComparison_DisplayAchievement(button,category,index)
	    if achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS then
		    id, name, points, completed, month, day, year, description, flags, icon, rewardText = GetAchievementInfo(TA.achiListSorted[index])
			if ( not id ) then
	    	    button:Hide();
	    	    return;
	        else
		        button:Show();
	        end
	        if ( GetPreviousAchievement(id) ) then
		        points = AchievementButton_GetProgressivePoints(id);
	        end

			GameTooltip:Hide()

		    if button then
                if not(tContains(TA.hookedButtons, button:GetName())) then
                    tinsert(TA.hookedButtons,button:GetName())
		            button:HookScript("OnEnter",AchievementComparisonAccountWide_OnEnter);
                    button:HookScript("OnLeave",function() GameTooltip:Hide() end );
                end
		    end

	        if ( button.id ~= id ) then
		        button.id = id;
		        local player = button.player;
		        local friend = button.friend;
		        local friendCompleted, friendMonth, friendDay, friendYear , _ , friendIcon , friendawDone , friendPoints = GetAchievementComparisonInfo(id);

		        player.label:SetText(name);
		        player.description:SetText(description);
		        player.icon.texture:SetTexture(icon);

		        if achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS then
		            friend.icon.texture:SetTexture(friendIcon);
		        else
                    friend.icon.texture:SetTexture(icon);
		        end

				local pointsFriend = friendPoints or points
				local inc = TA_INCOMPLETE
				if TA.achis[id].factionExistent and TA.achis[id].factionExistent ~= TAchik_GetFactionGroupFromRace(AchievementFrameComparisonHeaderPortrait.race) then
				    pointsFriend = 0
					inc = TA_INEXISTENT
				end

		        if points > 0 then
			        player.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
				else
                    player.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
				end
				if pointsFriend > 0 then
			        friend.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
		        else
				    friend.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
		        end

		        AchievementShield_SetPoints(points, player.shield.points, ACHIEVEMENTCOMPARISON_PLAYERSHIELDFONT1, ACHIEVEMENTCOMPARISON_PLAYERSHIELDFONT2,flags,completed);
		        AchievementShield_SetPoints(pointsFriend, friend.shield.points, ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT1, ACHIEVEMENTCOMPARISON_FRIENDSHIELDFONT2,flags,completed);

		        if ( completed and not player.completed ) then
		        	player.completed = true;
		        	player.dateCompleted:SetText(string.format(SHORTDATE, day, month, year));
		        	player.dateCompleted:Show();
		        	player:Saturate();
		        elseif ( completed ) then
			        player.dateCompleted:SetText(string.format(SHORTDATE, day, month, year));
		        else
			        player.completed = nil;
			        player.dateCompleted:Hide();
			        player:Desaturate();
		        end

		        if ( friendCompleted and not friend.completed ) then
		    	    friend.completed = true;
			        friend.status:SetText(string.format(SHORTDATE, friendDay, friendMonth, friendYear));
			        friend:Saturate();
		        elseif ( friendCompleted ) then
		    	    friend.status:SetText(string.format(SHORTDATE, friendDay, friendMonth, friendYear));
		        else
			        friend.completed = nil;
			        friend.status:SetText(inc);
			        friend:Desaturate();
		        end
		        TA:ColorButtonAccordingToSettings(button.player,id,completed)
		        TA:ColorComparisonButtonAccordingToSettings(button.friend,id,friendCompleted,friendawDone)
	        end
		else
		    TA:ResetButtonColor(button.player,category,index)
			TA:ResetButtonColor(button.friend,category,index)
		    old_AchievementFrameComparison_DisplayAchievement(button,category,index)
		end
	end

	function TA:SetSpecialAchievementPoints(button,id,completed,points)
	    if TA.achis[id] and TA.achis[id].hidden then
		    if TA.achis[id].complete then
			    if ( points == 0 ) then
		            button.shield.points:SetText("");
		            return;
	            elseif points then
	                if ( points <= 100 ) then
                        button.shield.points:SetFontObject(AchievementPointsFont);
	                else
	    	            button.shield.points:SetFontObject(AchievementPointsFontSmall);
	                end
	                 button.shield.points:SetText(points);
	            end
			else
	            button.shield.points:SetText("?")
			end
		end
	end

	function AchievementAccountWide_OnEnter(self)
	    if TA.achis[self.id] and TA.achis[self.id].mergers then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-20);
			if TA.achis[self.id].complete then
                GameTooltip:AddLine(CA_ACHIEVEMENT_EARNED_BY.."\124cffFFFFFF\ "..TA:MergersToString(TA.achis[self.id].mergers).."\124r");
			else
                GameTooltip:AddLine(CA_ACHIEVEMENT_HELPED_BY.."\124cffFFFFFF\ "..TA:MergersToString(TA.achis[self.id].mergers).."\124r");
			end
			GameTooltip:SetBackdropBorderColor(ACHIEVEMENTUI_GREENBORDER_R, ACHIEVEMENTUI_GREENBORDER_G, ACHIEVEMENTUI_GREENBORDER_B, ACHIEVEMENTUI_GREENBORDER_A);
            GameTooltip:Show();
		elseif TA.achis[self.id] and TA.achis[self.id].invisible then
		    GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-20)
            GameTooltip:AddLine(CA_ACHIEVEMENT_WAS_HIDDEN)
			GameTooltip:SetBackdropBorderColor(ACHIEVEMENTUI_PURPLEBORDER_R, ACHIEVEMENTUI_PURPLEBORDER_G, ACHIEVEMENTUI_PURPLEBORDER_B, ACHIEVEMENTUI_PURPLEBORDER_A);
			GameTooltip:Show();
		else
		    GameTooltip:Hide();
		end
    end

	function AchievementComparisonAccountWide_OnEnter(self)
	    local key = TA.achisKeys[self.id]
	    if key and TA.comparisonData[key] and TA.comparisonData[key].awDone and TA.comparisonData[key].awDone ~= "nil" then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT",0,-20);
            GameTooltip:AddLine(CA_ACHIEVEMENT_EARNED_BY.."\124cffFFFFFF "..TA.comparisonData[key].awDone.."\124r");
            GameTooltip:Show();
		else
		    GameTooltip:Hide();
		end
    end

	local old_AchievementButton_DisplayAchievement = AchievementButton_DisplayAchievement
    function AchievementButton_DisplayAchievement (button, category, achievement, selectionID)
		local id, name, points, completed, month, day, year, description, flags, icon, rewardText = GetAchievementInfo(category, achievement);
		old_AchievementButton_DisplayAchievement(button,category,achievement,selectionID)
		TA:ColorButtonAccordingToSettings(button,id,completed)
		TA:SetSpecialAchievementPoints(button,id,completed,points)
		GameTooltip:Hide()
		if button then
            if not tContains(TA.hookedButtons,button:GetName()) then
                tinsert(TA.hookedButtons,button:GetName())
		        button:HookScript("OnEnter",AchievementAccountWide_OnEnter);
                button:HookScript("OnLeave",function() GameTooltip:Hide() end );
            end
		end
	end

	local old_AchievementFrameSummary_UpdateAchievements = AchievementFrameSummary_UpdateAchievements
    function AchievementFrameSummary_UpdateAchievements(...)
        if achievementFunctions == TAURIACHI_FUNCTIONS then
	        local numAchievements = select("#", ...);
	        local buttons = AchievementFrameSummaryAchievements.buttons;
            AchievementFrameHeaderPoints:SetText(TA:GetTotalAchievementPoints());
            local achievementList = TA:GetPlayerLatestAchievements()
            for i=1,4,1 do
                if buttons and buttons[i] then
				    buttons[i].titleBar = _G[buttons[i]:GetName() .. "TitleBackground"]
                    buttons[i]:Hide()
                    if achievementList[i] then
                        local _, _, _, comp = GetAchievementInfo(achievementList[i]);
                        if comp then
                            local id, name, points, _, day, month, year, description, flags, icon = GetAchievementInfo(achievementList[i]);
                            buttons[i].label:SetText(name);
                            buttons[i].description:SetText(description);
                            buttons[i].icon.texture:SetTexture(icon);
                            AchievementShield_SetPoints(points, buttons[i].shield.points, GameFontNormal, GameFontNormalSmall);
						    if ( points > 0 ) then
						        buttons[i].shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
					        else
						        buttons[i].shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
					        end
                            buttons[i].dateCompleted:SetText(string.format(SHORTDATE, day, month, year));
                            buttons[i].id = achievementList[i]
                            buttons[i]:Show()
                            buttons[i]:Saturate();
							buttons[i].tooltipTitle = nil
                        else
                            local id, name, points, completed, month, day, year, description, flags, icon = GetAchievementInfo(achievementList[i]);
                            buttons[i].label:SetText(name);
                            buttons[i].description:SetText(description);
                            buttons[i].icon.texture:SetTexture(icon);
                            AchievementShield_SetPoints(points, buttons[i].shield.points, GameFontNormal, GameFontNormalSmall,flags,false);
							if ( points > 0 ) then
						        buttons[i].shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
					        else
						        buttons[i].shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
					        end
                            buttons[i].dateCompleted:SetText("");
                            buttons[i].id = achievementList[i]
                            buttons[i]:Show()
                            buttons[i]:Desaturate();
							buttons[i].tooltipTitle = CA_SUMMARY_ACHIEVEMENT_INCOMPLETE;
				            buttons[i].tooltip = CA_SUMMARY_ACHIEVEMENT_INCOMPLETE_TEXT;
                        end
		                TA:ColorButtonAccordingToSettings(buttons[i],achievementList[i],comp)
                        if not tContains(TA.hookedButtons,buttons[i]:GetName()) then
						    tinsert(TA.hookedButtons,buttons[i]:GetName())
		                    buttons[i]:HookScript("OnEnter",AchievementAccountWide_OnEnter);
                            buttons[i]:HookScript("OnLeave",function() GameTooltip:Hide() end );
						end
                    end
                end
            end
            local TAchikCategories = TA.GetCategoryList()
            local spotsTaken = 1
            for i=1,#TAchikCategories,1 do
                if getglobal("AchievementFrameSummaryCategoriesCategory"..spotsTaken) then
                    getglobal("AchievementFrameSummaryCategoriesCategory"..spotsTaken):Hide()
                    if TA.cats[TAchikCategories[i]].parent == -1 then
                        local categoryName = GetCategoryInfo(TAchikCategories[i]);
                        getglobal("AchievementFrameSummaryCategoriesCategory"..spotsTaken):SetID(TAchikCategories[i])
                        getglobal("AchievementFrameSummaryCategoriesCategory"..spotsTaken.."Label"):SetText(categoryName)
                        getglobal("AchievementFrameSummaryCategoriesCategory"..spotsTaken):Show()
                        spotsTaken = spotsTaken + 1
                    end
                end
            end
            AchievementFrameSummaryAchievementsHeaderTitle:SetText(CA_LATEST_ACHIEVEMENTS)
            AchievementFrameSummaryCategoriesHeaderTitle:SetText(CA_PROGRESS_OVERVIEW)
            AchievementFrameSummaryCategoriesStatusBarTitle:SetText(CA_EARNED_TAURIACHIEVEMENTS)
      else
            local mainCategoryListNormal = {92,96,97,95,168,169,201,155}
            for i=1,8 do
                if getglobal("AchievementFrameSummaryCategoriesCategory"..i) then
                    getglobal("AchievementFrameSummaryCategoriesCategory"..i):Hide()
                    if i < 9 then
                        local categoryName = GetCategoryInfo(mainCategoryListNormal[i]);
                        getglobal("AchievementFrameSummaryCategoriesCategory"..i):SetID(mainCategoryListNormal[i])
                        getglobal("AchievementFrameSummaryCategoriesCategory"..i.."Label"):SetText(categoryName)
                        getglobal("AchievementFrameSummaryCategoriesCategory"..i):Show()
                    end
                end
            end
            AchievementFrameSummaryAchievementsHeaderTitle:SetText(LATEST_UNLOCKED_ACHIEVEMENTS)
            AchievementFrameSummaryCategoriesHeaderTitle:SetText(ACHIEVEMENT_CATEGORY_PROGRESS)
            AchievementFrameSummaryCategoriesStatusBarTitle:SetText(ACHIEVEMENTS_COMPLETED)
            for i=1,8 do
                if getglobal("AchievementFrameSummaryCategoriesCategory"..i) then
                    getglobal("AchievementFrameSummaryCategoriesCategory"..i):Show()
                end
            end
			for i=1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
			    local buttons = AchievementFrameSummaryAchievements.buttons;
		        if buttons and buttons[i] then
                    TA:ResetButtonColor(buttons[i],nil,nil,select(i,...))
			    end
			end
			old_AchievementFrameSummary_UpdateAchievements(...)
	    end
    end

	local old_AchievementFrameSummaryCategoriesStatusBar_Update = AchievementFrameSummaryCategoriesStatusBar_Update
    function AchievementFrameSummaryCategoriesStatusBar_Update()
        if achievementFunctions == TAURIACHI_FUNCTIONS then
	        local total, completed = TA:GetNumCompletedAchievements(true)
	        AchievementFrameSummaryCategoriesStatusBar:SetMinMaxValues(0, total)
	        AchievementFrameSummaryCategoriesStatusBar:SetValue(completed)
	        AchievementFrameSummaryCategoriesStatusBarText:SetText(completed.."/"..total)
	    else
		    old_AchievementFrameSummaryCategoriesStatusBar_Update()
		end
    end

	local old_AchievementFrameComparison_UpdateStatusBars = AchievementFrameComparison_UpdateStatusBars
    function AchievementFrameComparison_UpdateStatusBars (id)
	    old_AchievementFrameComparison_UpdateStatusBars(id)
		if achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS then
		    local name = GetCategoryInfo(id);
			if ( id == ACHIEVEMENT_COMPARISON_SUMMARY_ID ) then
		        name = ACHIEVEMENT_SUMMARY_CATEGORY;
            end
			local statusBar = AchievementFrameComparisonSummaryPlayerStatusBar;
	        if name == CA_ACHIEVEMENT_SUMMARY_CATEGORY then
	 	        statusBar.title:SetText(CA_EARNED_TAURIACHIEVEMENTS);
	  	    else
	  	        statusBar.title:SetText(CA_EARNED..name..CA_ADDON_NAME);
	  	    end
		end
    end

    local old_AchievementFrame_SelectAchievement = AchievementFrame_SelectAchievement
    function AchievementFrame_SelectAchievement(id,forceSelect)
	    if achievementFunctions == TAURIACHI_FUNCTIONS then
		    AchievementFrameTab_OnClick(3);
		    if ( not AchievementFrame:IsShown() and not forceSelect ) then
			    return;
		    end

	        local _, _, _, achCompleted = GetAchievementInfo(id);
	        if ( achCompleted and (ACHIEVEMENTUI_SELECTEDFILTER == AchievementFrameFilters[ACHIEVEMENT_FILTER_INCOMPLETE].func) ) then
			    AchievementFrame_SetFilter(ACHIEVEMENT_FILTER_ALL);
		    elseif ( (not achCompleted) and (ACHIEVEMENTUI_SELECTEDFILTER == AchievementFrameFilters[ACHIEVEMENT_FILTER_COMPLETE].func) ) then
		    	AchievementFrame_SetFilter(ACHIEVEMENT_FILTER_ALL);
		    end
	        AchievementFrameTab_OnClick(3);
		    AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick;
		    AchievementFrameSummary:Hide();
		    AchievementFrameAchievements:Show();
		    local _, _, _, completed = GetAchievementInfo(id);
		    if ( not completed and GetPreviousAchievement(id) ) then
			    local prevID = GetPreviousAchievement(id);
			    _, _, _, completed = GetAchievementInfo(prevID);
			    while ( prevID and not completed ) do
			    	id = prevID;
			    	prevID = GetPreviousAchievement(id);
			    	if ( prevID ) then
			    		_, _, _, completed = GetAchievementInfo(prevID);
				    end
			    end
	    	elseif ( completed ) then
		    	local nextID, completed = GetNextAchievement(id);
			    if ( nextID and completed ) then
			    	local newID
				    while ( nextID and completed ) do
				    	newID, completed = GetNextAchievement(nextID);
				    	if ( completed ) then
					    	nextID = newID;
				    	end
				    end
				    id = nextID;
			    end
		    end

		    AchievementFrameCategories_ClearSelection();
		    local category = GetAchievementCategory(id);

		    local categoryIndex, parent, hidden = 0;
		    for i, entry in next, ACHIEVEMENTUI_CATEGORIES do
			    if ( entry.id == category ) then
			    	parent = entry.parent;
			    end
		    end

		    for i, entry in next, ACHIEVEMENTUI_CATEGORIES do
		    	if ( entry.id == parent ) then
		    		entry.collapsed = false;
			    elseif ( entry.parent == parent ) then
			    	entry.hidden = false;
			    elseif ( entry.parent == true ) then
			    	entry.collapsed = true;
			    elseif ( entry.parent ) then
			    	entry.hidden = true;
			    end
		    end

		    achievementFunctions.selectedCategory = category;
		    AchievementFrameCategoriesContainerScrollBar:SetValue(0);
		    AchievementFrameCategories_Update();

		    local shown, i = false, 1;
		    while ( not shown ) do
			    for _, button in next, AchievementFrameCategoriesContainer.buttons do
			    	if ( button.categoryID == category and math.ceil(button:GetBottom()) >= math.ceil(AchievementFrameAchievementsContainer:GetBottom())) then
			    	shown = true;
			    	end
			    end

			    if ( not shown ) then
			    	local _, maxVal = AchievementFrameCategoriesContainerScrollBar:GetMinMaxValues();
			    	if ( AchievementFrameCategoriesContainerScrollBar:GetValue() == maxVal ) then
			    		--assert(false)
				    	return;
				    else
				    	HybridScrollFrame_OnMouseWheel(AchievementFrameCategoriesContainer, -1);
				    end
			    end

			    -- Remove me if everything's working fine
			    i = i + 1;
			    if ( i > 100 ) then
			    	--assert(false);
			    	return;
			    end
            end

		    AchievementFrameAchievements_ClearSelection();
		    AchievementFrameAchievementsContainerScrollBar:SetValue(0);
		    AchievementFrameAchievements_Update();

		    local shown = false;
		    while ( not shown ) do
			    for _, button in next, AchievementFrameAchievementsContainer.buttons do
			    	if ( button.id == id and math.ceil(button:GetTop()) >= math.ceil(AchievementFrameAchievementsContainer:GetBottom())) then
				    	-- The "True" here ignores modifiers, so you don't accidentally track or link this achievement. :P
				    	AchievementButton_OnClick(button, true);

				    	-- We found the button!
				    	shown = button;
				    	break;
				    end
			    end

			    local _, maxVal = AchievementFrameAchievementsContainerScrollBar:GetMinMaxValues();
			    if ( shown ) then
			    	-- If we can, move the achievement we're scrolling to to the top of the screen.
			    	local newHeight = AchievementFrameAchievementsContainerScrollBar:GetValue() + AchievementFrameAchievementsContainer:GetTop() - shown:GetTop();
			    	newHeight = min(newHeight, maxVal);
				    AchievementFrameAchievementsContainerScrollBar:SetValue(newHeight);
			    else
				    if ( AchievementFrameAchievementsContainerScrollBar:GetValue() == maxVal ) then
				    	--assert(false, "Failed to find achievement " .. id .. " while jumping!")
				    	return;
			    	else
				    	HybridScrollFrame_OnMouseWheel(AchievementFrameAchievementsContainer, -1);
				    end
			    end
		    end
		else
            old_AchievementFrame_SelectAchievement(id,forceSelect)
		end
    end


	local old_AchievementFrameCategories_SelectButton = AchievementFrameCategories_SelectButton
	function AchievementFrameCategories_SelectButton(button)
	    if achievementFunctions == TAURIACHI_FUNCTIONS or achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS  then
		    if not button then
	            return
	        end
		    local id = button.element.id;

		    if ( type(button.element.parent) ~= "number" ) then
			    -- Is top level category (can expand/contract)
			    if ( button.isSelected and button.element.collapsed == false ) then
			    	button.element.collapsed = true;
				    for i, category in next, ACHIEVEMENTUI_CATEGORIES do
				    	if ( category.parent == id ) then
					    	category.hidden = true;
					    end
				    end
			    else
			    	for i, category in next, ACHIEVEMENTUI_CATEGORIES do
				    	if ( category.parent == id ) then
					    	category.hidden = false;
					    elseif ( category.parent == true ) then
					    	category.collapsed = true;
					    elseif ( category.parent ) then
						    category.hidden = true;
					    end
				    end
				    button.element.collapsed = false;
			    end
		    end

		    local buttons = AchievementFrameCategoriesContainer.buttons;
		    for _, button in next, buttons do
			    button.isSelected = nil;
		    end

		    button.isSelected = true;

		    if id == achievementFunctions.selectedCategory then
			    -- If this category was selected already, bail after changing collapsed states
			    return
		    end
			if id == "summary"  then
		        if achievementFunctions == TAURIACHI_FUNCTIONS  then
			        AchievementFrame_ShowSubFrame(AchievementFrameSummary);
	   	            achievementFunctions.selectedCategory = id;
	   	            AchievementFrameStatsContainerScrollBar:SetValue(0)
			    elseif achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS then
		  	        TA:SortAchievementsForComparison(0)
			        AchievementFrame_ShowSubFrame(AchievementFrameComparison, AchievementFrameComparisonContainer);
				    achievementFunctions.selectedCategory = ACHIEVEMENT_COMPARISON_SUMMARY_ID;
				    AchievementFrameComparisonContainerScrollBar:SetValue(0);
				    AchievementFrameComparison_UpdateStatusBars(ACHIEVEMENT_COMPARISON_SUMMARY_ID);
	   	        end
			else
			    if achievementFunctions == TAURIACHI_FUNCTIONS then
				    AchievementFrameAchievementsContainerScrollBar:SetValue(0);
		   	        AchievementFrame_ShowSubFrame(AchievementFrameAchievements);
			    elseif ( achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS ) then
		   		    TA:SortAchievementsForComparison(id)
		            AchievementFrame_ShowSubFrame(AchievementFrameComparison, AchievementFrameComparisonContainer);
				    AchievementFrameComparisonContainerScrollBar:SetValue(0);
				    AchievementFrameComparison_UpdateStatusBars(id);
			    else
				    AchievementFrame_ShowSubFrame(AchievementFrameComparison, AchievementFrameComparisonStatsContainer);
				    AchievementFrameComparisonStatsContainerScrollBar:SetValue(0);
	    	    end
			    achievementFunctions.selectedCategory = id;
			end
		    if ( achievementFunctions.clearFunc ) then
			    achievementFunctions.clearFunc();
		    end
		    achievementFunctions.updateFunc();
		else
		    old_AchievementFrameCategories_SelectButton(button)
		end
	end

    local old_AchievementFrame_ToggleAchievementFrame = AchievementFrame_ToggleAchievementFrame
    function AchievementFrame_ToggleAchievementFrame(toggleStatFrame)
	    if achievementFunctions == TAURIACHI_FUNCTIONS then
            AchievementFrameComparison:Hide();
	        AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick;
	        if ( AchievementFrame:IsShown() and AchievementFrame.selectedTab == 3 ) then
			    HideUIPanel(AchievementFrame);
		    else
			    ShowUIPanel(AchievementFrame);
		        AchievementFrameTab_OnClick(3);
		    end
		    return;
        else
		    old_AchievementFrame_ToggleAchievementFrame(toggleStatFrame)
		end
	end

	-- Debug, Profiling (hova rakjam ezt?)

	local profilerFontString=AchievementFrame:CreateFontString()
	profilerFontString:SetFont("Fonts\\FRIZQT__.TTF",13)
	profilerFontString:SetPoint("BOTTOMLEFT","AchievementFrame","BOTTOMLEFT",27,100)
	profilerFontString:SetWidth(160)
	profilerFontString:SetJustifyH("LEFT")
	local lastUpdate=0
	local prev1=0
	local prev2=0
	local prev3=0
	local avg=0
	local curr=GetAddOnCPUUsage("TauriAchik")
	TAchik["profilingUpdateRate"] = TAchik["profilingUpdateRate"] or 5
	WorldFrame:HookScript("OnUpdate",function()
		if (AchievementFrame:IsVisible() and _G["AchievementFrameTab"..numtabs]:IsEnabled()==0) then  -- valahova be kellett tennem a menü elrejtését mikor nem a TA fül van nyitva
			TAchik_MenuFrame:Show()
		else
			TAchik_MenuFrame:Hide()
		end
		if lastUpdate+TAchik["profilingUpdateRate"]<=time() and TAchik["profiling"] then
			lastUpdate=tonumber(time())
			prev3=tonumber(prev2)
			prev2=tonumber(prev1)
			prev1=tonumber(curr)
			avg=math.floor(((curr-prev1)+(prev1-prev2)+(prev2-prev3))/TAchik["profilingUpdateRate"])
			UpdateAddOnCPUUsage()
			curr=math.floor(GetAddOnCPUUsage("TauriAchik"))
			if (TAchik_Profiling_Logger_Enabled) then
			TAchik["profilingLog"] = TAchik["profilingLog"] or {}
				if (#TAchik["profilingLog"]>7200) then tremove(TAchik["profilingLog"],1) end
				tinsert(TAchik["profilingLog"],date().." | Delta: "..curr-prev1.."ms | Pos: "..GetSubZoneText().." | Combat: "..tostring(InCombatLockdown()).." | Events: "..TA:GetEventsCalled())
			    TA:ClearCalledEvents();
			end
			if (AchievementFrame:IsVisible() and _G["AchievementFrameTab"..numtabs]:IsEnabled()==0) then
				profilerFontString:Show()
				profilerFontString:SetText("Total CPU Usage: "..(curr).."ms\n    Previous:\n        "..(prev1).."ms\n        "..(prev2).."ms\n        "..(prev3).."ms\n    Delta:\n        "..curr-prev1.."ms\n        "..prev1-prev2.."ms\n        "..prev2-prev3.."ms\n    Average:\n        "..avg.."ms")
			end
		elseif _G["AchievementFrameTab"..numtabs]:IsEnabled()==1 or not(TAchik["profiling"]) then
			profilerFontString:Hide()
		end
	end)


	--DropDown Menü

        local menuframe = CreateFrame("Button", "TAchik_MenuFrame", AchievementFrame, "UIDropDownMenuTemplate")
        menuframe:SetPoint("TOPLEFT",AchievementFrame,"TOPLEFT",125,13)
        UIDropDownMenu_SetWidth(menuframe, 96)
        UIDropDownMenu_SetText(menuframe, "Beállítások")
        UIDropDownMenu_Initialize(menuframe,function(self,level,menulist)
			if (level or 1) == 1 then

				menu = UIDropDownMenu_CreateInfo()
				menu.text = TAchik_GetOnline() > 1 and TAchik_GetOnline().." online játékos rendelkezik TauriAchik™-al." or "Csak te rendelkezel  TauriAchik™-al."
				menu.keepShownOnClick = false
				menu.menuList, menu.hasArrow = 3, TAchik_GetOnline() > 1
				menu.notCheckable = true
				UIDropDownMenu_AddButton(menu)

				menu = UIDropDownMenu_CreateInfo()
				menu.text = "Újdonságok az utolsó verzióban"
				menu.tooltipTitle = "Az utolsó öt változtatás lesz kiírva a chatablakba."
				menu.tooltipOnButton = true
				menu.keepShownOnClick = false
				menu.notCheckable = true
				menu.func = function() TauriAchik_Command("new 5") end
				UIDropDownMenu_AddButton(menu)

				menu = UIDropDownMenu_CreateInfo() -- elválasztó
				menu.text = ""
				menu.keepShownOnClick = true
				menu.disabled = true
				UIDropDownMenu_AddButton(menu)

				menu = UIDropDownMenu_CreateInfo()
				menu.text = "Achiszerzés ki legyen írva klánon belül?"
				menu.keepShownOnClick = true
				menu.func = function() TAchik["SETTINGS"]["boolBroadCastGuild"] = not TAchik["SETTINGS"]["boolBroadCastGuild"] end
				menu.checked = function() return TAchik["SETTINGS"]["boolBroadCastGuild"] end
				UIDropDownMenu_AddButton(menu)

				menu=UIDropDownMenu_CreateInfo()
				menu.text = "Debug üzenetek ki legyenek írva?"
				menu.keepShownOnClick = true
				menu.func = function() if TAchik_DebugMode ~= 1 then TAchik_DebugMode = 1 else TAchik_DebugMode = 0 end end
				menu.checked = function() if TAchik_DebugMode ~=1 then return false else return true end end
				UIDropDownMenu_AddButton(menu)

				if TAchik_DebugMode == 1 then
					menu = UIDropDownMenu_CreateInfo()
					menu.text = "Az addon kommunikációs csatornájának üzenetei ki legyenek írva?"
					menu.keepShownOnClick = true
					menu.func = function()  if TAchik_FilterComms ~=1 then TAchik_FilterComms = 1 else TAchik_FilterComms = 0 end end
					menu.checked = function() if TAchik_FilterComms ~=1 then return false else return true end end
					UIDropDownMenu_AddButton(menu)
				end

				menu = UIDropDownMenu_CreateInfo() -- elválasztó
				menu.text = ""
				menu.keepShownOnClick = true
				menu.disabled = true
				UIDropDownMenu_AddButton(menu)

                if TA:GetNumCharactersOnRealm() > 1 then
				    menu = UIDropDownMenu_CreateInfo()
				    menu.text = "Karakter adatainak áthelyezése"
				    menu.keepShownOnClick = false
				    menu.notCheckable = true
				    menu.menuList, menu.hasArrow = 2, true
				    UIDropDownMenu_AddButton(menu)
				end

				local function mergedText3()
                    if TAchik.merged then
					    return "\124cff659D32Minden adat szétválasztása\124r"
					else
                        return "\124cff7FFF00Minden adat összevonása\124r"
					end
				end


				menu = UIDropDownMenu_CreateInfo()
				menu.text = mergedText3()
				menu.keepShownOnClick = false
				menu.notCheckable = true
				menu.func = function() StaticPopup_Show("TAchik_MergeAllConfirm") end
				UIDropDownMenu_AddButton(menu)

				menu = UIDropDownMenu_CreateInfo()
				menu.text = "\124cffFF3333Minden adat törlése\124r"
				menu.keepShownOnClick = false
				menu.notCheckable = false
				menu.func = function() StaticPopup_Show("TAchik_PurgeAllConfirm") end
				UIDropDownMenu_AddButton(menu)

			elseif self.menuList == 2 then
			    if level == 3 then
				    local charData;
				    for i=1,TA:GetNumCharactersOnRealm() do
				    	if UIDROPDOWNMENU_MENU_VALUE:find(TA:GetCharacterDataById(i).character.name) then
						    charData = TA:GetCharacterDataById(i)
					    end
					end
					local myId
			        for i=1,TA:GetNumCharactersOnRealm() do
				    	if TA:GetCharacterDataById(i).character.guid == UnitGUID("player") then
				    	    myId = i
					    	break
					    end
				    end
					local other = charData.character
					local total,get = TA:GetTotalAchievementPointsOf(charData.character.guid)
					menu = UIDropDownMenu_CreateInfo()
					menu.text = "Adatok áthelyezése".." ( + "..get.." pont )"
					menu.keepShownOnClick = false
					menu.notCheckable = true
					menu.func = function()
					    menuframe:Hide()
						StaticPopupDialogs["TAchik_ConfirmTransferData"] =
						{
							text = "Áthelyezni készülsz "..TAchik_ReturnClassWithColor(other.name,other.class).." \124cff9d9d9d(guid: "..other.guid..")\124r karakter adatait erre a karakterre. A másik karakterröl \124cffFFFF00minden achievement törlödik\124r és ez \124cffFF3333nem vonható vissza\124r.\nA folytatáshoz írd be a foráskarakter nevét.",
							showAlert = true,
							button1 = "Áthelyezés",
							button2 = "Mégse",
							hideOnEscape = true,
						    OnShow = function (self, data)
								self.editBox:SetText("")
								self.button1:Disable()
							end,
							OnAccept = function (self, data, data2)
								if self.editBox:GetText() == other.name then
									TA:TransferCharacterData(charData,TA:GetCharacterDataById(myId))
								else
									TAchik("A karakter nevét hibásan adtad meg!","error")
								end
							end,
								EditBoxOnTextChanged = function (self, data)
									if self:GetText() == other.name  then self:GetParent().button1:Enable() else self:GetParent().button1:Disable() end
								end,
							hasEditBox = true,
							timeout = 0,
							whileDead = true,
							hideOnEscape = true,
						}
                        StaticPopup_Show("TAchik_ConfirmTransferData")
					end
					UIDropDownMenu_AddButton(menu,level)

					menu = UIDropDownMenu_CreateInfo()
					menu.text = "Adatok hasonlítása"
					menu.keepShownOnClick = false
					menu.notCheckable = true
					menu.func = function()
					    menuframe:Hide()
					    TauriAchik_Command("compare "..charData.character.name)
					end
					UIDropDownMenu_AddButton(menu,level)
				else
			        local myId
			        for i=1,TA:GetNumCharactersOnRealm() do
				    	if TA:GetCharacterDataById(i).character.guid == UnitGUID("player") then
				    	    myId = i
					    	break
					    end
				    end
				    for i=1,TA:GetNumCharactersOnRealm() do
				    	if TA:GetCharacterDataById(i).character.guid ~= UnitGUID("player") then
                            local other = TA:GetCharacterDataById(i).character
						    local total,get = TA:GetTotalAchievementPointsOf(other.guid)
						    menu = UIDropDownMenu_CreateInfo()
						    menu.text = TAchik_ReturnClassWithColor(other.name,other.class)
						    menu.menuList, menu.hasArrow = 2, true
					        menu.keepShownOnClick = false
						    menu.notCheckable = true
						    menu.func = function()
						    	menuframe:Hide()
                                StaticPopupDialogs["TAchik_ConfirmTransferData"] =
	                       	    {
		                           	text = "Áthelyezni készülsz "..TAchik_ReturnClassWithColor(other.name,other.class).." \124cff9d9d9d(guid: "..other.guid..")\124r karakter adatait erre a karakterre. A másik karakterröl \124cffFFFF00minden achievement törlödik\124r és ez \124cffFF3333nem vonható vissza\124r.\nA folytatáshoz írd be a foráskarakter nevét.",
	                       		    showAlert = true,
		                           	button1 = "Áthelyezés",
		                           	button2 = "Mégse",
		                           	hideOnEscape = true,
		                               	OnShow = function (self, data)
		                           		self.editBox:SetText("")
		                           		self.button1:Disable()
		                           	end,
		                           	OnAccept = function (self, data, data2)
			                           	if self.editBox:GetText() == other.name then
			                           		TA:TransferCharacterData(TA:GetCharacterDataById(i),TA:GetCharacterDataById(myId))
			                           	else
			                           		TAchik("A karakter nevét hibásan adtad meg!","error")
			                           	end
		                           	end,
								        EditBoxOnTextChanged = function (self, data)
								    	    if self:GetText() == other.name  then self:GetParent().button1:Enable() else self:GetParent().button1:Disable() end
			                            end,
								    hasEditBox = true,
								    timeout = 0,
								    whileDead = true,
								    hideOnEscape = true,
							    }
							    StaticPopup_Show("TAchik_ConfirmTransferData")
						    end
						    UIDropDownMenu_AddButton(menu,level)
					    end
					end
				end
			elseif self.menuList == 3 then
			    for k,v in pairs(TA.onlinePlayers) do
			        menu = UIDropDownMenu_CreateInfo()
				    menu.text = v.name.." ( "..v.guild.." - "..v.points.." pont )"
					menu.keepShownOnClick = false
					menu.notCheckable = true
					menu.func = function()
					    menuframe:Hide()
                        TauriAchik_Command("compare "..v.name)
					end
					UIDropDownMenu_AddButton(menu,level)
				end
			end
        end)

		local function mergeText()
		    if TAchik.merged then
			    return TAchik_UnMergeAllConfirmText()
			else
			    return TAchik_MergeAllConfirmText()
			end
		end

		local function mergeText2()
		    if not TAchik.merged then
			    return "Összevonás"
			else
			    return "Különválasztás"
			end
		end

		StaticPopupDialogs["TAchik_MergeAllConfirm"] =
		{
			text = mergeText(),
			showAlert = true,
			button1 = mergeText2(),
			button2 = "Mégse",
			hideOnEscape = true,
			OnShow = function (self, data)
					self.editBox:SetText("")
					self.button1:Disable()
			end,
			OnAccept = function (self, data, data2)
				if tostring(self.editBox:GetText())==tostring(TAchik_MergeAllConfirmString) then
					TA:SetMergeData(not TAchik.merged)
					ReloadUI()
				else
					TAchik_Print("A megerősítő kód hibás!","error")
				end
			end,
               EditBoxOnTextChanged = function (self, data)
				if self:GetText() == TAchik_MergeAllConfirmString then self:GetParent().button1:Enable() else self:GetParent().button1:Disable() end
			end,
			hasEditBox = true,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
        }

        StaticPopupDialogs["TAchik_PurgeAllConfirm"] = {
			text = TAchik_PurgeAllConfirmText(),
			showAlert = true,
			button1 = "Törlés",
			button2 = "Mégse",
			hideOnEscape = true,
			OnShow = function (self, data)
					self.editBox:SetText("")
					self.button1:Disable()
			end,
			OnAccept = function (self, data, data2)
				if tostring(self.editBox:GetText())==tostring(TAchik_PurgeAllConfirmString) then
					TA:ResetAchievements()
					ReloadUI()
				else
					TAchik_Print("A megerősítő kód hibás!","error")
				end
			end,
               EditBoxOnTextChanged = function (self, data)
				if self:GetText() == TAchik_PurgeAllConfirmString then self:GetParent().button1:Enable() else self:GetParent().button1:Disable() end
			end,
			hasEditBox = true,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
        }


end


--[[ Also known as the TrackingFrame => If BlizzardAchievment_UI wasn't loaded yet => LOAD it !
 By loading it -> We also load the OverWriteScript above which is only valid if called after the BlizzardAchievement_UI ]]--
function TAchik_OverWriteWatchFrame()

    function WatchFrameLinkButtonTemplate_OnClick (self, button, pushed)
        if ( IsModifiedClick("CHATLINK") and ChatEdit_GetActiveWindow() ) then
            if ( self.type == "QUEST" ) then
                local questLink = GetQuestLink(GetQuestIndexForWatch(self.index));
                if ( questLink ) then
                    ChatEdit_InsertLink(questLink);
                end
            elseif ( self.type == "ACHIEVEMENT" ) then
                local achievementLink = GetAchievementLink(self.index);
                if ( achievementLink ) then
                    ChatEdit_InsertLink(achievementLink);
                end
            end
        elseif ( button ~= "RightButton" ) then
            WatchFrameLinkButtonTemplate_OnLeftClick(self, button);
        else
            local dropDown = WatchFrameDropDown;
            if ( WatchFrame.lastLinkButton ~= self ) then
                CloseDropDownMenus();
            end
            dropDown.type = self.type;
            dropDown.index = self.index;
            WatchFrame.dropDownOpen = true;
            WatchFrame.lastLinkButton = self;
            ToggleDropDownMenu(1, nil, dropDown, "cursor", 3, -3)
        end
    end

    function WatchFrameLinkButtonTemplate_OnLeftClick (self, button)

        if TA.achis[self.index] then
            achievementFunctions = TAURIACHI_FUNCTIONS
            if ( not AchievementFrame ) then
                AchievementMicroButton:Click()
                return WatchFrameLinkButtonTemplate_OnLeftClick(self, button)
            end
        else
            achievementFunctions = ACHIEVEMENT_FUNCTIONS
        end

        CloseDropDownMenus();
        if ( self.type == "QUEST" ) then
            if ( IsModifiedClick("QUESTWATCHTOGGLE") ) then
                WatchFrame_StopTrackingQuest( button, self.index);
            else
                ExpandQuestHeader( GetQuestSortIndex( GetQuestIndexForWatch(self.index) ) );
                local questIndex = GetQuestIndexForWatch(self.index);
                if (self.isComplete and GetQuestLogIsAutoComplete(questIndex)) then
                    ShowQuestComplete(questIndex);
                    WatchFrameAutoQuest_ClearPopUpByLogIndex(questIndex);
                else
                    QuestLog_OpenToQuest( questIndex );
                end
            end
            return;
        elseif ( self.type == "ACHIEVEMENT" ) then
            if ( not AchievementFrame ) then
                AchievementFrame_LoadUI();
            end
            if ( IsModifiedClick("QUESTWATCHTOGGLE") ) then
                WatchFrame_StopTrackingAchievement(button, self.index);
            elseif ( not AchievementFrame:IsShown() ) then
                AchievementFrame_ToggleAchievementFrame();
                AchievementFrame_SelectAchievement(self.index);
            else
                if ( AchievementFrameAchievements.selection ~= self.index ) then
                    AchievementFrame_SelectAchievement(self.index);
                else
                    AchievementFrame_ToggleAchievementFrame();
                end
            end
            return;
        end
    end


end
