-- Title: AreaOfRectangleAndCircle
-- Name: Hunter Connolly
-- Course: ICS2O
-- This  calculates the area of a rectangle in pixels squared
-- and displays it on the sreen. Then will do the same
-- thing for a circle.

--Create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle

--Create local vairables for area of a circle
local AreaCircText
local textSize = 50
local RadiusOfCirc = 150
local PI = 3.14
local areaOfCirc
local myCirc

-- set the background color
display.setDefault("background", 0/255, 0/255, 255/255)

--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle half the width and half the size of the screen size
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

--Anchor the rectanngle in the top left corner of the and ste its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

--set the width of the border
myRectangle.strokeWidth = 20

--set the color of the rectangle
myRectangle:setFillColor(255/255, 128/255, 0/255)

-- set the color of the border
myRectangle:setStrokeColor(0/255, 255/255, 255/255)

-- Calculate the Area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- Write the area on the screen.
areaText = display.newText("The Area of this Rectangle with a width of \n" ..
	widthOfRectangle .. "and a height of" .. heightOfRectangle .." is " .. 
	areaOfRectangle .. " Pixels².", 0, 0, Arial, textSize)

-- Anchor the text and set it's (x,y) position
areaText.anchorY = 0
areaText.anchorX = 0
areaText.x = 20
areaText.y = 250

--set the color of the text
areaText:setTextColor(0/255, 255/255, 255/255)

-- Draw the Circle
myCircle = display.newCircle(display.contentWidth*3/4, display.contentHeight*3/4, RadiusOfCirc )

--Create the border of the Circle
myCircle.strokeWidth = 20

--set the border color
myCircle:setStrokeColor(0/255, 255/255, 255/255)

myCircle:setFillColor(255/255, 128/255, 0/255)