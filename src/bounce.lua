local bounce = {}

local function on_edge(self)
  local edges = {x = false, y = false}

  if self.entity.x <= 0  or self.entity.x + self.entity.sprite.sprite:getWidth() >= love.graphics.getWidth() then
    edges.x = true
  end
  if self.entity.y <= 0  or self.entity.y + self.entity.sprite.sprite:getHeight() >= love.graphics.getHeight() then
    edges.y = true
  end

  return edges
end

local function update(self)
  self.entity.x = self.entity.x + self.x_speed
  self.entity.y = self.entity.y + self.y_speed

  local at_edge = self:on_edge()

  if at_edge.x then self.x_speed = -self.x_speed end
  if at_edge.y then self.y_speed = -self.y_speed end
end

function bounce.init(entity, x_speed, y_speed)
  inst = {}

  -- Member values
  inst.entity = entity
  inst.x_speed = x_speed or 1
  inst.y_speed = y_speed or 2

  -- Member methods
  inst.update = update
  inst.on_edge = on_edge

  return inst
end

return bounce
