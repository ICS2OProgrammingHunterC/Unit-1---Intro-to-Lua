-- Title: TouchAndReact
-- Name: Hunter Connolly
-- Course: ICS2O
-- This program does something when I click a button

-- set the backgorund color
display.setDefault ( "background" , 102/255, 103/255, 255/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create the blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create the red button, set it's position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- creat text object, set it's position and make it onvisible
local textObject = display.newText ("Clicked", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0,1,0)
textObject.isVisible = false


--Function: BlueButtonListener
--Input: touch listener
-- Output:none
--description: when blue button is clicked, it will make the text appear,
--with the red button, and make the blue button disappaer
local function BlueButtonListener(touch)
	if(touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end
	if(touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

local function RedButtonListener(touch)
	if(touch.phase == "began") then
		redButton.isVisible = false
		blueButton.isVisible = true
		textObject.isVisible = true
	end
	if(touch.phase == "ended") then
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)
