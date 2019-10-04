-- Title: TouchAndDrag
-- Name: Hunter Connolly
-- Course: ICS2O
-- This program displays images that react to a persons finger

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--loacal variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local appleLogo = display.newImageRect("Images/apple.png", 150,150)
local appleLogoWidth = appleLogo.width
local appleLogoHeight = appleLogo.height

local girl2 = display.newImageRect("Images/girl2.png", 150, 150)
local girl2Height = girl2.height
local girl2Width = girl2.width

--my boolean variables to keep track of which object I touched first
local alreadyTouchedAppleLogo = false
local alreadyTouchedgirl2 = false

--set the initial x and y position of the images
appleLogo.x = 700
appleLogo.y = 500

girl2.x = 300
girl2.y = 500

-- function: AppleLogoListener
-- Input : Touch Listener
--Output : None
--Description: when applelogo is touched move her
local function AppleLogoListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedgirl2 == false) then
			alreadyTouchedAppleLogo = true
		end
    end

	if ( (touch.phase == "moved") and (alreadyTouchedAppleLogo == true) ) then
		appleLogo.x = touch.x
		appleLogo.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedAppleLogo = false
		alreadyTouchedgirl2 = false
	end
end

appleLogo:addEventListener("touch", AppleLogoListener )
--function: girl2listener
-- Input: touch listener
--Output: None
--When girl 2 is touched it will move 
-- add the respective listeners to each object


local function girl2listener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedAppleLogo == false) then
			alreadyTouchedgirl2 = true
		end
    end

	if ( (touch.phase == "moved") and (alreadyTouchedgirl2 == true) ) then
		girl2.x = touch.x
		girl2.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedgirl2 = false
		alreadyTouchedAppleLogo = false
	end
end

girl2:addEventListener("touch", girl2listener)



