-- Title: DrawingShapes
-- Name: Hunter Connolly
-- Course: ICS2O

--hide the status bar
display.setStatusBar(display.HiddenStausBar)

--set the background color


-- draw the pentagon
local vPentagon =  {-120,-120,120,-120,160,80,0,160,-160,80} 
local Pentagon = display.newPolygon( 256, 192, vPentagon)

--set the color of the pentagon
Pentagon:setFillColor(51/255, 255/255, 51/255) 

--create the border
Pentagon.strokeWidth = 20

--set the border color
Pentagon:setStrokeColor(0,0,1)

local textObject
-- displays text on the screen at the position of x = 500 y = 500 with
-- a default font style and font siza of 50
textObject = display.newText("Pentagon", 256, display.contentHeight/2, 'Comic Sans Ms', 50)

-- sets the color of the text
textObject:setTextColor(51/255, 255/255, 51/255)