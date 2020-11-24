----myarc


local a = arc.connect()
--l= {} 

function init()
  
  a:all(0);
  for i = 1, 4 do a:led(i, 1, 15); end
  a:refresh();
  --for i= 0, 63 do l[i]=i end
end
  
  o1=0
  o2=0
  o3=0
  o4=0
  function a.delta(enc, offset)
        
if enc == 1 then  
         o1 = (offset + o1) % 64
         for i = 0, 63 do if i ~= o1 then a:led(enc, i, 0) end end
         a:led(enc, o1, 15)
         a:refresh()
         --print(enc, o1)
  elseif enc == 2 then 
         o2 = (offset + o2) %6 4
         for i = 0, 63 do if i ~= o2 then a:led(enc, i, 0) end end
         a:led(enc, o2 , 15)
         a:refresh()
         --print(enc, o2)
  elseif enc == 3 then 
         o3 = (offset + o3) % 64
         for i= 0, 63 do if i ~= o3 then a:led(enc, i, 0) end end
         a:led(enc, o3 , 15)
         a:refresh()
         --print(enc, o3)
  
  elseif enc == 4 then 
         o4 = (offset + o4) % 64
         for i = 0, 63 do if i ~= o4 then a:led(enc, i, 0) end end
         a:led(enc, o4 , 15)
         a:refresh()
         --print(enc, o4)
end
    
   
 end
  
  
  
    