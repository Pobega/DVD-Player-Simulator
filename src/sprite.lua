local sprite = {}

local function draw(self, x, y)
  love.graphics.draw(self.sprite, x, y)
end

function sprite.create(image)
  local inst = {}

  -- Member values
  inst.sprite = love.graphics.newImage(image)

  -- Member methods
  inst.draw = draw

  return inst
end

return sprite
