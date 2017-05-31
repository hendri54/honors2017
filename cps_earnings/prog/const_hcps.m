classdef const_hcps < handle
   
properties
   dbg = 111
end


methods
   %% Constructor
   function cS = const_hcps(setName)
      
      switch setName
         case 'default'
         otherwise
            error('invalid');
      end
   end
end
   
end