-- dvdlogo.lua
--
-- An object to control a dvdlogo.
--
-- Uses bounce movement method for it's movement pattern. Changes
-- it's sprite's colors when it bounces off of a wall.
-----------------------------------------------------------------------
local dvdlogo = {}

local sprite = require('src.sprite')
local entity = require('src.entity')
local bounce = require('src.bounce')

local function update(self)
  self.movement:update()
end

-----------------------------------------------------------------------
-- Create a new dvdlogo instance.
-- @param x       Starting x position
-- @param y       Starting y position
-- @param x_speed Amount of pixels to move on x axis (negative is left)
-- @param y_speed Amount of pixels to move on y axis (negative is up)
-----------------------------------------------------------------------
function dvdlogo.create(x, y, x_speed, y_speed)
  -- TODO: pass a callback into bounce for changing the sprite color
  -- rather than putting it in bounce.
  local inst = {}

  -- Member values
  inst.sprite = sprite.create('assets/dvd_logo.png')

  x = x or (love.graphics.getWidth() - inst.sprite.image:getWidth()) / 2
  y = y or (love.graphics.getHeight() - inst.sprite.image:getHeight()) / 2

  inst.entity = entity.create(inst.sprite, x, y)
  inst.movement = bounce.init(inst.entity, x_speed, y_speed)

  -- Member methods
  inst.update = update

  return inst
end

return dvdlogo
