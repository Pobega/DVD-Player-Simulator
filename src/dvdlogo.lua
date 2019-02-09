-- dvdlogo.lua
--
-- An object to control a dvdlogo.
--
-- Uses bounce movement method for it's movement pattern. Changes
-- it's sprite's colors when it bounces off of a wall.
-----------------------------------------------------------------------
local dvdlogo = {}

local function randomColor(x, y, r, g, b, a)
  local colors = {
    {r*4, g, b}, -- red
    {r, g*4, b}, -- green
    {r, g, b*4}  -- blue
  }
  -- TODO: the randomization is happening on the pixel level,
  -- make it random for the entire transform

  local color = colors[love.math.random(1,3)]

  print('input: ', r, g, b, 'output: ', color[1], color[2], color[3])
  r,g,b = unpack(color)
  r = color[1]
  g = color[2]
  b = color[3]
  --[[r = r*2+50
  g=g*2
  b=b*229
  ]]--
  return r,g,b,a
end

-----------------------------------------------------------------------
-- Changes associated sprite's color using sprite:mapPixel()
-----------------------------------------------------------------------
local function doColorShift(self)
  self.sprite:mapPixel(randomColor)
end

-----------------------------------------------------------------------
-- Changes sprite color when bouncing off wall and calls bounce:update
-----------------------------------------------------------------------
local function update(self)
  -- Change sprite color if bouncing off a wall
  local on_edge = self.movement:onEdge()
  if on_edge.x or on_edge.y then self:doColorShift() end

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

  local sprite = require('src.sprite')
  local entity = require('src.entity')
  local bounce = require('src.bounce')

  -- Member values
  inst.sprite = sprite.create('assets/dvd_logo.png')
  -- If no (x,y) is passed in, start in center of screen
  x = x or (love.graphics.getWidth() - inst.sprite.image:getWidth()) / 2
  y = y or (love.graphics.getHeight() - inst.sprite.image:getHeight()) / 2
  inst.entity = entity.create(inst.sprite, x, y)
  -- Movement pattern
  inst.movement = bounce.init(inst.entity, x_speed, y_speed)

  -- Member methods
  inst.update = update
  inst.doColorShift = doColorShift
  inst.changeColor = changeColor

  return inst
end

return dvdlogo
