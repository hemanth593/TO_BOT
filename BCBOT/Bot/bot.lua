--[[ Reading game memory --]]

local bot = {}
local image = require("Bot/image")
local memory = require("Bot/memory")
local cords = require("Bot/cords")
local cred = require("Bot/cred")
local CLIENT = 0x00400000
local kill = 0

function bot.sendWithDelay(str)
    for i = 1, #str do
        local char = str:sub(i, i)
        if char:match("[A-Z]") then
            -- Character is uppercase
            send217(char)
        elseif char:match("[a-z]") then
            -- Character is lowercase
            send(char)
        elseif tonumber(char) then
            -- Character is a number
            send(char)
        else
            -- Character is neither uppercase, lowercase, nor a number
            -- Handle as needed
        end
        wait(100)
    end
end

function bot.execgame()
    exec(gamePath)
    bot.windowname()
    for i = 1, 20 do
        
        local TO = findwindow("Game") -- find the client window
        if TO then -- if found
            workwindow (TO[1][1]) -- make it a work window
        end
        bot.windowname1()
        wait(100)
    end
    for i = 1, 10 do
        wait("1s")
        bot.windowname1()
    end
    --local TO = findwindow("Talisman Online") -- find the client window
    wait(1000)
    left(557, 396)
    wait(1000)
    sendex ()
    send("HOME")
    wait(500)
    send_down ("DELETE", 5000)
    wait(500)
    bot.sendWithDelay(cred[CHAR_NAME].username)
    --send(cred[CHAR_NAME].username)
    wait(200)
    send("TAB")
    wait(200)
    send_down ("DELETE", 2000)
    wait(200)
    bot.sendWithDelay(cred[CHAR_NAME].password)
    --send(cred[CHAR_NAME].password)
    wait(500)
    left(514, 497 )
    wait("5s")
    left(bot.server[Game_Server])
    image.clickimage("EntergameOK.bmp")
    wait(3000)
    image.clickimage("Entergame.bmp")
    wait(2000)
    bot.windowname()
 
    wait(6000)
end

bot.server = {
BI = "396, 250",
EE = "347, 288",
DG = "354, 266",
WW = "347, 288",
GSM = "357, 309",
TF = "361, 323",
AS = "341, 347",
LiD = "344, 367"
}


function bot.verifystonecharm()
    local verifycharm = image.find_image("stonecitycharmzero.bmp")
    if verifycharm == 1 then
        log("StoneCityCharm Unavailable")
        bot.BuyStoneCityCharm()
        bot.GotoStoneCity()
    end
    if verifycharm == 0 then
        log("StoneCityCharm Available")
    end
    if verifycharm == 2 then
        log("Window Not Selected")
    end     
end
function bot.GotoStoneCity()
    if memory.mount_status() == 1 then
        wait(300)
        send(mountkey)
        wait("2s")
        log("Mount Down to go to StoneCity")
        end
     bot.attack(attackskills)
     bot.autobuff()
        --while not (memory.getLocation() == "Stone City" and memory.getLocation_cords(0) == "178" and memory.getLocation_cords(1) == "-515") do
    if bot.StoneCity() == 0 then
            wait(300)
        send(stonecitycharm)
            wait(5000)
    end
end

function bot.attack(attackskills)
    if memory.mount_status() == 1 then
        wait(300)
        send(mountkey)
        wait("2s")
        end
    while memory.Battle_Status() == 1 do
        send("Tab")
        wait(100)
        send(attackskills)
    end
    wait("2s")
end
function bot.VastMountain()
        if memory.getLocation() == "White Bear Village" and memory.getLocation_cords(0) == "847" and memory.getLocation_cords(1) == "-606"  then
            return 1
        else
            return 0
        end
end
function bot.Ghostdinwoods()
        if memory.getLocation() == "Ghost Din Woods" and memory.getLocation_cords(0) == "1372" and memory.getLocation_cords(1) == "-417"  then
            return 1
        else
            return 0
        end
end

bot.potskey = {
    hp = 6, mana = 7
}

function bot.Healthcheck()
    wait(300)
    send("F1")
    wait(300)
    while memory.CharHPpercent() < Health_Check do
        bot.unmount()
        if Fairy == "YES" then 
            wait(300)
            send(healskill)
            log("Waiting to heal till 100% and  Current HP in %  :", memory.CharHPpercent())
            wait(300)
        else
        
            wait(300)
            
            send(bot.potskey.hp) 
            wait(1000)
            --log(healskill)
            send(healskill) 
            wait(1000)
            log("Waiting to heal till 100% and not fairy Current HP in %  :", memory.CharHPpercent())
            wait("16s")
            
        end
    end
    log("health is full" )
    bot.mount()
end

function bot.Leaveteam()
        wait("1s")
    right (39, 41 )
        wait("1s")
    left (96, 91 )
        wait("1s")
end
function bot.StoneCity()
        if memory.getLocation() == "Stone City" and memory.getLocation_cords(0) == "178" and memory.getLocation_cords(1) == "-515"  then
            return 1
        else
            return 0
        end
end
function bot.Invisiblemode()
    log("Initiating Invisible Mode")
    bot.Invisiblemode2()
    bot.Invisiblemode2()
    log("Finished setting Invisible Mode")
    bot.Zoomout()
    bot.verifypet()
end
function bot.Invisiblemode2()
    
    bot.Viewreset()
    wait("300")
    log("hello")
    send_down ("F12", 3000)
    send_down ("@", 3000)
    --wait(1000)
    send_up("@")
    send_up("F12")

end
function bot.hide()
    log("Invisible Mode ON")
    while true do
        send_down("F12") return
    end
end
function bot.unHide()
    log("Invisible Mode OFF")
    send_up("F12") 
end
function bot.Zoomout()
    wait(3000)
    log("ZoomingOut...")
    for i = 1, 8 do
        send_down ("{down}", 3000)
        send_up("{down}")
    end
    wait(300)
        --send ("@")
    wait(300)
    log("Maximum Zoom out is set")
end

function bot.Recorrection()
    bot.Viewreset()
    log("recorrecting zoom")
    --send_down ("{down}", 3000)
    --send_up("{down}")
    --wait(1000)
    for i = 1, 8 do
        send_down ("{down}", 3000)
        send_up("{down}")
    end
       wait(1000)
end
function bot.autobuff()
    wait(300)
    send("F1")
    wait(300)
    send(buff1)
    wait(1000)
    send(buff2)
    wait(1000)
end


function bot.Addteam()
         wait("1s")
         left(745, 745)
         wait("1s")
     bot.Viewreset()     
    if ADDTEAM == "FOE" then
        wait("1s")
        left(626, 187 ) -- Foe list
            wait("1s")
        right(585, 273 )-- Foe list
            wait("2s")
        left(597, 344 )-- Foe list
            wait("1s")
        if startreseterscritpt then
             start_script (startreseterscritpt)
        end
        log("Initiated Reseter Script")
            wait("1s")
            if image.find_image_center("foelist.bmp") == 1 then
                left(745, 745)
                wait("1s")
        end     
    end
    if ADDTEAM == "BLOCK" then
                wait("1s")
            left(700, 189 )--blocklist
            wait("1s")
            right(577, 253 )--blocklist
            wait("2s")
            left(619, 324 )--blocklist
            wait("1s")
        if startreseterscritpt then
             start_script (startreseterscritpt)
        end
        log("Initiated Reseter Script")
            wait("1s")
        if image.find_image_center("blocklist.bmp") == 1 then
                left(745, 745)
                wait("3s")
        end     
    end
end


function bot.verifypet()
    log("Verifying Pet Status ....")
    if memory.get_pet_status() == 0 then
        log("Opening Pet")
        wait(1000)
        send(pet)
        wait(3000)
        log("Pet Opened")
    else
        log("Pet Alive")
    end
end
function bot.verifyclient()
    bot.windowname()
    local TO = findwindow(CHAR_NAME) -- find the notepad window
    if TO then -- if found
        workwindow (TO[1][1]) -- make it a work window
    else
        bot.execgame()
    end
    bot.verifypet()
end




function bot.windowname1()
        setwindowtext(workwindow(), CHAR_NAME)
end

function bot.windowname()
    local TO = findwindow("Talisman Online")
    if TO then
        for i = 1, #TO
        do
                workwindow(TO[i][1])
                local name = memory.charName()
                log(memory.charName())
                setwindowtext(TO[i][1], name)
        end
    end
end
function bot.mount()
    if memory.mount_status() == 0 then
        send(mountkey)
        --if memory.mount_status() >= 0 then
            log("Mount up")
        --end
        wait("5s")
        end
end
function bot.unmount()
    if memory.mount_status() > 0 then
        wait(400)
        --send(mountkey)
        wait("1s")
        send(mountkey)
        wait("1s")
        if memory.mount_status() == 0 then
            log("Mount Down")
        else
            log("Another Attempt to Mount Down")
            bot.unmount()
        end     
        end
end

function bot.Viewreset()
    wait(300)
    left (cords.resetView[1],cords.resetView[2])     --view reset
    wait(700)
end
function bot.clearscreen()
    if image.find_image_center("dialogue.bmp") == 1 or image.find_image_center("foelist.bmp") == 1 or image.find_image_center("system.bmp") == 1 or  image.find_image_center("friendlist.bmp") == 1 or image.find_image_center("blocklist.bmp") == 1 or image.find_image_center("surroundings.bmp") == 1 or image.find_image("item.bmp") == 1 or image.find_image_center("buy.bmp") == 1 then
        send("ESCAPE")
        wait("1s")
        log("Cleared Screen")
    else
            log("Screen Clear")
            wait("1s")
    end
end

function bot.BuyStoneCityCharm()
    bot.Viewreset()
    image.surrounding("Rich")
    log("Moving to Richman to Buy Stonecitycharm")
    wait("20s")
    wait(300)
    local m = 0
    repeat
        m = m + 1
        while image.find_image_center("richman.bmp") == 0 do
            wait(50)
                    right(473, 392)
            wait(50)
            end
            wait(2000)
        if image.find_image_center("richman.bmp") == 1 then
            wait(50)
                left(315, 398) --purchase
            wait(50)
        end
            wait(1000)
        if image.find_image_center("buy.bmp") == 1 then
                local o = 0
                repeat -- 24
                        o = o + 1
                        wait(100)
                        left(202, 330)
                until o == 24
                wait(500)
                left(180, 713)
                wait(500)
        end
    until m == 10
    bot.clearscreen()
end






function bot.surrounding(name)
    while image.find_image_center("surroundings.bmp") == 0 do
        left(cords.surroundings.location[1],cords.surroundings.location[2])
        wait(500)
    end
    if  image.find_image_center("surroundings.bmp") == 1 then
        left(cords.surroundings.NPC[1],cords.surroundings.NPC[2])
        wait(40)
        left(cords.surroundings.Box[1],cords.surroundings.Box[2])
        send(name)
        wait(40)
        left(cords.surroundings.firstline[1],cords.surroundings.firstline[2])
        wait(200)
        left (cords.surroundings.close[1],cords.surroundings.close[2])
        wait(200)
    end
end

function bot.teamstatus()
    if image.find_image("monkteam.bmp") == 0 and image.find_image("tamerteam.bmp") == 0 and image.find_image("wizzMteam.bmp") == 0 and image.find_image("wizzFteam.bmp") == 0 and image.find_image("sinteam.bmp") == 0 and image.find_image("fairyteam.bmp") == 0 then
        return 0
    else
        return 1
    end
end
function bot.timerclock()
    return bot.calculate_time_difference(epoch1, os.time())
end
function bot.timerclock1(timername)
    return bot.calculate_time_difference1(timername)
end
function bot.convert_epoch_to_normal()
    epoch_time = os.time()
    return os.date("%Y-%m-%d %H:%M:%S", epoch)
end

function bot.calculate_time_difference(epoch1, epoch2)
    return epoch2 - epoch1
end
function bot.calculate_time_difference1(timername)
    return os.time() - timername
end

function bot.sscgivequest(image2,image3)
        while image.find_image(image3) == 0 do
            double_right(492, 420 )
        end
       if image.find_image(image2) == 1 then
           image.clickimage(image2)
           wait("2s")
           if image.find_image("quest.bmp") == 1 then
                image.clickimage("accomplish.bmp")
           end
           wait("1s")
       end
end

function bot.sscacceptquest(image3)
        while image.find_image(image3) == 0 do
            double_right(469, 426 )
        end
       if image.find_image(image3) == 1 then
           image.clickimage(image3)
           wait("2s")
           if bot.find_image("quest.bmp") == 1 then
            -- bot.clickimage("accomplish.bmp")
        left(304, 656)
           end
           wait("1s")
       end
end

return bot
