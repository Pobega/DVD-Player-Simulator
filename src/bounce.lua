-- bounce.lua
--
-- Movement method to bounce around the screen, stopping when a wall is
-- hit. Changes associates entity.sprite.image's color when bouncing
-- off of a wall.
-----------------------------------------------------------------------
local bounce = {}

-----------------------------------------------------------------------
-- Checks if the associated entity is at an edge (x or y axis)
-----------------------------------------------------------------------
local function onEdge(self)
  local edges = {x = false, y = false}

  if self.entity.x <= 0  or self.entity.x + self.entity.sprite.image:getWidth() >= love.graphics.getWidth() then
    edges.x = true
  end
  if self.entity.y <= 0  or self.entity.y + self.entity.sprite.image:getHeight() >= love.graphics.getHeight() then
    edges.y = true
  end

  return edges
end

-----------------------------------------------------------------------
-- Negates the entity's speed and recolors its associated sprite if
-- it's arrived at a wall.
-----------------------------------------------------------------------
local function update(self)
  self.entity.x = self.entity.x + self.x_speed
  self.entity.y = self.entity.y + self.y_speed

  local on_edge = self:onEdge()

  -- If on any edge, change the image color
  if on_edge.x or on_edge.y then
    -- TODO: Change color here
  end

  -- Negate the speed of the edge we hit
  if on_edge.x then self.x_speed = -self.x_speed end
  if on_edge.y then self.y_speed = -self.y_speed end
end

-----------------------------------------------------------------------
-- Bounce movement pattern.
-- @param entity  The entity bounce controls
-- @param x_speed Amount of pixels to move on x axis (negative is left)
-- @param y_speed Amount of pixels to move on y axis (negative is up)
-----------------------------------------------------------------------
function bounce.init(entity, x_speed, y_speed)
  inst = {}

  -- Member values
  inst.entity = entity
  inst.x_speed = x_speed or 1
  inst.y_speed = y_speed or 2

  -- Member methods
  inst.update = update
  inst.onEdge = onEdge

  return inst
end

return bounce
