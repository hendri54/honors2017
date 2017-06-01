classdef const_hcps < handle
   
properties
   yearV = 1964 : 2016;
   % Original cps variables used
   varNameV = {'age', 'sex', 'incwage', 'uhrswork2', 'wkswork2', 'classwkr', 'empstat', 'wtsupp', ...
      'educ99', 'higrade', 'educ'};
   % School groups
   sLabelV = {'HSD', 'HSG', 'CD', 'CG'};
   sSuffixV = {'_s1', '_s2', '_s3', '_s4'};
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