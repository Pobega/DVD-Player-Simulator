-- sprite.lua
--
-- An object handling a sprite.
--
-- A sprite is any image being drawn to the screen.
-----------------------------------------------------------------------
local sprite = {}

-----------------------------------------------------------------------
-- Draw this sprite's image to the screen
-- @param x Position on X axis to draw
-- @param y Position on Y axis to draw
-----------------------------------------------------------------------
local function draw(self, x, y)
  love.graphics.draw(self.image, x, y)
end

-----------------------------------------------------------------------
-- Transform this sprite's color
-- @param r Red value (0-255)
-- @param g Green value (0-255)
-- @param b Blue value (0-255)
-- @param a Alpha value (0-1)
-----------------------------------------------------------------------
local function changeColor(self, r, g, b, a)
  local imagemap = self.imagedata:mapPixel(r, g, b, a)
  self.image:replacePixels(imagemap)
end

-----------------------------------------------------------------------
-- Create a new sprite instance.
-- @param file Path to file to load
-----------------------------------------------------------------------
function sprite.create(file)
  local inst = {}

  -- Member values
  inst.filename = file
  inst.imagedata = love.image.newImageData(file)
  inst.image = love.graphics.newImage(inst.imagedata)

  -- Member methods
  inst.draw = draw

  return inst
end

return sprite
