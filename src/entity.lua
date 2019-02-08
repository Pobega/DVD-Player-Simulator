-- entity.lua
--
-- An object describing an entity.
--
-- An entity is just a simple object with an associated sprite, an
-- x and y value, and a draw function (which calls sprite:draw)
--
-- Mostly used as a high level storage for sprite, x and y to be
-- passed around by other objects. More or less everything
-- interactable being drawn should be an entity.
-----------------------------------------------------------------------
local entity = {}

-----------------------------------------------------------------------
-- Call draw on the sprite object associated with this entity.
-----------------------------------------------------------------------
local function draw(self)
  self.sprite:draw(self.x, self.y)
end

-----------------------------------------------------------------------
-- Create a new entity instance.
-- @param x Starting x position
-- @param y Starting y position
-----------------------------------------------------------------------
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
