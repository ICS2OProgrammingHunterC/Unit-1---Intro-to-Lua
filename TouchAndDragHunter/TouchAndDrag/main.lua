-- Title: TouchAndDrag
-- Name: Hunter Connolly
-- Course: ICS2O
-- This program displays images that react to a persons finger

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--loacal variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local appleLogo = display.newImageRect("Images/Apple.png", 150,150)
local appleLogoWidth = appleLogo.width
local appleLogoHeight = appleLogo.height

local macbook = display.newImageRect("Images/macbook.png", 150, 150)
local macbookHeight = macbook.height
local macbookWidth = macbook.width

--my boolean variables to keep track of which object I touched first
local alreadyTouchedAppleLogo = false
local alreadyTouchedMacbook = false

--set the initial x and y position of the images
appleLogo.x = 400
appleLogo.y = 500

macbook.x = 300