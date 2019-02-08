local sprite = {}

local function draw(self, x, y)
  love.graphics.draw(self.image, x, y)
end

local function changeColor(self, r, g, b, a)
  local imagemap = self.imagedata:mapPixel(r, g, b, a)
  self.image:replacePixels(imagemap)
end

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
