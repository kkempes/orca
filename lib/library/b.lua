--local B = function ( self, x, y )
  
--  self.y = y
--  self.x = x
--  self.name = 'bounce'
--  self.ports = { {-1, 0, 'in-rate' }, {1, 0, 'in-to' },  {0, 1, 'b-out' } }
--  self:spawn(self.ports)

--  local to = self:listen( self.x + 1, self.y ) or 1
--  local rate = self:listen( self.x - 1, self.y ) or 1
--  to, rate = to == 0 and 1 or to, rate == 0 and 1 or rate
--  local key = math.floor( self.frame / rate ) % ( to * 2 )
--  local val = key <= to and key or to - ( key - to )
  
--  self:write(0, 1, self.chars[val])
  
--end

--return B

local B = function ( self, x, y )

  self.y = y
  self.x = x
  self.name = 'borders'
  self.ports = { {-1, 0 , 'in-max' },  {-2, 0, 'in-min' },  {-3, 0, 'in-rate' }, {0, 1, 'c-output' } }
  self:spawn(self.ports)

  local min = self:listen( self.x - 2, self.y) or 1
  local max = self:listen( self.x - 1, self.y ) or 8
  local rate = self:listen( self.x - 3, self.y ) or 1
  min = min == 0 and 1 or min
  max = max == 0 and 1 or max
  rate = rate == 0 and 1 or rate
  
  local val = (math.floor (min-1+( (self.frame)/ rate ) % (max-min+1) )) + 1
	
  self:write(0, 1, self.chars[val])
  
end

return B