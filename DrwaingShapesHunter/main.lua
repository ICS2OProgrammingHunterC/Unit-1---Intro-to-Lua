-- Title: DrawingShapes
-- Name: Hunter Connolly
-- Course: ICS2O

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the background color
display.setDefault("background", 102/255, 0/255, 204/255)

-- draw the pentagon
local vPentagon =  {-120,-120,120,-120,160,80,0,160,-160,80} 
local Pentagon = display.newPolygon( 256, 192, vPentagon)

--draw the trapezoid
local vTrapezoid = {-90,-130,90,-130,170,130,-170,130}
local Trapezoid = display.newPolygon( 768, 192, vTrapezoid)

-- draw a triangle
local vtriangle = {0,-130,130,130,-130,130}
local triangle = display.newPolygon( 256, 600, vtriangle)
-------------------------------------------------------------------------
--PENTAGON
--set the color of the pentagon
Pentagon:setFillColor(51/255, 255/255, 51/255) 

--create the border
Pentagon.strokeWidth = 20

--set the border color
Pentagon:setStrokeColor(1,0,0)

local textObject
-- displays text on the screen at the position of x = 500 y = 500 with
-- a default font style and font siza of 50
textObject = display.newText("Pentagon", 256, 192, 'Comic Sans Ms', 45)

-- sets the color of the text
textObject:setTextColor(1,0,0)
-----------------------------------------------------------------------------
--TRAPEZOID
--set the color of the trapezoid
Trapezoid:setFillColor(51/255, 255/255, 51/255) 

--set the border
Trapezoid.strokeWidth = 20

--set the border color
Trapezoid:setStrokeColor(1,0,0)

local textObjectTrapezoid 
textObjectTrapezoid = display.newText("Trapezoid", 768, 192, 'Comic Sans Ms', 45)
textObjectTrapezoid:setTextColor(1,0,0)
----------------------------------------------------------------------------------
--TRIANGLE
--set the color of the triangle
triangle:setFillColor(51/255, 255/255, 51/255) 

--set the border
triangle.strokeWidth = 20

-- set the border color
triangle:setStrokeColor(1,0,0)

local textobjecttriangle
textobjecttriangle = display.newText("Triangle", 256, 650, 'Comic Sans Ms', 45)
textobjecttriangle:setTextColor(1,0,0)

--find the area of the triangle
local trianglebase = 175
local heighttriangle = 150
local areaoftriangle
local areaText

areaoftriangle = trianglebase * heighttriangle / 2








