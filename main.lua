local dvdlogo = require('src.dvdlogo')
debug = require('src.debug')

function love.load()
  my_dvdlogo = dvdlogo.create()
end

function love.update()
  my_dvdlogo:update()
end

function love.draw()
  --[[ TODO: put this in a debug module
  love.graphics.setNewFont(15)
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
  --]]
  debug.drawFps()
  my_dvdlogo.entity:draw()
end
