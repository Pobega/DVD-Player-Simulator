local dvdlogo = require('src.dvdlogo')

function love.load()
  my_dvdlogo = dvdlogo.create()
end

function love.update()
  my_dvdlogo.entity:update()
end

function love.draw()
  my_dvdlogo.entity:draw()
end
