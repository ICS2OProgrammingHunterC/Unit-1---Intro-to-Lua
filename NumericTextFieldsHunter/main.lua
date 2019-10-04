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

---------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------

local function AskQuestion( ... )
	-- generate2 random numbers between a max. and a min. numbers
	randomNumber1 = math.random(0, 20)
	randomNumber2 = math.random(0, 20)

	correctAnswer = randomNumber1 + randomNumber2

	-- create the question in a text object
	questionObject.text = randomNumber1 .. " + " .. " = "
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
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
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

--create numeric field
numericField= na