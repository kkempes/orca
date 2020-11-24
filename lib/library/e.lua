local E = function( self, x, y )
 
  self.y = y
  self.x = x
  self.name = 'every64'
  self.ports = { {-1, 0 , 'in-rate' },  {1, 0, 'in-mod' }, {0, 1, 'c-output' } }
  self:spawn(self.ports)

  local mod = self:listen( self.x + 1, self.y ) or 8
  local rate = self:listen( self.x - 1, self.y ) or 64
  mod = mod == 0 and 1 or mod
  rate = rate == 0 and 1 or rate
  local val = ( math.floor( self.frame / rate ) % mod ) + 1
	
  self:write(0, 1, self.chars[val])
 

end

return E


