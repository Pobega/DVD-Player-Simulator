local entity = {}

local function draw(self)
  self.sprite:draw(self.x, self.y)
end

function entity.create(sprite, x, y)
  local inst = {}

  -- Member values
  inst.sprite = sprite
  inst.x = x or 0
  inst.y = y or 0

  -- Member methods
  inst.draw = draw

  return inst
end

return entity
