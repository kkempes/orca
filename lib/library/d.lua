local D = function ( self, x, y )
  
  self.y = y
  self.x = x
  self.name = 'delay'
  self.ports = { {-1, 0 , 'in-rate' }, {1, 0, 'in-mod' }, {0, 1, 'd-output' } }
  self:spawn(self.ports)

  local mod = self:listen( self.x + 1, self.y ) or 8
  local rate = self:listen( self.x - 1, self.y ) or 1
  local val = self.frame
  local out = '.'

  --mod = mod == 0 and 1 or mod 
  --rate = rate == 0 and 1 or rate
  if rate == 0 then out = '.'
    else
   val = ( self.frame % ( mod * rate ))
   out = ( val == 0 or mod == 1 ) and '*' or '.'
               end
  self:write(0, 1, out)
  
                     
  
                    
   

end  

return D


--~