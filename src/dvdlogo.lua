-- dvdlogo.lua
--
-- An object to control a dvdlogo.
--
-- Uses bounce movement method for it's movement pattern. Changes
-- it's sprite's colors when it bounces off of a wall.
-----------------------------------------------------------------------
local dvdlogo = {}

-----------------------------------------------------------------------
-- Returns a function to pass to sprite:mapPixel for color shifting.
-----------------------------------------------------------------------
local function randomColorFunc(self)
  -- Don't repeat the same color
  repeat
    color = love.math.random(1,7)
  until(color ~= self.lastcolor)
  self.lastcolor = color

  -- TODO: better color list
  local colors = {{255,0,0}, -- red
                  {0,255,0}, -- green
                  {0,0,255}, -- blue
                  {255,255,0},
                  {255,0,255},
                  {0,255,255},
                  {255,255,255} -- white
                 }

  -- Return the color as a new anonymous function
  return function(x,y,r,g,b,a)
           r,g,b = unpack(colors[color])
           return r,g,b,a
         end
end

-----------------------------------------------------------------------
-- Changes associated sprite's color using sprite:mapPixel()
-----------------------------------------------------------------------
local function doColorShift(self)
  self.sprite:mapPixel(self:randomColorFunc())
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
  inst.lastcolor = nil

  -- Member methods
  inst.randomColorFunc = randomColorFunc
  inst.doColorShift = doColorShift
  inst.update = update

  return inst
end

return dvdlogo
