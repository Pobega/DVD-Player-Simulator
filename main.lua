local dvdlogo = require('src.dvdlogo')

function love.load()
  my_dvdlogo = dvdlogo.create()
end

function love.update()
  my_dvdlogo:update()
end

function love.draw()
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
  my_dvdlogo.entity:draw()
end
