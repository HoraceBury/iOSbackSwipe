-- load reference to the composer api
local composer = require( "composer" )

-- create a scene object
local scene = composer.newScene()

-- declare scene's display group
local sceneGroup

-- called when the scene module is loaded
function scene:create( event )
	-- keep reference to scene's display group
	sceneGroup = self.view
end

-- called before and after the scene moves on screen
function scene:show( event )
	if (event.phase == "will") then
		-- scene is about to move on screen
	elseif (event.phase == "did") then
		-- scene has moved on screen
	end
end

-- called before and after the scene moves off screen
function scene:hide( event )
	if (event.phase == "will") then
		-- scene is about to move off screen
	elseif (event.phase == "did") then
		-- scene has moved off screen
	end
end

-- scene module is about to be removed from memory
function scene:destroy( event )
	sceneGroup = nil
end

-- called when user performs back-swipe navigation
function scene:swipe( event )
	if (event.phase == "began") then
		-- user start a swipe from screen left
	elseif (event.phase == "moved") then
		-- user moved the current scene during navigation swipe
	elseif (event.phase == "cancelled") then
		-- user did not complete the navigation, scene remains on screen
	elseif (event.phase == "ended") then
		-- user completed navigation swipe, call gotoScene
	end
end

-- listen to composer events
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- listen for the backswipe events
scene:addEventListener( "swipe", scene )

-- return the scene object from the module
return scene
