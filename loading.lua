local composer = require( "composer" )
local buttonlib = require( "buttonlib" )

local scene = composer.newScene()

local sceneGroup, animrect

local function showAnimation( sceneName )
	animrect = display.newRect( sceneGroup, display.contentWidth*.25, display.contentHeight*.75, 0, 25 )
	animrect.fill = {0,0,0}
	transition.to( animrect, { time=750, width=display.contentWidth*.5, x=display.contentCenterX, onComplete=function()
		composer.gotoScene( sceneName, { time=500, effect="iosSlideLeft", isBackSwipe=true } )
	end } )
end

function scene:create( event )
	sceneGroup = self.view
	sceneGroup.name = "loading1"
	
	buttonlib.blocktouch( sceneGroup, {.8,.8,.8} )
	
	display.newText{ parent=sceneGroup, text="DOWNLOAD...", x=display.contentCenterX, y=display.contentHeight*.3, fontSize=70 }.fill = {0,0,0}
end

function scene:show( event )
	if (event.phase == "will") then
	elseif (event.phase == "did") then
		showAnimation( "page1" )
	end
end

function scene:hide( event )
	if (event.phase == "will") then
	elseif (event.phase == "did") then
		animrect:removeSelf()
		animrect = nil
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
