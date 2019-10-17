-- Title: Math Fun
-- Name: Hunter Connolly
-- Course: ICS2O
-- This program dipslays a math question and asks the user to answer in a numeric
-- textfield terminal
--------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 0, 0, 1)
-------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------
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
local divQuestion
local youWin
local youLose
----------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------------

-- correct sound
local correctSound = audio.loadSound( "Sounds/Correct Answer Sound.mp3")
local correctSoundChannel
--incorrect sound
local incorrectSound = audio.loadSound( "Sounds/Wrong Buzzer Sound.mp3")
local incorrectSoundChannel

-- you lose sound
local youLoseSound = audio.loadSound("Sounds/YouLose.mp3")
local youLoseSoundChannel

--you win sound
local youWinSound = audio.loadSound("Sounds/youWin.mp3")
local youWinSoundChannel
---------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------

local function AskQuestion()
	--generate a random number between 1 and 4
	randomOperator = math.random(1,4)

	--generate 4 random numbers
	randomNumber1 = math.random(1,10)
	randomNumber2 = math.random(1,10)

	--if the random operator is 1 then it is addition
	if (randomOperator == 1) then

		--calculate the correct answer 
		correctAnswer = randomNumber1 + randomNumber2 

		--create the question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
	elseif (randomOperator == 2) then
		--calclate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create the question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
	elseif (randomOperator == 3) then
		--calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create the question in text object
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "
	elseif (randomOperator == 4) then
		randomNumber3 = math.random(2,12)
		randomNumber4 = math.random(2,12)
		-- find the answer
		divQuestion = randomNumber3 * randomNumber4
		correctAnswer = divQuestion / randomNumber3 

		-- create the question object
		questionObject.text = divQuestion .. " ÷ " .. randomNumber3 .. " = "
	end
end




local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideRedX()
	redX.isVisible = false
	AskQuestion()
end

local function HideCheckmark()
	checkmark.isVisible = false
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
			--play correct sound
			correctSoundChannel = audio.play(correctSound)
			-- display the check mark

			-- clear the text field
			event.target.text = ""
			

		-- anything after the else means the answer is wrong
		else 
			-- Take away 1 life
			lives = lives - 1
			-- update it in the display object
			livesText.text = "Lives = " .. lives
			--it tells the user that the answer is incorrect
			timer.performWithDelay(1500, HideIncorrect)
			--play the incorrect sound
			incorrectSoundChannel = audio.play(incorrectSound)
			--clear the text field
			event.target.text = ""
			--display the x 
			redX.isVisible = true
			timer.performWithDelay(1500, HideRedX)
			incorrectObject = display.newText( "Incorrect, the correct answer is " .. correctAnswer  , display.contentWidth/2, display.contentHeight*2/3, nil, 50)
			incorrectObject:setTextColor(1,0,1)
			

		end
		if (lives == 0) then
			youLose = display.newImageRect("Images/YouLose.png", 1024, 768)
			youLose.x = display.contentWidth/2
			youLose.y = display.contentHeight/2
			numericField.isVisible = false
			youLoseSoundChannel = audio.play(youLoseSound)
		elseif (points == 5)then
			youWin = display.newImageRect("Images/Youwin.jpg", 1024, 768)
			youWin.x = display.contentWidth/2
			youWin.y = display.contentHeight/2
			numericField.isVisible = false	
			youWinSoundChannel = audio.play(youWinSound)
		end
	end	
end


-----------------------------------------------------------------------------------
--OBJECT CREATION
-------------------------------------------------------------------------------------------

-- displays a question and sets the color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(1,0,1)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(1,0,1)
correctObject.isVisible = false

-- create the incorrect object



--create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric text field
numericField:addEventListener( "userInput", NumericFieldListener)

-- display the amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth*1/4, display.contentHeight*1/8, nil, 50)
pointsText:setTextColor(1,0,1)

-- display the amount of lives left as a text object
livesText = display.newText("Lives = " .. lives, display.contentWidth*3/4, display.contentHeight*1/8, nil, 50)
livesText:setTextColor(1,0,1)

-- create the checkmark for when the user gets the answer correct
checkmark = display.newImageRect("Images/checkmark.png", 150, 150)
checkmark.isVisible = false

-- create the red x for when the user get's the answer incorrect
redX = display.newImageRect("Images/red_x.png", 150, 150 )
redX.isVisible = false
redX.x = display.contentWidth*3/4
redX.y = display.contentHeight/2 

--------------------------------------------------------------------------------------
-- FUNCTION CALLS
--------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()