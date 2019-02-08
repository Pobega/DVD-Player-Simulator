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

-----------------------------------------------------------------------
-- Changes associated sprite's color using sprite:mapPixel()
-----------------------------------------------------------------------
local function changeColor(self)
  return -- TODO: call sprite:mapPixel() here
end

-----------------------------------------------------------------------
-- Changes sprite color when bouncing off wall and calls bounce:update
-----------------------------------------------------------------------
local function update(self)
  -- Change sprite color if bouncing off a wall
  local on_edge = self.movement:onEdge()
  if on_edge.x or on_edge.y then self:changeColor() end

  -- Update actual (x,y) values
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
  local inst = {}

  -- Member values
  inst.sprite = sprite.create('assets/dvd_logo.png')

  x = x or (love.graphics.getWidth() - inst.sprite.image:getWidth()) / 2
  y = y or (love.graphics.getHeight() - inst.sprite.image:getHeight()) / 2

  inst.entity = entity.create(inst.sprite, x, y)
  inst.movement = bounce.init(inst.entity, x_speed, y_speed)

  -- Member methods
  inst.update = update
  inst.changeColor = changeColor

  return inst
end

return dvdlogo
