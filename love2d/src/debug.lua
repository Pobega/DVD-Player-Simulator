local debug = {}

is_debug = true

function debug.drawFps()
  if is_debug then
    love.graphics.print("Current FPS: "..
                          tostring(love.timer.getFPS()),
                        10, 10)
    love.graphics.reset()
  end
end

function debug.drawXy(entity)
  if is_debug then
    love.graphics.print("X: "..
                          tostring(entity.x)..
                          "\n".."Y: "..
                          tostring(entity.y),
                        10, 25)
    love.graphics.reset()
  end
end

return debug
