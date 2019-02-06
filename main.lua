local dvd_logo = require('src.dvd_logo')
local moving_logo

function love.load()
  moving_logo = dvd_logo.create()
end

function love.draw()
  moving_logo:draw()
end
