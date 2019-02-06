local entity = {}

local function draw(self)
  self.sprite:draw(self.x, self.y)
end

function entity.create(sprite, x, y, speed)
  local inst = {}

  -- Member values
  inst.sprite = sprite
  inst.x = x or 0
  inst.y = y or 0
  inst.speed = speed or 5

  -- Member methods
  inst.draw = draw
  inst.update = update

  return inst
end

return entity
