--[[ Reading game memory --]]

local image = {}
--local memory = require("Bot/memory")
local cords = require("Bot/cords")



function image.sendWithDelay(str)
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

function image.find_image(imagename)
    local handle = workwindow()
    --log(imagename)
    local startX, startY, endX, endY = 1, 1, 1024, 799 -- search coordinates
    --local path = [["stonecitycharmzero.bmp"]] -- path to the image
    --local path = [[image_name]] -- path to the image
    if handle then
            --log(workwindow())
            local arr, a = findimage (startX, startY, endX, endY, {imagename}, workwindow(), 90, -1, 5) -- image search
            hint (a) -- search result, hint in the lower right corner
            if arr then -- if found
                --log("Image found at coordinates X= " .. arr[1][1] .. " Y= " .. arr[1][2])
            return 1
                --right (arr[1][1], arr[1][2], handle) -- clicked, left does not work in all applications
                -- move (arr[1][1], arr[1][2], handle[1][1]) -- move the cursor over the image (uncomment the line for it to work)
            else
                --log("Image not found")
            return 0
            end
        else
            --log("Window not found")
        return 2
    end
end
function image.find_image_center(imagename)
    local handle = workwindow()
    --log(imagename)
    local startX, startY, endX, endY = 164, 7, 859, 329-- search coordinates
    --local path = [["stonecitycharmzero.bmp"]] -- path to the image
    --local path = [[image_name]] -- path to the image
    if handle then
            --log(workwindow())
            local arr, a = findimage (startX, startY, endX, endY, {imagename}, workwindow(), 90, -1, 5) -- image search
            hint (a) -- search result, hint in the lower right corner
            if arr then -- if found
                --log("Image found at coordinates X= " .. arr[1][1] .. " Y= " .. arr[1][2])
            return 1
                --right (arr[1][1], arr[1][2], handle) -- clicked, left does not work in all applications
                -- move (arr[1][1], arr[1][2], handle[1][1]) -- move the cursor over the image (uncomment the line for it to work)
            else
                --log("Image not found")
            return 0
            end
        else
            --log("Window not found")
        return 2
    end
end
function image.find_image_target(imagename)
    local handle = workwindow()
    --log(imagename)
    local startX, startY, endX, endY = 412, 5, 672, 110-- search coordinates
    --local path = [["stonecitycharmzero.bmp"]] -- path to the image
    --local path = [[image_name]] -- path to the image
    if handle then
            --log(workwindow())
            local arr, a = findimage (startX, startY, endX, endY, {imagename}, workwindow(), 90, -1, 5) -- image search
            hint (a) -- search result, hint in the lower right corner
            if arr then -- if found
                --log("Image found at coordinates X= " .. arr[1][1] .. " Y= " .. arr[1][2])
            return 1
                --right (arr[1][1], arr[1][2], handle) -- clicked, left does not work in all applications
                -- move (arr[1][1], arr[1][2], handle[1][1]) -- move the cursor over the image (uncomment the line for it to work)
            else
                --log("Image not found")
            return 0
            end
        else
            --log("Window not found")
        return 2
    end
end
function image.count_image(imagename4)
	local handle = workwindow()
	local startX, startY, endX, endY = 1, 1, 1024, 799 -- search coordinates
	if handle then
    		local arr, a = findimage (startX, startY, endX, endY, {imagename4}, workwindow(), 90, -1, 5) -- image search
	    	hint (a) -- search result, hint in the lower right corner
    		if arr then -- if found
	        	--log("Found :" .. #arr)
			return #arr
		--	for j=1, #arr do
         		--	left (arr[1][1] +18 , arr[1][2] + 7, handle) -- clicked, left does not work in all applications
			--	log(arr[1][1], arr[1][2], handle)
			--	wait(500)
        			-- move (arr[1][1], arr[1][2], handle[1][1]) -- move the cursor over the image (uncomment the line for it to work)
		--	end
		else
			return 0
    		end
		else
    		log("Window not found")
	end
end
function image.clickimage(imagename1)
	local handle = workwindow()
	local startX, startY, endX, endY = 1, 1, 1024, 799 -- search coordinates
	if handle then
    		local arr, a = findimage (startX, startY, endX, endY, {imagename1}, workwindow(), 90, -1, 5) -- image search
	    	hint (a) -- search result, hint in the lower right corner
    		if arr then -- if found
	        	--log("Found :" .. #arr)
		--	for j=1, #arr do
         			left (arr[1][1] +18 , arr[1][2] + 7, handle) -- clicked, left does not work in all applications
				log(arr[1][1], arr[1][2], handle)
				wait(500)
        			-- move (arr[1][1], arr[1][2], handle[1][1]) -- move the cursor over the image (uncomment the line for it to work)
		--	end
		
    		end
		else
    		log("Window not found")
	end
end
function image.surrounding(name)
    while image.find_image("surroundings.bmp") == 0 do
        left(cords.surroundings.location[1],cords.surroundings.location[2])
        wait(1000)
    end
    if  image.find_image_center("surroundings.bmp") == 1 then
        left(cords.surroundings.NPC[1],cords.surroundings.NPC[2])
        wait(500)
        left(cords.surroundings.Box[1],cords.surroundings.Box[2])
        wait(500)
        --send(name)
        log("Selecting Skull Herald NPC")
        image.sendWithDelay(name)
        wait(500)
        left(cords.surroundings.firstline[1],cords.surroundings.firstline[2])
        wait(500)
        left (cords.surroundings.close[1],cords.surroundings.close[2])
        wait(500)
    end
end
function image.sscgivequest(image2)
        while image.find_image("mysticbeliever.bmp") == 0 do
            double_right(469, 426 )
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
function image.sscacceptquest(image3)
        while image.find_image("mysticbeliever.bmp") == 0 do
            double_right(469, 426 )
        end
       if image.find_image(image3) == 1 then
           image.clickimage(image3)
           wait("2s")
           if image.find_image("quest.bmp") == 1 then
            -- image.clickimage("accomplish.bmp")
		left(304, 656)
           end
           wait("1s")
       end
end


function image.getimage(a, b, c, d, imagename)
	
	dircreate([[c:\images]])
    if imagename == nil then
        log("Error: imagename parameter is nil")
        return
    end

    log("Parameters received: " .. a .. ", " .. b .. ", " .. c .. ", " .. d .. ", " .. imagename)
    
    local address = getimage(a, b, c, d, workwindow()) -- save part of the screen area in memory
    local filepath = "C:\\images\\" .. imagename .. ".bmp" -- concatenate the imagename with the path and extension
    
    saveimage(address, filepath)
    log("Image taken and saved as: " .. filepath)
end
function image.findcourage()
    log("Opening Bag")
    send("i")
    wait(100)
    if image.find_image("item.bmp") == 1 then
        log("Opened Bag")
    else    
        wait(100)
        send("i")
        wait(100)
        log("Opened Bag")
    end
    wait("2s")
    --showwindow()
    log("Finding Courage")
    wait("2s")
    local handle = workwindow()
    local startX, startY, endX, endY = 1, 1, 1024, 799 -- search coordinates
    --local path = [["stonecitycharmzero.bmp"]] -- path to the image
    local path = [["Package.bmp"]] -- path to the image
    if handle then
            local arr, a = findimage (startX, startY, endX, endY, {path}, workwindow(), 90, -1, 5) -- image search
            hint (a) -- search result, hint in the lower right corner
            if arr then -- if found
                log("Package of Courage Badge Found :" .. #arr)
            for j=1, #arr do 
                    double_right (arr[j][1], arr[j][2], handle) -- clicked, left does not work in all applications
                wait(1000)
                    -- move (arr[1][1], arr[1][2], handle[1][1]) -- move the cursor over the image (uncomment the line for it to work)
            end
            else
                log("Package not found")
            end
        else
            log("Window not found")
    end
    wait(100)
    send("i")
    wait("1s")
    if image.find_image("item.bmp") == 1 then
        wait(100)
        send("i")
        wait(100)
        log("closedbag")
    else
        log("closedbag")
    end
    wait("2s")
end

function image.findwepimage()
    log("Opening Bag")
    send("i")
    wait(100)
    if image.find_image("item.bmp") == 1 then
        log("Opened Bag")
    else    
        wait(100)
        send("i")
        wait(100)
        log("Opened Bag")
    end
    wait("2s")
    send("7")
    wait("1s")
    --showwindow()
    log("Finding wepimage to convert crystals")
    wait("2s")
    local handle = workwindow()
    local startX, startY, endX, endY = 1, 1, 1024, 799 -- search coordinates
    --local path = [["stonecitycharmzero.bmp"]] -- path to the image
    local path = [["wep-xbow.bmp","wep-bow.bmp","wep-shovel.bmp","wep-staff.bmp","wep-dagg.bmp","wep-simi.bmp","wep-pearl.bmp","wep-wheel.bmp","wep-sword.bmp","wep-blade.bmp","wep-knee.bmp"]] -- path to the image
    if handle then
            local arr, a = findimage (startX, startY, endX, endY, {path}, workwindow(), 90, -1, 5) -- image search
            hint (a) -- search result, hint in the lower right corner
            if arr then -- if found
                log("Package of Courage Badge Found :" .. #arr)
            	for j=1, #arr do 
                    	left(arr[j][1], arr[j][2], handle) -- clicked, left does not work in all applications
                	wait(1000)
			image.clickimage("ok.bmp")
                    -- move (arr[1][1], arr[1][2], handle[1][1]) -- move the cursor over the image (uncomment the line for it to work)
            end
            else
                log("not found")
            end
        else
            log("Window not found")
    end
    wait(100)
    send("i")
    wait("1s")
    if image.find_image("item.bmp") == 1 then
        wait(100)
        send("i")
        wait(100)
        log("closedbag")
    else
        log("closedbag")
    end
    wait("2s")
end

function image.findcrystalimage()
    log("Opening Bag")
    send("i")
    wait(100)
    if image.find_image("item.bmp") == 1 then
        log("Opened Bag")
    else    
        wait(100)
        send("i")
        wait(100)
        log("Opened Bag")
    end
    wait("2s")
    --showwindow()
    log("Finding wepimage to convert crystals")
    wait("2s")
    local handle = workwindow()
    local startX, startY, endX, endY = 1, 1, 1024, 799 -- search coordinates

    -- Define the list of image paths starting with "wep-"
    local paths = {
        "GoldenCrystal2.bmp",
        "GoldenCrystal1.bmp",
        "GoldenCrystal.bmp"
    }
	
    if handle then
	for attempt = 1, 12 do
        local found = false
	log("Attempt " .. attempt)
        log(paths)
        for _, path in ipairs(paths) do
            local arr, a = findimage(startX, startY, endX, endY, {path}, workwindow(), 90, -1, 5) -- image search
            hint(a) -- search result, hint in the lower right corner
            if arr then -- if found
                log("Image found: " .. path .. " - Count: " .. #arr)
                for j = 1, #arr do 
		  --  send("7")
                    wait(500)
                    left(arr[j][1], arr[j][2], handle) -- clicked, left does not work in all applications
                    wait(500)
                    left(836,551) -- clicked, click on postal box to place an item 
                    wait(500)
			left(726,265) -- click on Receiver name 
			wait(500)
			image.sendWithDelay("TutuMihai")
			wait(500)
			left(730,290) -- click on Subject name
			wait(500)
			image.sendWithDelay("Trash Tutu")
			wait(500)
			left(704,612) -- click on send
			wait(500)  
                    image.clickimage("ok.bmp")
                    wait(500)
                end
                found = true
                break
            else
                log("Image not found: " .. path)
            end
        end
        if not found then
            log("No images found on attempt" .. attempt)
        end
	end
    else
        log("Window not found")
    end

    wait(100)
    send("i")
    wait("1s")
    if image.find_image("item.bmp") == 1 then
        wait(100)
        send("i")
        wait(100)
        log("closedbag")
    else
        log("closedbag")
    end
    wait("2s")
end


function image.findwepimage1()
    log("Opening Bag")
    send("i")
    wait(100)
    if image.find_image("item.bmp") == 1 then
        log("Opened Bag")
    else    
        wait(100)
        send("i")
        wait(100)
        log("Opened Bag")
    end
    wait("2s")
    --showwindow()
    log("Finding wepimage to convert crystals")
    wait("2s")
    local handle = workwindow()
    local startX, startY, endX, endY = 1, 1, 1024, 799 -- search coordinates

    -- Define the list of image paths starting with "wep-"
    local paths = {
        "wep-xbow.bmp",
        "wep-bow.bmp",
        "wep-shovel.bmp",
        "wep-staff.bmp",
        "wep-dagg.bmp",
        "wep-simi.bmp",
        "wep-pearl.bmp",
        "wep-wheel.bmp",
        "wep-sword.bmp",
        "wep-blade.bmp",
        "wep-knee.bmp"
    }
	
    if handle then
	for attempt = 1, 12 do
        local found = false
	log("Attempt " .. attempt)
        log(paths)
        for _, path in ipairs(paths) do
            local arr, a = findimage(startX, startY, endX, endY, {path}, workwindow(), 90, -1, 5) -- image search
            hint(a) -- search result, hint in the lower right corner
            if arr then -- if found
                log("Image found: " .. path .. " - Count: " .. #arr)
                for j = 1, #arr do 
		    send("7")
                    wait(500)
                    left(arr[j][1], arr[j][2], handle) -- clicked, left does not work in all applications
                    wait(500)
                    image.clickimage("ok.bmp")
                    wait(500)
                end
                found = true
                break
            else
                log("Image not found: " .. path)
            end
        end
        if not found then
            log("No images found on attempt" .. attempt)
        end
	end
    else
        log("Window not found")
    end

    wait(100)
    send("i")
    wait("1s")
    if image.find_image("item.bmp") == 1 then
        wait(100)
        send("i")
        wait(100)
        log("closedbag")
    else
        log("closedbag")
    end
    wait("2s")
end

return image