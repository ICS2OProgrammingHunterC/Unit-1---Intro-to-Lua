-- Title: NumericTextFields
-- Name: Hunter Connolly
-- Course: ICS2O
-- This program dipslays a math question and asks the user to answer in a numeric
-- textfield. terminal
---------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the backround color
display.setDefault("background", 1,0,1)

-------------------------------------------------------------------------------------
--LOCAL VARIABLES
------------------------------------------------------------------------------------

--create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local points = 0
local pointsText
local lives = 3
local livesText
---------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------

local function AskQuestion( ... )
	-- generate 2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 20)

	correctAnswer = randomNumber1 + randomNumber2

	-- create the question in a text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )
	--user begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear the text field
		event.target.text = ""
	elseif event.phase == "submitted" then
		-- when the answer is submitted ( enter key is pressed) set user input to users answer
		userAnswer = tonumber(event.target.text)
		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			--give a point if user gets the correct answer
			points = points + 1
			-- update it in the display object
			pointsText.text = "Points = " .. points
			-- it tells the user that the answer is correct
			correctObject.isVisible = true
			timer.performWithDelay(1500, HideCorrect)
			
		-- anything after the else means the answer is wrong
		else 
			-- Take away 1 life
			lives = lives - 1
			-- update it in the display object
			livesText.text = "Lives = " .. lives
			--it tells the user that the answer is incorrect
			incorrectObject.isVisible = true
			timer.performWithDelay(1500, HideCorrect)
		end
		if (points == 5) then
			display.newText("You win", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
		end
	end	
end




-----------------------------------------------------------------------------------
--OBJECT CREATION
-------------------------------------------------------------------------------------------

-- displays a question and sets the color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0,0,1)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(0,0,1)
correctObject.isVisible = false

-- create the incorrect object
incorrectObject = display.newText( "Incorrect, the correct answer is" , display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(0,0,1)
incorrectObject.isVisible = false


--create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric text field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth*1/4, display.contentHeight*1/8, nil, 50)
pointsText:setTextColor(0,0,1)

-- display the amount of lives left as a text object
livesText = display.newText("Lives = " .. lives, display.contentWidth*3/4, display.contentHeight*1/8, nil, 50)
livesText:setTextColor(0,0,1)

--------------------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()



