BINDING_HEADER_WLGADDON = "Wowhead Link Gen"
BINDING_NAME_GENERATEWOWHEADURL = "Generate Wowhead URL"
local WOWHEAD_BASE_URL = "http://www.wowhead.com/"
local WOWHEAD_QUEST_BASE_URL = WOWHEAD_BASE_URL.."quest="
local WOWHEAD_QUEST_BASE_URL_POSTFIX = "#comments"

function process_widget()
    local selected_frame=GetMouseFocus()
    if (selected_frame:GetName() == "ObjectiveTrackerBlocksFrameHeader") then
        local full_url=WOWHEAD_QUEST_BASE_URL..selected_frame:GetParent().id..WOWHEAD_QUEST_BASE_URL_POSTFIX
        --print(full_url)
        StaticPopupDialogs["WLG-Copy-Popup"]={
            text="",
            button1 = "Close",
            timeout = 5,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
            OnShow = function (self, data)
                self.editBox:SetText(full_url)
                self.editBox:SetWidth(260)
                self.editBox:HighlightText(0,self.editBox:GetCursorPosition())
            end,
            hasEditBox = true
        }
        StaticPopup_Show("WLG-Copy-Popup")
    end
end

SLASH_WLG1 = "/wlg"
SlashCmdList.WLG = process_widget

