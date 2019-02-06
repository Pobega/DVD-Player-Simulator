local sprite = require('src.sprite')
local entity = require('src.entity')
local my_sprite
local my_entity

function love.load()
  my_sprite = sprite.create('assets/dvd_logo.png')
  my_entity = entity.create(my_sprite, 50, 50)
end

function love.update()
  my_entity:update()
end

function love.draw()
  my_entity:draw()
end
