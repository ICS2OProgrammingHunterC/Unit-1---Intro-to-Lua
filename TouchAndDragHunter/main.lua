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

local Girl = display.newImageRect("Images/girl2.png", 150, 150)
local GirlHeight = girl.height
local GirlWidth = girl.width

--my boolean variables to keep track of which object I touched first
local alreadyTouchedAppleLogo = false
local alreadyTouchedGirl = false

--set the initial x and y position of the images
appleLogo.x = 400
appleLogo.y = 500

Girl.x = 300
Girl.y = 500
