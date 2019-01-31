local composer = require( "composer" )
local buttonlib = require( "buttonlib" )

local scene = composer.newScene()

local sceneGroup

function scene:create( event )
	sceneGroup = self.view
	sceneGroup.name = "home"
	
	buttonlib.blocktouch( sceneGroup, {1,1,1} )
	
	display.newText{ parent=sceneGroup, text="HOME", x=display.contentCenterX, y=display.contentHeight*.2, fontSize=70 }.fill = {0,0,0}
	
	buttonlib.createMenuButton( sceneGroup, .4, "Page 1", "page1", "iosSlideLeft", true )
	buttonlib.createMenuButton( sceneGroup, .6, "Download", "download", "iosSlideLeft", false )
end

function scene:show( event )
	if (event.phase == "will") then
	elseif (event.phase == "did") then
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

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
