display.setDefault( "background", 1, 1, 1 )

local composer = require( "composer" )
--composer.isDebug = true -- uncomment to show the swipe detection bar

require("backswipelib")

composer.gotoScene( "home", { effect="fade", time=250, isBackSwipe=false } )
