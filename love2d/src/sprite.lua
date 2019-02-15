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
-- @param func Function to pixel map with (see ImageData.mapPixel)
-----------------------------------------------------------------------
local function mapPixel(self, func)
  --[[ We reset the ImageData here instead of just writing the new data
       in case we are trying to do a color shift off of the original
       palette.  -]]
  self:resetImageData()
  self.imagedata:mapPixel(func)
  self.image:replacePixels(self.imagedata)
end

-----------------------------------------------------------------------
-- Reset self.imagedata to the original image
-----------------------------------------------------------------------
local function resetImageData(self)
  -- Set to nil to trigger garbage collection [bootleg free()], unsure if needed?
  self.imagedata = nil
  self.imagedata = love.image.newImageData(self.filename)
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
  inst.imagedata_original = inst.imagedata:getString()
  inst.image = love.graphics.newImage(inst.imagedata)

  -- Member methods
  inst.draw = draw
  inst.mapPixel = mapPixel
  inst.resetImageData = resetImageData

  return inst
end

return sprite
