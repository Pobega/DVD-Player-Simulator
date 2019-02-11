local dvdlogo = require('src.dvdlogo')

function love.load()
  my_dvdlogo = dvdlogo.create()
end

function love.update()
  my_dvdlogo:update()
end

function love.draw()
  -- TODO: put this in a debug module
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10, 0, 1.2)
  my_dvdlogo.entity:draw()
end
