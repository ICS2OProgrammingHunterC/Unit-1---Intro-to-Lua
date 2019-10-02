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
		appleLogo.x = touched.x
		appleLogo.y = touched.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedgirl2 = false
		alreadyTouchedAppleLogo = false
	end
end


-- add the respective listeners to each object
appleLogo:addEventListener("touch", AppleLogoListener )
