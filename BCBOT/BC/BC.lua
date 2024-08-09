--[[ Reading game memory --]]



local BC = {}
--local bot = require("Bot/bot")
local cred = require("Bot/cred")
local memory = require("Bot/memory")
local image = require("Bot/image")
local cords = require("Bot/cords")
local bot = require("Bot/bot")
local travel = require("Bot/travel")

--local cave = require("BC/InsideBC")

local getX = memory.getX
local getY = memory.getY
--local cave = require("BC/InsideBC")

--times
MS = 200
M = 500
S = 1000
SS = 2000
SSS = 3000

local path = {
    {xY = {}, via = {}},
	{xY = {}, via = {}}	
}

local gettotarget = {
        --{xY = {1411,353}, via = {0, 0}},
      --  {xY = {1410,342}, via = {918, 133}},
        {xY = {1411,330}, via = {920, 135}},
}
function BC.gettotargetspot()
	log("relocating")
	BC.travelPath(gettotarget)
end

local movetoboss1 = {
	{xY = {187, -405}, via = {0, 0}},
{xY = {185, -406}, via = {915, 116}},
{xY = {149, -406}, via = {861, 115}},
{xY = {113, -406}, via = {861, 115}},
{xY = {77, -406}, via = {861, 115}},
{xY = {77, -420}, via = {919, 138}},
{xY = {60, -401}, via = {891, 84}},
{xY = {83, -396}, via = {956, 107}},
{xY = {70, -402}, via = {897, 125}}
}

local movetoaltar2 = {
		{xY = {380, 73}, via = {886, 127}},
		{xY = {353, 103}, via = {901, 117}},
		{xY = {334, 136}, via = {909, 114}},
		{xY = {335, 155}, via = {928, 128}},
		{xY = {315, 170}, via = {908, 132}},
		{xY = {286, 172}, via = {899, 144}},
		{xY = {267, 156}, via = {909, 161}},
		{xY = {225, 163}, via = {887, 139}},
		{xY = {194, 163}, via = {897, 146}},
		{xY = {154, 165}, via = {889, 144}},
		{xY = {129, 140}, via = {903, 170}},
        {xY = {110, 119}, via = {901, 135}},
		{xY = {108, 116}, via = {907, 169}},
		{xY = {102, 85}, via = {921, 176}},
		{xY = {82, 64}, via = {908, 166}},
		{xY = {102, 24}, via = {946, 184}},
		{xY = {129, 1}, via = {953, 168}},
		{xY = {114, -32}, via = {913, 179}},
		{xY = {147, -62}, via = {959, 175}},
		{xY = {177, -98}, via = {956, 181}},
		{xY = {222, -94}, via = {970, 142}},
		{xY = {232, -62}, via = {937, 115}},
		{xY = {253, -43}, via = {947, 128}},
		{xY = {282, -79}, via = {955, 181}},
		{xY = {303, -82}, via = {947, 149}},
		{xY = {337, -47}, via = {960, 112}},
		{xY = {350, 3}, via = {939, 97}},
		{xY = {322, 42}, via = {900, 109}},
		{xY = {287, 50}, via = {893, 138}},
		{xY = {258, 48}, via = {899, 148}},
		{xY = {260, 80}, via = {926, 120}},
		{xY = {238, 79}, via = {909, 142}},
		{xY = {190, 78}, via = {881, 147}},
	        {xY = {190, 46}, via = {918, 170}},
	        {xY = {205, 45}, via = {943, 116}},
	        {xY = {204, 23}, via = {918, 151}},
	        {xY = {235, 23}, via = {970, 115}},
	        {xY = {246, 42}, via = {937, 84}},
	        {xY = {223, 44}, via = {881, 111}}
	       
}




function BC.dead()
	local name = memory.charName()
	local CHARDEAD = "b"
	local hp = memory.get_current_HP()
	if hp < 1 then
	wait(S) 
	log(name.." is Dead!")
	wait(S)
	if CHARDEAD ~= nil then
		for i = 1, #CHARDEAD
		do
		log("Trying to use Jackstraw")
		left(cords.revive.jackstrawok[1], cords.revive.jackstrawok[2]) wait("3s")
		end
		end
        local hpn = memory.get_current_HP()
		if hpn < 1 then
			log("Jackstraw not found, Reviving normal...")
            left(cords.revive.okbutton[1], cords.revive.okbutton[2]) wait("3s")
            end
        log(name.." is Live Again !")
		BC.start()
	end
end

function BC.travelPath(path)
    for i, step in ipairs(path) do
        local xY = step.xY
        local via = step.via

        local travelX = memory.getX()
        local travelY = memory.getY()

        if travelX ~= xY[1] or travelY ~= xY[2] then
            local attempt = 1
            local maxAttempts = 10
            local stepSize = 1
            local direction = 1 
            
            while attempt <= maxAttempts do
                local adjustedVia = {via[1] + (direction * stepSize), via[2]}
                travel.miniMap(xY, adjustedVia)
                if memory.getX() == xY[1] and memory.getY() == xY[2] then
                    break 
                else
                    direction = -direction
                    attempt = attempt + 1
                end
            end
            local newTravelX = memory.getX()
            local newTravelY = memory.getY()
        else
            travel.miniMap(xY)
        end
    end
end


function BC.MovingtoAltar()
	log("Going to Altar")	
	BC.travelPath(movetoaltar2)
end

function BC.MovingtoBoss()
	log("Going to Boss BSM ")	
	BC.travelPath(movetoboss1)
end


function BC.MovingtoAltar1()
	local coordinatesToCheck = {
		{ "423", "53", 0, 0 },
		{ "397", "76", 876, 78 },
	        { "369", "78", 873, 111 },
	        { "357", "107", 899, 68 },
	        { "333", "133", 880, 73 },
	        { "326", "164", 908, 64 },
	        { "302", "180", 880, 89 },
	        { "271", "168", 868, 134 },
	        { "237", "158", 864, 132 },
	        { "221", "163", 893, 107 },
	        { "184", "165", 859, 112 },
	        { "150", "163", 864, 118 },
	        { "125", "145", 879, 145 },
	        { "108", "120", 891, 156 },
	        { "107", "95", 917, 156 },
	        { "86", "67", 885, 161 },
	        { "82", "37", 912, 164 },
	        { "109", "20", 963, 142 },
	        { "125", "-2", 945, 152 },
	        { "119", "-35", 909, 169 },
	        { "142", "-52", 957, 143 },
	        { "155", "-66", 940, 138 },
	        { "168", "-91", 941, 155 },
	        { "191", "-108", 956, 143 },
	        { "222", "-97", 970, 97 },
	        { "235", "-65", 941, 63 },
	        { "229", "-47", 909, 85 },
	        { "263", "-45", 974, 112 },
	        { "274", "-71", 937, 158 },
	        { "297", "-84", 957, 136 },
	        { "322", "-64", 960, 83 },
	        { "340", "-39", 949, 75 },
	        { "350", "-5", 935, 59 },
	        { "342", "27", 906, 61 },
	        { "316", "50", 877, 77 },
	        { "280", "48", 861, 118 },
	        { "257", "49", 882, 113 },
	        { "258", "78", 920, 68 },
	        { "221", "79", 859, 113 },
	        { "191", "80", 870, 114 },
	        { "190", "46", 918, 170 },
	        { "205", "45", 943, 116 },
	        { "204", "23", 918, 151 },
	        { "235", "23", 970, 115 },
	        { "246", "42", 937, 84 },
	        { "223", "44", 881, 111 }
	}
	
	if not ( memory.getLocation_cords(0) == "423" and memory.getLocation_cords(1) == "53" ) then
		log("Restarting Script")
		BC.attack(attackskills)
		BC.start()
		log("test1")
	end
	wait(300)
	send(windcontrolling)
	wait(300)
	    for i, coords in ipairs(coordinatesToCheck) do
	        local nextCoords = coordinatesToCheck[i % #coordinatesToCheck + 1]
		local resetclock = os.time()
	        while not (memory.getLocation_cords(0) == nextCoords[1] and memory.getLocation_cords(1) == nextCoords[2])  do
			if ( bot.calculate_time_difference(resetclock, os.time()) <= 20 ) then
	           		if memory.getLocation_cords(0) == coords[1] and memory.getLocation_cords(1) == coords[2] then
	                		wait(100)
	                		right(nextCoords[3], nextCoords[4])
					--log(coords[1],coords[2],coords[3],coords[4])
					--log(nextCoords[1],nextCoords[2])
	                		wait(100)
	                		break
	            		end
			else
				if memory.mount_status() == 1 then
					send(mountkey)
					log("Mount Down to restart script")
					wait("2s")
    				end
				BC.attack(attackskills)
				BC.start()
				log("test2")
				break
			end
	        end
	    end
end

function BC.MovingtoBoss1()
	if  memory.getLocation() == "Secret Cemetery" then
	   local coordinatesToCheck1 = {
		{ "187", "-405", 0, 0 },
		{ "185", "-406", 915, 116 },
	        { "149", "-406", 861, 115 },
	        { "113", "-406", 861, 115 },
	        { "77", "-406", 861, 115 },
	        { "77", "-420", 919, 138 },
	        { "60", "-401", 891, 84 },
	        { "83", "-396", 956, 107 },
	        { "70", "-402", 897, 125 }
	}
	
	for i, coords in ipairs(coordinatesToCheck1) do
	        local nextCoords = coordinatesToCheck1[i % #coordinatesToCheck1 + 1]
		local resetclock = os.time()
	        while not (memory.getLocation_cords(0) == nextCoords[1] and memory.getLocation_cords(1) == nextCoords[2])  do
			if ( bot.calculate_time_difference(resetclock, os.time()) <= 20 ) then
	           		if memory.getLocation_cords(0) == coords[1] and memory.getLocation_cords(1) == coords[2] then
	                		wait(100)
	                		right(nextCoords[3], nextCoords[4])
					--log(coords[1],coords[2],coords[3],coords[4])
					--log(nextCoords[1],nextCoords[2])
	                		wait(100)
	                		break
	            		end
			else
				if memory.mount_status() == 1 then
					send(mountkey)
					log("Mount Down to restart script")
					wait("2s")
    				end
				BC.attack(attackskills)
				wait("5s")
				BC.attackBlazeSkullMarshal()
				bot.GotoStoneCity()
				BC.start()
				log("test3")
				break
			end
	        end
	    end
	else
		
	end
end	


function convert_epoch_to_normal()
	epoch_time = os.time()
	return os.date("%Y-%m-%d %H:%M:%S", epoch)
end

function calculate_time_difference(epoch1, epoch2)
	return epoch2 - epoch1
end
function convertSecondsToTime(seconds)
	local hours = math.floor(seconds/3600)
    	local minutes = math.floor((seconds % 3600) / 60)
    	local remainingseconds = seconds % 60 
    	log ("Time Take to complete this BC run in minutes :",hours,"h",minutes,"m",remainingseconds,"s")
end




function BC.attack(attackskills)
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

function BC.attackBlazeSkullMarshal()
    log("Inside the loop attackBlazeSkullMarshal")
    if Fairy == "NO" then 
        bot.unmount()
        clock1= os.time()
        while memory.Battle_Status() == 1 do
            --log("Inside the loop attackBlazeSkullMarshal : while ")
            while not (bot.calculate_time_difference(clock1, os.time()) >= 20) do
                    --log(BC.calculate_time_difference(clock1, os.time()))
                        wait(100)
                        send(aoe)
                        wait(100)
                    send("Tab")
                    wait(100)
                end
                if memory.targetHPpercent() > 0 then
                --log("Inside the loop attackBlazeSkullMarshal : if ")
                clock10= os.time()
                while memory.targetHPpercent() > 0 and bot.calculate_time_difference(clock10, os.time()) <= 20 do
                    --log("Inside the loop attackBlazeSkullMarshal : if/while ")
                        wait(30)
                            send(attackskills)
                            wait(30)
                end
                        wait(30)
                    send("Tab")
                        wait(30)
                else
                --log("Inside the loop attackBlazeSkullMarshal : if/else")
                        wait(30)
                    send("Tab")
                        wait(30)
                end
            end
    else
        bot.unmount()
        clock1= os.time()
        while memory.Battle_Status() == 1 do
            while not (bot.calculate_time_difference(clock1, os.time()) >= 20) do
                    --log(BC.calculate_time_difference(clock1, os.time()))
                        wait(100)
                        send(aoe)
                        wait(100)
                    send("Tab")
                    wait(100)
                end
            if memory.CharHPpercent() > 35 then
                    if memory.targetHPpercent() > 0 then
                        wait(100)
                            send(attackskills)
                            wait(100)
                    else
                            wait(100)
                        send("Tab")
                            wait(100)
                    end
            else
                wait(100)
                send("F1")
                wait(100)
                while memory.CharHPpercent() < 95 do 
                    wait(100)
                    send(healskill)
                    wait(100)
                end
                        wait(100)
                    send("Tab")
                        wait(100)
            end
            end
    end
    
end

function BC.TeleporttoBoss()
	log("Inside Tele Loop")
	--log("Moving to Boss")
	--wait("3s")
	local resetclock = os.time()
	if memory.getLocation() == "Secret Altar" then
		if (not (memory.getLocation() == "Secret Cemetery")) then
			log("AT Secret Altar Tele")
			while memory.getLocation_cords(0) == "223" and memory.getLocation_cords(1) == "44" and bot.calculate_time_difference(resetclock, os.time()) <= 20 do
				bot.Viewreset()
	    			while image.find_image_center("altarstonedialogue.bmp") == 0 and bot.calculate_time_difference(resetclock, os.time()) <= 20 do
					if image.find_image_center("altarstonedialogue.bmp") == 0 then
	        				--wait(100)
						right(104, 144)
	        				wait(100)
					end
					if image.find_image_center("altarstonedialogue.bmp") == 0 then
	        				right(155, 104 )
	        				wait(100)
					end
					if image.find_image_center("altarstonedialogue.bmp") == 0 then
	       	 				right(156, 116 )
	        				wait(100)
					end					
	    			end
	    			if image.find_image_center("altarstonedialogue.bmp") == 1 and bot.calculate_time_difference(resetclock, os.time()) <= 20 then
	        			--wait(100)
	        			left(299, 330 )
	        			wait(100)
	    			end
	    			wait("3s")
	    			bot.Viewreset()
	    			wait(100)
			end
			if bot.calculate_time_difference(resetclock, os.time()) > 20 then
				BC.attackBlazeSkullMarshal()
				bot.Recorrection()
				BC.start()
				log("test101")	
			end
		else
			BC.attackBlazeSkullMarshal()
			bot.Recorrection()
			BC.start()
			log("test102")
		end	
	else
			BC.attackBlazeSkullMarshal()
			bot.Recorrection()
			BC.start()
			log("test103")
	end
end
function BC.verifylocationInsideBC()
	if memory.getLocation_cords(0) == "423" and memory.getLocation_cords(1) == "53" then
		log("Moving to Altar")
	else
		BC.attackBlazeSkullMarshal()
		BC.start()
		log("test5")
	end		
end
function BC.InsideBC()
	if memory.get_current_HP() <= 28000 or WeakChar == "YES" then
		bot.Healthcheck()
	end
	wait(500)
	bot.Leaveteam()
	bot.unHide()
	wait("2s")
	BC.verifylocationInsideBC()
	bot.mount()
	BC.MovingtoAltar1()
	log("finished Reaching Altar and ready for teleport")
	wait(300)
	BC.TeleporttoBoss()
	wait("1s")
	if memory.HP_Percent() <= 85 or WeakChar == "YES" then 
		bot.Healthcheck()
	end
	wait("1s")
	BC.MovingtoBoss1()  
	send(mountkey) -- extra safety to mound down
	BC.attackBlazeSkullMarshal1()
	BC.attackBlazeSkullMarshal1()
    	wait("5s")
    	BC.attackBlazeSkullMarshal1()
    	log("Finished Killing Boss")
  	image.findcourage()
    	epoch2 = os.time()
	log("Ended BC Time :", bot.convert_epoch_to_normal() )
	log(BC.convertSecondsToTime(bot.calculate_time_difference(epoch1, epoch2))) 
	wait(300)
--	bot.clearscreen()
	send(stonecitycharm)
        wait(5000) 
	log("Ended")
end



function BC.convertSecondsToTime(seconds)
	local hours = math.floor(seconds/3600)
	local minutes = math.floor((seconds % 3600) / 60)
    	local remainingseconds = seconds % 60 
    	log ("Time Taken to complete this BC run :",hours,"h",minutes,"m",remainingseconds,"s")
	wait(300)
end
function BC.attackBlazeSkullMarshal()
	log("Inside the loop attackBlazeSkullMarshal")
	if Fairy == "NO" then 
		bot.unmount()
		clock1= os.time()
		while memory.Battle_Status() == 1 do
			--log("Inside the loop attackBlazeSkullMarshal : while ")
			while not (bot.calculate_time_difference(clock1, os.time()) >= 20) do
	    			--log(bot.calculate_time_difference(clock1, os.time()))
            			wait(100)
            			send(aoe)
            			wait(100)
	    			send("Tab")
	    			wait(100)
        		end
        		if memory.targetHPpercent() > 0 then
				--log("Inside the loop attackBlazeSkullMarshal : if ")
				clock10= os.time()
				while memory.targetHPpercent() > 0 and bot.calculate_time_difference(clock10, os.time()) <= 20 do
					--log("Inside the loop attackBlazeSkullMarshal : if/while ")
           		 		wait(30)
            				send(attackskills)
            				wait(30)
				end
            			wait(30)
        			send("Tab")
            			wait(30)
        		else
				--log("Inside the loop attackBlazeSkullMarshal : if/else")
            			wait(30)
        			send("Tab")
            			wait(30)
        		end
    		end
	log("end of IF Fairy == NO Loop")
	else
		bot.unmount()
		clock1= os.time()
		while memory.Battle_Status() == 1 do
			while not (bot.calculate_time_difference(clock1, os.time()) >= 20) do
	    			--log(bot.calculate_time_difference(clock1, os.time()))
            			wait(100)
            			send(aoe)
            			wait(100)
	    			send("Tab")
	    			wait(100)
        		end
			if memory.CharHPpercent() > 35 then
        			if memory.targetHPpercent() > 0 then
           				wait(100)
            				send(attackskills)
            				wait(100)
        			else
            				wait(100)
        				send("Tab")
            				wait(100)
        			end
			else
				wait(100)
				send("F1")
				wait(100)
				while memory.CharHPpercent() < 95 do 
					wait(100)
					send(healskill)
					wait(100)
				end
            			wait(100)
        			send("Tab")
            			wait(100)
			end
    		end
	end
	
end
function BC.attackBlazeSkullMarshal1()
	log("Inside the loop attackBlazeSkullMarshal 1")
	if Fairy == "NO" then 
		bot.unmount()
		clock1= os.time()
		while memory.Battle_Status() == 1 do
			--log("Inside the loop attackBlazeSkullMarshal 1 : while ")
			while not (bot.calculate_time_difference(clock1, os.time()) >= 20) do
	    			--log(bot.calculate_time_difference(clock1, os.time()))
            			wait(100)
            			send(aoe)
            			wait(100)
	    			send("Tab")
	    			wait(100)
        		end
        		if memory.targetHPpercent() > 0 or image.find_image_target("BSM.bmp") == 1 then
				--log("Inside the loop attackBlazeSkullMarshal : if ")
				clock10= os.time()
				while ( memory.targetHPpercent() > 0 or image.find_image_target("BSM.bmp") == 1 ) and bot.calculate_time_difference(clock10, os.time()) <= 20 do
					--log("Inside the loop attackBlazeSkullMarshal : if/while ")
           		 		wait(30)
            				send(attackskills)
            				wait(30)
				end
            			wait(30)
        			send("Tab")
            			wait(30)
        		else
				--log("Inside the loop attackBlazeSkullMarshal : if/else")
            			wait(30)
        			send("Tab")
            			wait(30)
        		end
    		end
	--log("end of IF Fairy == NO Loop")
	else
		bot.unmount()
		clock1= os.time()
		while memory.Battle_Status() == 1 do
			while not (bot.calculate_time_difference(clock1, os.time()) >= 20) do
	    			--log(bot.calculate_time_difference(clock1, os.time()))
            			wait(100)
            			send(aoe)
            			wait(100)
	    			send("Tab")
	    			wait(100)
        		end
			if memory.CharHPpercent() > 35 then
        			if memory.targetHPpercent() > 0 then
           				wait(100)
            				send(attackskills)
            				wait(100)
        			else
            				wait(100)
        				send("Tab")
            				wait(100)
        			end
			else
				wait(100)
				send("F1")
				wait(100)
				while memory.CharHPpercent() < 95 do 
					wait(100)
					send(healskill)
					wait(100)
				end
            			wait(100)
        			send("Tab")
            			wait(100)
			end
    		end
	end
	
end

function BC.MovingfromStonecity()
	while bot.StoneCity() == 1 and (bot.timerclock1(epoch1) <= resettime) do
		log("In StoneCity")
		bot.Viewreset()
		bot.clearscreen()
		while image.find_image("transportfaydialogue.bmp") == 0 and (bot.timerclock1(epoch1) <= resettime) do
        	 	wait(300)
			right(478, 508)
		 	wait(300)
			right(486, 457) 
  			wait(300)        
		end
		wait("1s")
		if image.find_image("transportfaydialogue.bmp") == 1 then
        		--wait(300)
		        left(477, 324 )
		 	wait(300)
		        left(277, 558 )
        		wait(300)
		end
		wait("3s")
		if image.find_image("transportfaydialogue.bmp") == 1 and (bot.timerclock1(epoch1) <= resettime) then 
			left(362, 655)
			wait("1s")
			BC.MovingfromStonecity()
		else
			log("Reached Vastmountain")
		end
	end
end
function BC.MovingfromVastmountain()
	while bot.VastMountain() == 1 and (bot.timerclock1(epoch1) <= resettime) do
		log("In VastMountain")
		wait(500)
		while ( image.find_image("sell.bmp") == 0 ) and ( bot.timerclock1(epoch1) <= resettime ) do
	        	while image.find_image("blacksmithdialogue.bmp") == 0 and (bot.timerclock1(epoch1) <= resettime) do
				right(277, 251 )
			end
			wait("1s")
			left(279, 394  )
			break
		end
   		wait("1s")
		while image.find_image("sell.bmp") == 1 and (bot.timerclock1(epoch1) <= resettime) do
			log("Selling Junk to clear space in inventory")
        		local q = 0
       	 		repeat
            			q = q + 1
      				wait(100)
            			left (450, 326 )
            			wait(100)
            			if memory.getConfirmBox() == 1 then
                		wait(100)
   	            		left (445, 325 )
                		wait(100)
   	        	end
        		until q == 7
        		wait("1s")
        		left (469, 713 )
        		wait("1s")
        		log("Sold Items..")
        		break
    		end
    		wait("1s")
    		while image.find_image("sell.bmp") == 1 and (bot.timerclock1(epoch1) <= resettime) do
        		wait("1s")
        		left (469, 713 )
        		wait("1s")
        		log("Sold Items")
    		end
		bot.mount()
        	while image.find_image("transportfaydialogue.bmp") == 0 and (bot.timerclock1(epoch1) <= resettime) do
                	wait(300)
                	right(471, 402 )
                	wait(300)
        	end
        	if image.find_image("transportfaydialogue.bmp") == 1 and (bot.timerclock1(epoch1) <= resettime) then
                	--log("Transport Dialogue" )
			--wait("1s")
            		left(282, 377 )
                	wait(1000)
                	--left(358, 655 )
                	--wait(300)
        	end
        	wait("2s")
        	if image.find_image("transportfaydialogue.bmp") == 1 and (bot.timerclock1(epoch1) <= resettime) then 
			left(362, 655)
			wait("1s")
			BC.MovingfromVastmountain()
		else
			log("Reached GhostDinWoods")
		end
	end
end
function BC.MovingfromGhostdinwoods()
	while bot.Ghostdinwoods() == 1 and (bot.timerclock1(epoch1) <= resettime) do
    		log("In GhostDinWoods")
		
		bot.clearscreen()
		wait("1s")
    	image.surrounding("kull")
    	wait("3s")
	end
	bot.clearscreen()
	wait(500)
	while not (( memory.getLocation_cords(0) == "1395" and memory.getLocation_cords(1) == "-635" ) or ( bot.timerclock1(epoch1) >= resettime)) do
    		wait("1s")
	end
	    		
	while (memory.getLocation_cords(0) == "1395" and memory.getLocation_cords(1) == "-635") and (bot.timerclock1(epoch1) <= resettime) do
    		log("Entrance of Bewitcher Cave")
    		while image.find_image("skullherald.bmp") == 0  and (bot.timerclock1(epoch1) <= resettime) do
        		wait(100)
        		right(473, 420 )
        		wait(100)
    		end
    		wait(100)
		while image.find_image("skullherald.bmp") == 1  and (bot.timerclock1(epoch1) <= resettime) do
			while bot.teamstatus() == 0  do
				bot.Addteam()
			end
        		wait(100)
        		left(291, 363 )
    			wait("2s")
    		end

	end
end

function BC.convertsoulbell()
	bot.surrounding("Courage Merchant")
	local q1 = 0
	repeat
		q1 = q1 + 1		
		while not (( memory.getLocation_cords(0) == "229" and memory.getLocation_cords(1) == "-516" ) ) do
    			wait("1s")
		end
		if ( memory.getLocation_cords(0) == "229" and memory.getLocation_cords(1) == "-516" ) then
    			while image.find_image("couragemerchant.bmp") == 0 do
        			wait("500")
        			double_right(492, 420)
        			wait("500")
   			end
			if image.find_image("testquest.bmp") == 1 then
				wait("1s")
   				bot.sscgivequest("testquest.bmp","couragemerchant.bmp")
				wait("1s")
			else
   				while image.find_image("accept.bmp") == 0 do
        				if image.find_image("couragemerchant.bmp") == 1 then
                				wait(500)
                				left(352, 497 )
                				wait("1s")
        				end
   				end
   				image.clickimage("accept.bmp")
   				wait("1s")
   				image.clickimage("close.bmp")
   				wait("1s")
   				bot.sscgivequest("testquest.bmp","couragemerchant.bmp")
				wait("1s")
			end
		end
       	until q1 == 10	
end
function BC.convertherobadge()
	bot.surrounding("Courage")
	local q1 = 0
	repeat
		q1 = q1 + 1		
		while not (( memory.getLocation_cords(0) == "229" and memory.getLocation_cords(1) == "-509" ) ) do
    			wait("1s")
		end
		if ( memory.getLocation_cords(0) == "229" and memory.getLocation_cords(1) == "-509" ) then
    			while image.find_image("courageherald.bmp") == 0 do
        			wait("500")
        			double_right(492, 420)
        			wait("2500")
   			end
			if image.find_image("givequestherobadge.bmp") == 1 then
				wait("1s")
   				bot.sscgivequest("givequestherobadge.bmp","courageherald.bmp")
				wait("1s")
			else
   				while image.find_image("accept.bmp") == 0 do
        				if image.find_image("courageherald.bmp") == 1 then
                				wait(500)           
						left(336, 374 )
                				wait("1s")
        				end
   				end
   				image.clickimage("accept.bmp")
   				wait("1s")
   				image.clickimage("close.bmp")
   				wait("1s")
   				bot.sscgivequest("givequestherobadge.bmp","courageherald.bmp")
				wait("1s")
			end
		end
       	until q1 == 5	
end


function BC.verifycourage()
	if image.find_image("couragebadges.bmp") == 1 then 
		log("Courage Badges in inventory are more than 1000")
		if ( HeroBadge == "ON" and SoulBell == "ON" ) or ( HeroBadge == "OFF" and SoulBell == "OFF" ) then
			return 0
		end
		if ( SoulBell == "ON" and HeroBadge == "OFF" ) or ( SoulBell == "OFF" and HeroBadge == "ON" ) then
			return 1
		end
	else
		log("Courage Badges not exceeded in inventory")
		return 0
	end
end
function BC.outsideBC()
	bot.Viewreset()
	bot.GotoStoneCity()
	bot.hide()
	send(healskill)
	wait(500)
	bot.verifystonecharm()
	if  BC.verifycourage() == 1 then 
		if HeroBadge == "ON" then 
			log("Converting Courage to HeroBadge")
			BC.convertherobadge()
			bot.GotoStoneCity()
		end
		if SoulBell == "ON" then 
			log("Converting Courage to SoulBell")
			BC.convertsoulbell()
			bot.GotoStoneCity()
		end	
	end
	epoch1 = os.time()
	resettime = 300
	log("Started BC time :",bot.convert_epoch_to_normal())
	
	if bot.timerclock1(epoch1) <= resettime then
		BC.MovingfromStonecity()
	end
	if bot.timerclock1(epoch1) <= resettime then
		BC.MovingfromVastmountain()	
	end
	if bot.timerclock1(epoch1) <= resettime then
		BC.MovingfromGhostdinwoods()
	end
	wait("2s")
	if memory.getLocation() == "Bewitcher Cave" then
		log("Entered Cave")
	else
		log("Entering Cave failed so restarting...")
		BC.attackBlazeSkullMarshal()
		BC.start()
		log("test6")
	end
	if bot.timerclock1(epoch1) <= resettime then
		BC.InsideBC()
	else	
		BC.attackBlazeSkullMarshal()
		bot.GotoStoneCity()
		BC.start()
		log("test7")
	end
end

function BC.start()
    wait("1s")
    send(Petfood)
    wait("1s")
    starttime=os.time()
    while bot.timerclock1(starttime) < 3000 do
         BC.outsideBC()
    end
end
return BC