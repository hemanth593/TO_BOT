--[[ Reading game memory --]]

local memory = {}
local CLIENT = 0x00400000
function memory.charName()
    local CLIENT = 0x00400000
    local CHAR_NAME= readmem(0x00400000 +0x00C15980, "d")
    local name = readmem(CHAR_NAME + 0x3C4, "s", 30)

    if string.match(name, "^[%w]+$") then return name
    else
        return readmem(readmem(CHAR_NAME + 0x3C4, "d") + 0x0, "s", 30)
    end
end
function memory.Inventory()
    return readmem(BAG_OPEN_POINTER + 0x240, "d") == 903 and true or false
end
function memory.CHAR_HP()
    return readmem (0x00400000 +0x00C15980, "d")
end
function memory.get_current_HP()
    return readmem(memory.CHAR_HP() + 0x320, "d")
end
function memory.get_percent_HP()
    return readmem(memory.CHAR_HP() + 0x3EC, "b")
end
function memory.get_pethp_skillpoints()
    return readmem(memory.CHAR_HP() + 0x3E8, "d")
end
function memory.get_basic_max_HP()
    return readmem(memory.CHAR_HP() + 0x3E4, "d")
end
function memory.get_pet_status()
	return readmem( readmem(0x01139C0C, "d") + 0x10A8, "d")
	
end
function memory.TOTAL_CHAR_MAX_HP()
    local maxhp = math.floor((((memory.get_percent_HP() - 100) / 100) * (memory.get_basic_max_HP() + memory.get_pethp_skillpoints())) + (memory.get_basic_max_HP() + memory.get_pethp_skillpoints()))
     return maxhp
end
function memory.CharHPpercent()
	return ((memory.get_current_HP()/memory.TOTAL_CHAR_MAX_HP())*100)
end

function memory.targetHP()
    local targetHPPointers = {0x18, 0x16C, 0x0, 0xC, 0x1F8, 0x448, 0xC00}
    local targetHP = readmem(CLIENT + 0x00EC2D28, "d")
    for i = 1, #targetHPPointers
    do
        targetHP = readmem(targetHP + targetHPPointers[i], "d")
    end

    return  targetHP
end
function memory.targetHPpercent()
        local max = 597
        local min = 460
        local x =  memory.targetHP()
        local c = (100 * (x - min)/137)
        if c < 0 then
            return 0
        else
            return c
        end
end
function memory.getLocation()
    local locationPointers = {0x18, 0x2304, 0xC, 0x1F4, 0x54, 0x54}
    local Location = readmem(CLIENT + 0x00EC2D28, "d")
    for i = 1, #locationPointers
    do
    Location = readmem(Location + locationPointers[i], "d")
    end
    local location = readmem(Location + 0x0, "s", 51)
    local position = regexp(location, [[\[]])
    return string.sub(location, 0, position - 2)
end
function memory.getLocation_cords(p)
    local locationPointers = {0x18, 0x2304, 0xC, 0x1F4, 0x54, 0x54}
    local Location = readmem(CLIENT + 0x00EC2D28, "d")
    for i = 1, #locationPointers
    do
    	Location = readmem(Location + locationPointers[i], "d")
    end
    local location = readmem(Location + 0x0, "s", 51)
    local pattern = "%[(-?%d+),(-?%d+)]"
    local x, y = string.match(location, pattern)
    m = p
    if m == 0
        then return x
    end
    if m == 1 then
        return y
    end
end
local X_BOT = readmem(0x01139C0C, "d")
local Y_BOT = readmem(0x01139C0C, "d")
function memory.getX()
    local x = readmem(X_BOT + 0x810, "f") / 20
    return x > 0 and math.floor(x) or math.ceil(x)
end

-- Returns char's y-axis location
function memory.getY()
    local y = readmem(Y_BOT + 0x814, "f") / 20
    return y > 0 and math.floor(y) or math.ceil(y)
end

function memory.getLocation_cordsX()
    local locationPointers = {0x18, 0x2304, 0xC, 0x1F4, 0x54, 0x54}
    local Location = readmem(CLIENT + 0x00EC2D28, "d")
    for i = 1, #locationPointers
    do
    	Location = readmem(Location + locationPointers[i], "d")
    end
    local location = readmem(Location + 0x0, "s", 51)
    local pattern = "%[(-?%d+),(-?%d+)]"
    local x, y = string.match(location, pattern)
	return x
end
function memory.getLocation_cordsY()
    local locationPointers = {0x18, 0x2304, 0xC, 0x1F4, 0x54, 0x54}
    local Location = readmem(CLIENT + 0x00EC2D28, "d")
    for i = 1, #locationPointers
    do
    	Location = readmem(Location + locationPointers[i], "d")
    end
    local location = readmem(Location + 0x0, "s", 51)
    local pattern = "%[(-?%d+),(-?%d+)]"
    local x, y = string.match(location, pattern)
	return y
end
function memory.getCharLevel()
    return readmem(readmem(0x00400000 +0x00C15980, "d") + 0x32C, "w")
end
function memory.Battle_Status()
    return readmem(readmem(0x00400000 +0x00C15980, "d") + 0x7BC, "b")
end
function memory.Target_Selected()
    local targetSelectedPointers = {0xD0, 0x794, 0x0, 0x24, 0xAC, 0x20}
    local Target_Selected = readmem(CLIENT + 0x00EB5010, "d")
    for i = 1, #targetSelectedPointers
    do
        Target_Selected = readmem(Target_Selected + targetSelectedPointers[i], "d")
    end

    return  readmem(Target_Selected + 0x1AC, "d")
end
function memory.Target_Name()
    local targetNamePointers = {0x18, 0xB1C, 0x0, 0xC, 0xD9C}
    local Target_Name = readmem(CLIENT + 0x012C2D28, "d")
    for i = 1, #targetNamePointers
    do
        Target_Name = readmem(Target_Name + targetNamePointers[i], "d")
    end

    local name = readmem(Target_Name + 0x9AC, "s", 51)

    -- If name is alphanumeric return it safely
    if string.match(name, "^[%w ']+$") then return name
    else
        return readmem(readmem(Target_Name + 0x9AC, "d") + 0x0, "s", 51)
    end
end
function memory.Char_Sit()
    return readmem(CLIENT + 0xC4D8B8, "d")
end
function memory.mount_status()
    mount = readmem((readmem(0x01139C0C, "d")) + 0x8B0, "d")
    if mount > 0 then
        return 1
    else
        return 0
    end
end

--Mana
function memory.Mana()
    return readmem(0x00400000 +0x00C15980, "d")
end
-- Current Mana
function memory.Current_Mana()
    return readmem(memory.Mana() + 0x324, "d")
end
-- Mana buff
function memory.Mana_Buff()
    return readmem(memory.Mana() + 0x2B8, "d")
end
-- Max mana
function memory.Max_Mana()
    return readmem(memory.Mana()  + 0x2B4, "d") + memory.Mana_Buff()
end

--ManaPercent
function memory.Mana_Percent()
   return  ((memory.Current_Mana()/ memory.Max_Mana())*100)
end
--HPPercent
function memory.HP_Percent()
   return  ((memory.get_current_HP()/ memory.TOTAL_CHAR_MAX_HP())*100)
end

function memory.getConfirmBox()
    return readmem(CLIENT + 0xEC2DA4, "d")
end
function memory.deadbox()
    local dead_box = readmem(CLIENT + 0xC2E894, "d")
    if dead_box > 1 then
        return 0
    end
    if dead_box <= 1 then
        return 1
    end
end
function memory.dead()
   if memory.get_current_HP() < 1 and memory.Battle_Status() == 0 and memory.deadbox() == 1 then
       return 1
   else
       return 0
   end
end
function memory.Dialogue()
    local dialogOffsets = {0x70, 0x56C, 0xC, 0x4, 0x1F4, 0x54 , 0x720}
    local DIALOG_POINTER = readmem(CLIENT + 0x00D6FCC0, "d")
    for i = 1, #dialogOffsets
    do
        DIALOG_POINTER = readmem(DIALOG_POINTER + dialogOffsets[i], "d")
    end
    if DIALOG_POINTER == 16775 then
        return 1
    else
        if DIALOG_POINTER == 16774 then
            return 0
        else
            return 2
        end
    end
end
function memory.SellDialogue()
    local dialogOffsets = {0x18, 0x324, 0xC, 0x450, 0x47C, 0x1F8 , 0x240}
    local DIALOG_POINTER = readmem(CLIENT + 0x00EC2D28, "d")
    for i = 1, #dialogOffsets
    do
        DIALOG_POINTER = readmem(DIALOG_POINTER + dialogOffsets[i], "d")
    end
    if DIALOG_POINTER == 16775 then
        return 1
    else
        if DIALOG_POINTER == 16774 then
            return 0
        else
            return 2
        end
    end
end

function memory.friendlist()
    local friendListOffsets = {0x18, 0x744, 0x4, 0xC, 0x4150}
    local FRIEND_LIST_POINTER = readmem(0x012C2D28, "d")
    for i = 1, #friendListOffsets
    do
        FRIEND_LIST_POINTER = 
            readmem(FRIEND_LIST_POINTER + friendListOffsets[i], "d")
    end
    if FRIEND_LIST_POINTER == 16775 then
            return 1
        else
            if FRIEND_LIST_POINTER == 16774 then
                    return 0
            else
                    return 2
            end
        end
end
function memory.Surroundings()
    local dialogOffsets = {0x18, 0x61C, 0x0, 0xC, 0x4A8, 0x80 , 0xBD0}
    local DIALOG_POINTER = readmem(CLIENT + 0x00EC2D28, "d")
    for i = 1, #dialogOffsets
    do
        DIALOG_POINTER = readmem(DIALOG_POINTER + dialogOffsets[i], "d")
    end
    if DIALOG_POINTER == 16775 then
        return 1
    else
        if DIALOG_POINTER == 16774 then
            return 0
        else
            return 2
        end
    end
end
return memory