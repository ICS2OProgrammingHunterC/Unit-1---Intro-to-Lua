-- Title: WhackAMole
-- Name: Hunter Connolly
-- Course: ICS2O
-- This program places a random object on the screen. if the user clicks on it in time,
-- the score increases by 1
----------------------------------------------------------------------------------------------
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
local backgroundImage = display.newImageRect("Images/grass.jpg", 1028, 768)
backgroundImage.anchorX = 0
backgroundImage.anchorY = 0
------------------------------------------------------------------------------------------------

-- creating the mole
local mole = display.newImage("Images/mole.png", 0, 0)

	--settung the position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	-- scale down the size of the mole to be a third of the original size
	mole:scale(0.3, 0.3)

	-- make the mole invisable
	mole.isVisible = false

-- add local variable to keep track of score
local points = 0

-- add local text object to display the score
local pointsText = display.newText("Points = " .. points, display.contentWidth* 6/8, display.contentHeight*7/8, nil, 75)
pointsText:setTextColor(0,0,1)

-----------------------------FUNCTIONS--------------------------------------

-- this function makes the mole appear in a random (x,y) position on the screen
-- before calling the hide function
function PopUp()

	-- choosing the random position
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)

	-- make the mole visible
	mole.isVisible = true

	-- call the hide function after 500 milliseconds
	timer.performWithDelay(500, HideMole)
end

--this function calls the popup function after 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end


function HideMole()
	mole.isVisible = false
	PopUpDelay()
end

-- this function starts the game
function GameStart()
	PopUpDelay()
end

-- this function increments the score only if th emole is clicked
function Whacked ( event )

	-- if touch phase just started
	if (event.phase == "began") then
		points = points + 1
		pointsText.text = "Points = " .. points
	end
end

-------------------------------EVENT LISTENERS------------------------------------
mole:addEventListener("touch", Whacked)

-------------------------FUNCTION CALLS--------------------------------------------
PopUp()
PopUpDelay()
GameStart()