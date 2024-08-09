--[[ Reading game memory --]]

local pointers = {}

-- Client base address
local CLIENT = 0x00400000

--[[ Pointer and Offsets --]]
-- HP 
local HP_POINTER = readmem(0x01139C0C, "d")

-- Hp plus
local HP_PLUS_POINTER = readmem(0x01139C0C, "d")

-- Hp buff
local HP_BUFF_POINTER = readmem(0x01139C0C, "d")

-- Max HP
local MAX_HP_POINTER = readmem(0x01139C0C, "d")

-- Mana
local MANA_POINTER = readmem(0x01139C0C, "d")

-- Mana buff
local MANA_BUFF_POINTER = readmem(0x01139C0C, "d")

-- Max mana
local MAX_MANA_POINTER = readmem(0x01139C0C, "d")

-- Char level
local LEVEL_POINTER = readmem(0x01139C0C, "d")

-- Battle status
local BATTLE_STATUS_POINTER = readmem(0x01139C0C, "d")

-- Friend List
local friendListOffsets = {0x18, 0x744, 0x4, 0xC}
local FRIEND_LIST_POINTER = readmem(0x012C2D28, "d")
for i = 1, #friendListOffsets
do
    FRIEND_LIST_POINTER = 
        readmem(FRIEND_LIST_POINTER + friendListOffsets[i], "d")
end

-- Vender bag 
local VENDER_BAG_POINTER = readmem(CLIENT + 0x00C640D8, "d")

-- Channel
local CHANNEL_POINTER = readmem(CLIENT + 0x00D3537C, "d")

-- Char name
local CHAR_NAME_POINTER = readmem(0x01139C0C, "d")
--local charNameOffsets = {0x30, 0x0, 0x44, 0x18}
--local CHAR_NAME_POINTER = readmem(CLIENT + 0x00C12980, "d")
--for i = 1, #charNameOffsets 
--do
    --CHAR_NAME_POINTER = 
        --readmem(CHAR_NAME_POINTER + charNameOffsets[i], "d")
--end

-- Target selected
local targetSelectedOffsets = {0xD0, 0x794, 0x0, 0x24, 0x6C, 0x8}
local TARGET_SELECTED_POINTER = readmem(0x012B5010, "d")
for i = 1, #targetSelectedOffsets
do
    TARGET_SELECTED_POINTER = 
        readmem(TARGET_SELECTED_POINTER + targetSelectedOffsets[i], "d")
end

-- Enemey HP
local targetHpOffsets = {0x18, 0x59C, 0x0, 0xC, 0x1F4, 0x15C}
local TARGET_HP_POINTER = readmem(0x012C2D28, "d")
for i = 1, #targetHpOffsets
do
    TARGET_HP_POINTER = 
        readmem(TARGET_HP_POINTER + targetHpOffsets[i], "d")
end


-- Target name
local targetNameOffsets = {0x18, 0xB1C, 0x0, 0xC, 0xD9C}
local TARGET_HP_NAME_POINTER = readmem(0x012C2D28, "d")
for i = 1, #targetNameOffsets
do
    TARGET_HP_NAME_POINTER = 
        readmem(TARGET_HP_NAME_POINTER + targetNameOffsets[i], "d")
end

-- X position
local X_POINTER = readmem(0x01139C0C, "d")
--local xOffsets = {0x30, 0x0, 0x44, 0x40}
--local X_POINTER = readmem(CLIENT + 0x00D369DC, "d")
--for i = 1, #xOffsets
--do
    --X_POINTER = readmem(X_POINTER + xOffsets[i], "d")
--end

-- Y position
local Y_POINTER = readmem(0x01139C0C, "d")
--local yOffsets = {0x30, 0x0, 0x44, 0x40}
--local Y_POINTER = readmem(CLIENT + 0x00D369DC, "d")
--for i = 1, #yOffsets
--do
    --Y_POINTER = readmem(Y_POINTER + yOffsets[i], "d")
--end

-- Char location
local locationOffsets = {0x7F8, 0xF4}
local LOCATION_POINTER = readmem(0x01139C0C, "d")
for i = 1, #locationOffsets
do
    LOCATION_POINTER = 
        readmem(LOCATION_POINTER + locationOffsets[i], "d")
end

-- Mount speed
--local MOUNT_SPEED_POINTER = readmem(CLIENT + 0x00C12980, "d")

-- Mount status
local MOUNT_STATUS = readmem(0x01139C0C, "d")

-- Pet
--local petOffsets = {0x18, 0x2FC, 0x0, 0xC}
local PET_POINTER = readmem(0x01139C0C, "d")
--or i = 1, #petOffsets
--do
    --PET_POINTER = 
        --readmem(PET_POINTER + petOffsets[i], "d")
--end

-- Main bag items
local bagOffsets = {0x7A0, 0x30, 0x38, 0xA4, 0x0, 0x8}
local BAG_POINTER = readmem(CLIENT + 0x00C11980, "d")
for i = 1, #bagOffsets
do
    BAG_POINTER = 
        readmem(BAG_POINTER + bagOffsets[i], "d")
end

-- Last bag items
local lastBagOffsets = {0x7A0, 0x30, 0x18, 0xA4, 0x4, 0x8}
local LAST_BAG_POINTER = readmem(CLIENT + 0x00C11980, "d")
for i = 1, #lastBagOffsets
do
    LAST_BAG_POINTER = 
        readmem(LAST_BAG_POINTER + lastBagOffsets[i], "d")
end

-- Notification
local notificationOffsets = {0x70, 0xC0C, 0xC, 0x4}
local NOTIFICATION_POINTER = readmem(CLIENT + 0x00D6B998, "d")
for i = 1, #notificationOffsets
do
    NOTIFICATION_POINTER = 
        readmem(NOTIFICATION_POINTER + notificationOffsets[i], "d")
end 

-- Dialog 
local dialogOffsets = {0x70, 0x52C, 0xC, 0x4, 0x1F4, 0x54}
local DIALOG_POINTER = readmem(CLIENT + 0x00D6BA98, "d")
for i = 1, #dialogOffsets
do
    DIALOG_POINTER = 
        readmem(DIALOG_POINTER + dialogOffsets[i], "d")
end 

-- Bag open 
local bagOpenOffsets = {0x18, 0x5C4, 0x0, 0xC, 0x1F8, 0x42C}
local BAG_OPEN_POINTER = readmem(0x012C2D28, "d")
for i = 1, #bagOpenOffsets
do
    BAG_OPEN_POINTER = 
        readmem(BAG_OPEN_POINTER + bagOpenOffsets[i], "d")
end 

-- Sitting, not in use this pointer
--local sittingOffsets = {0xB0, 0x9C, 0x74, 0x38, 0x138, 0x134}
--local SITTING_POINTER = readmem(CLIENT + 0xC4D8B8, "d")
--for i = 1, #sittingOffsets
--do
    --SITTING_POINTER = 
        --readmem(SITTING_POINTER + sittingOffsets[i], "d")
--end 

-- Returns your current HP value
function pointers.getHp()
    return readmem(HP_POINTER + 0x3B8, "d")
end

-- Return hp percent pluses
function pointers.getHpPlus()
    local plus = readmem(HP_PLUS_POINTER + 0xE4, "b")
    if plus >= 100 then
        return plus - 100
    else
        return plus
    end
end

-- Return hp buffs
function pointers.getHpBuff()
    return readmem(HP_BUFF_POINTER + 0xE0, "d")
end   

-- Returns your maximum HP value
function pointers.getMaxHp()
    local hp = readmem(MAX_HP_POINTER + 0xDC, "d") + pointers.getHpBuff() 
    local pluses = pointers.getHpPlus()

    if pluses == 1 then return hp 
    else return math.floor(((hp * pluses) / 100) + hp) end
end

-- Returns your current mana value 
function pointers.getMana()
    return readmem(MANA_POINTER + 0x3BC, "d")
end

-- Return mana buffs
function pointers.getManaBuff()
    return readmem(MANA_BUFF_POINTER + 0x6F0, "d")
end

-- Returns your maximum mana value
function pointers.getMaxMana()
    return readmem(MAX_MANA_POINTER + 0x6EC, "d") + pointers.getManaBuff()
end

-- Returns char name
function pointers.getCharName()
    local name = readmem(CHAR_NAME_POINTER + 0xBC, "s", 30)
    
    -- If name is alphanumeric return it safely
    if string.match(name, "^[%w]+$") then return name
    else 
        -- Else read it with offset
        return readmem(readmem(CHAR_NAME_POINTER + 0xBC, "d") + 0x0, "s", 30)
    end
end

-- Returns true if in battle, false otherwise
function pointers.isInBattle()
    return readmem(BATTLE_STATUS_POINTER + 0x854, "b") == 1
end


-- Returns true if target selected, false otherwise
function pointers.isTargetSelected()
    return readmem(TARGET_SELECTED_POINTER + 0x1EC, "w") == 1 
end

-- Returns target HP value
function pointers.getTargetHp()
    return readmem(TARGET_HP_POINTER + 0x480, "w")
end

-- Returns target name
function pointers.getTargetName()
    local name = readmem(TARGET_HP_NAME_POINTER + 0x9AC, "s", 51)

    -- If name is alphanumeric return it safely
    if string.match(name, "^[%w ']+$") then return name
    else 
        return readmem(readmem(TARGET_HP_NAME_POINTER + 0x9AC, "d") + 0x0, "s", 51)
    end
end

-- Returns true if target is dead, false otherwise
function pointers.isTargetDead()
    return readmem(TARGET_HP_POINTER + 0x480, "w") == 0
end

-- Returns true if target is full health, false otherwise
function pointers.isTargetHpFull()
    return readmem(TARGET_HP_POINTER + 0x480, "w") == 597
end

-- Returns char's x-axis location
function pointers.getX()
    local x = readmem(X_POINTER + 0x810, "f") / 20
    return x > 0 and math.floor(x) or math.ceil(x)
end

-- Returns char's y-axis location
function pointers.getY()
    local y = readmem(Y_POINTER + 0x814, "f") / 20
    return y > 0 and math.floor(y) or math.ceil(y)
end

-- Returns current location
function pointers.getLocation()
    local location = readmem(LOCATION_POINTER + 0x44C, "s", 51)

	-- If location is alphanumeric return it safely
    if string.match(location, "^[%w ']+$") then return location
    else 
        return readmem(readmem(LOCATION_POINTER + 0x44C, "d") + 0x0, "s", 51)
    end
end

-- Returns char's level
function pointers.getLevel()
    return readmem(LEVEL_POINTER + 0x3C4, "w")
end

-- Return mount speed, 0 if not mounted
--function pointers.getMountSpeed()
    --return readmem(MOUNT_SPEED_POINTER + 0x81C, "d")
--end

-- Returns true if player is mounted
function pointers.isMounted()
    return readmem(MOUNT_STATUS + 0x8B0, "d") ~= 0
end

-- Returns true if pet is alive
function pointers.isPetAlive()
    return readmem(PET_POINTER + 0x10A8, "d") ~= 0
end

-- Returns how many items in main bag
function pointers.getBagItems()
    return readmem(BAG_POINTER + 0x10, "d") 
end

-- Returns the number of items in last bag
function pointers.getLastBagItems()
    return readmem(LAST_BAG_POINTER + 0x10, "d")
end

-- Returns the number of items in vender's bag
function pointers.getVenderBagItems()
    return readmem(VENDER_BAG_POINTER + 0x7EC, "d")
end

-- Returns true if there is a notification
function pointers.getNotification()
    return readmem(NOTIFICATION_POINTER + 0xFD8, "d") == 16513 and true or false
end

-- Returns true if dialog window is open
function pointers.getDialog()
    return readmem(DIALOG_POINTER + 0x720, "d") == 16775 and true or false
end

-- Returns zoom level
function pointers.getZoom()
    return readmem(CLIENT + 0xC2A579, "b")
end

-- Return rotation level
function pointers.getRotation()
    return readmem(CLIENT + 0xD601DE, "b")
end

-- Returns true if there is a confirm box
function pointers.getConfirmBox()
    return readmem(0x012C2DA4, "d") == 1 and true or false
end

-- Returns true if bag is open
function pointers.isBagOpen()
    return readmem(BAG_OPEN_POINTER + 0xBA0, "d") == 903 and true or false
end

-- Returns true if channeling 
function pointers.isChanneling()
    return readmem(CHANNEL_POINTER + 0x10, "d") == 24 and true or false
end

-- Returns sitting value
--function pointers.getSitting()
    --return readmem(SITTING_POINTER + 0xD4, "d")
--end

--SITTING = 1

-- Returns true if sitting, false otherwise
function pointers.isSitting()
    return readmem(CLIENT + 0xC50938, "d") == 1 and true or false
end


function pointers.isFlistOpen()
	return readmem(FRIEND_LIST_POINTER + 0x4150, "d") == 16775 and true or false
end

return pointers
