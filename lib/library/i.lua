local I = function (self, x, y )
  
  self.y = y
  self.x = x
  self.name = 'increment'
  self.ports = { {-1, 0 , 'in-step' }, {1, 0, 'in-max' }, {0, 1, 'i-out' } }
  self:spawn(self.ports)

  local step = self:listen(self.x - 1, self.y) or 1
  local max = self:listen(self.x + 1, self.y) or 8



  

  local val = ( math.floor( self.frame / step ) % max ) + 1
	
  self:write(0, 1, self.chars[val])
  
  
  
  
end

return I