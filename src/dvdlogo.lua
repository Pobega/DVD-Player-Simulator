local dvdlogo = {}

local sprite = require('src.sprite')
local entity = require('src.entity')
local bounce = require('src.bounce')

local function update(self)
  self.movement:update()
end

function dvdlogo.create(x, y, x_speed, y_speed)
  local inst = {}

  -- Member values
  inst.sprite = sprite.create('assets/dvd_logo.png')
  inst.entity = entity.create(inst.sprite, x, y)
  inst.movement = bounce.init(inst.entity, x_speed, y_speed)

  -- Member methods
  inst.update = update

  return inst
end

return dvdlogo
