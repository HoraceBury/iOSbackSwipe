local composer = require( "composer" )

local buttonlib = {}

local function blocktouch( sceneGroup, col )
	local rect = display.newRect( sceneGroup, display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	rect.fill = col
	rect:addEventListener("tap",function(e) return true end )
	rect:addEventListener("touch",function(e) return true end )
	return true
end
buttonlib.blocktouch = blocktouch

local function createBackButton( sceneGroup, sceneName )
	local group = display.newGroup()
	sceneGroup:insert( group )
	group.x, group.y = display.contentWidth*.2, display.contentHeight*.2
	
	local text = display.newText{ parent=group, text="BACK", fontSize=30 }
	text.fill = {1,1,1}
	
	display.newRect( group, 0, 0, text.width*1.2, text.height*1.2 ).fill = {0,0,0}
	
	text:toFront()
	
	group:addEventListener( "tap", function()
		composer.gotoScene( sceneName, { time=500, effect="iosSlideRight", isBackSwipe=true } )
		return true
	end )
end
buttonlib.createBackButton = createBackButton

local function createMenuButton( sceneGroup, y, text, link, effect, isswipe )
	local group = display.newGroup()
	sceneGroup:insert( group )
	group.x, group.y = display.contentCenterX, display.contentHeight*y
	
	local text = display.newText{ parent=group, text=text, fontSize=40 }
	text.fill = {1,1,1}
	
	display.newRect( group, 0, 0, text.width*1.2, text.height*1.2 ).fill = {0,0,0}
	
	text:toFront()
	
	group:addEventListener( "tap", function()
		composer.gotoScene( link, { time=500, effect=effect, isBackSwipe=isswipe } )
		return true
	end )
end
buttonlib.createMenuButton = createMenuButton

return buttonlib
