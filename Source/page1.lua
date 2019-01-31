local composer = require( "composer" )
local buttonlib = require( "buttonlib" )

local scene = composer.newScene()

local sceneGroup

function scene:create( event )
	sceneGroup = self.view
	sceneGroup.name = "page1"
	
	buttonlib.blocktouch( sceneGroup, {1,.8,.8} )
	
	display.newText{ parent=sceneGroup, text="PAGE 1", x=display.contentCenterX, y=display.contentHeight*.2, fontSize=70 }.fill = {0,0,0}
	
	buttonlib.createMenuButton( sceneGroup, .4, "Page 2", "page2", "iosSlideLeft", true )
	
	buttonlib.createBackButton( sceneGroup, "home" )
end

function scene:show( event )
	if (event.phase == "will") then
	elseif (event.phase == "did") then
		composer.setPreviousScene( "home" )
	end
end

function scene:hide( event )
	if (event.phase == "will") then
	elseif (event.phase == "did") then
	end
end

function scene:destroy( event )
	sceneGroup = nil
end

function scene:swipe( event )
	if (event.phase == "ended") then
		composer.gotoScene( "home", { time=500, effect="iosSlideRight" } )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
scene:addEventListener( "swipe", scene )

return scene
