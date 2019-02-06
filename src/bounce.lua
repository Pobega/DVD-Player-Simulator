local bounce = {}

--bounce.valid = {'y', 'u', 'b', 'n'} -- Nethack controls
bounce.direction = direction or 'n'

function bounce.go_opposite_x(dir)
  local opposites = { ['y'] = 'u',
                      ['u'] = 'y',
                      ['b'] = 'n',
                      ['n'] = 'b' }
  self.direction = opposites.dir
end

function bounce.update(self, entity)
  if self.direction == 'n' or self.direction == 'b' then
    entity.y = entity.y + entity.speed
  else
    entity.y = entity.y - entity.speed
  end

  if self.direction = 'n' or self.direction = 'u' then
    entity.x = entity.x + entity.speed
  else
    entity.x = entity.x - entity.speed
  end

  if entity.x > love.graphics.getWidth() or entity.x < love.graphics.getWidth() then
    self.go_opposite_x(self.direction)
  end
end

return bounce
