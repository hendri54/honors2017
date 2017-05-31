classdef const_hcps < handle
   
properties
   yearV = 1964 : 2016;
   % Original cps variables used
   varNameV = {'age', 'sex', 'incwage', 'uhrswork2', 'wkswork2', 'classwkr', 'empstat', 'wtsupp'};
   dbg = 111
   
   filterS  param_hcps.Filter
end


methods
   %% Constructor
   function cS = const_hcps(setName)
      cS.filterS = param_hcps.Filter;
      
      switch setName
         case 'default'
         otherwise
            error('invalid');
      end
   end
end
   
end