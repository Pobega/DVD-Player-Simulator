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

local function randomColor(x, y, r, g, b, a)
  local colors = {}
  --TODO get the color transform to work properly
  --     maybe it needs to retain the image's original colors?

  -- All colors we can transform to
  colors.red = {r = 200, g = 0, b = 0}
  colors.green = {r = 0, g = 200, b = 0}
  colors.blue = {r = 0, g = 0, b = 200}

  local color = colors[1]
  --local color = colors[love.math.random(1,3)]

  r,g,b = color.r, color.g, color.b
  return r,g,b,a
end

-----------------------------------------------------------------------
-- Changes associated sprite's color using sprite:mapPixel()
-----------------------------------------------------------------------
local function changeColor(self)
  self.sprite:mapPixel(randomColor)
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

  -- If no (x,y) is passed in, start in center of screen
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
