local dvdlogo = {}

local sprite = require('src.sprite')
local entity = require('src.entity')

function dvdlogo.create()
  local inst = {}

  -- Member values
  inst.sprite = sprite.create('assets/dvd_logo.png')
  inst.entity = entity.create(inst.sprite, 0, 0)

  return inst
end

return dvdlogo
