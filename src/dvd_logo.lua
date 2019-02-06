local dvdLogo = {}
local image = 'assets/dvd_logo.png'

local function draw(self)
  love.graphics.draw(self.sprite, self.x, self.y, 0, self.scale)
end

function dvdLogo.create()
  local instance = {}

  instance.sprite = love.graphics.newImage(image)

  -- Useful for figuring out when we hit the corner
  instance.width  = instance.sprite:getWidth()
  instance.height = instance.sprite:getHeight()

  instance.scale = 0.5

  -- Should start in the center of the screen
  local width, height = love.graphics.getDimensions()
  instance.x = (width  - (instance.width  * instance.scale)) / 2
  instance.y = (height - (instance.height * instance.scale)) / 2

  instance.draw = draw

  return instance
end

return dvdLogo
