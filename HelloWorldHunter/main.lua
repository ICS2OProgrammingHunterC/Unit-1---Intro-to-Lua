-- Title: HelloWorld
-- Name: Hunter Connolly
-- Course: ICS2O
-- This program displays Hello to the simulator and to the command terminal.

-- Print to the command terminal
print ("Hello Hunter!")
print ("This Class is Awesome!!!")

--hide the stastus bar
display.setStatusBar (display.HiddenStatusBar)

-- set bacground color
display.setDefault("background", 255/255, 0/255, 0/255) 

-- create a local variable
local textObject

-- displays text on the screen at the position of x = 500 y = 500 with
-- a default font style and font siza of 50
textObject = display.newText("This Is KIWI", display.contentWidth/2, display.contentHeight/2, 'Comic Sans Ms', 100)

-- sets the color of the text
textObject:setTextColor(51/255, 255/255, 51/255)

-- say who it's vreated by
local textObjectSignature
textObjectSignature = display.newText("By Hunter Connolly", 500, 700, 'Times New Roman' , 50)

--sets color of the text
textObjectSignature:setTextColor(51/255, 255/255, 51/255)