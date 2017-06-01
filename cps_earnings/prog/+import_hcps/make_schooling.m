function [degreeV, yrSchoolV] = make_schooling(tbM, setName, year1)
% Make original schooling variables into 'degree attained' (categorical) and 'years of school'

if year1 <= 1991
   % Use higrade
   hS = vars_cps.higrade;
   degreeV = hS.recode_to_degrees(tbM.higrade);
   yrSchoolV = hS.recode_to_yrschool(tbM.higrade);
   
else
   % Use educ99
   hS = vars_cps.educ99;
   degreeV = hS.recode_to_degrees(tbM.educ99);
   yrSchoolV = hS.recode_to_yrschool(tbM.educ99);
end

assert(isa(degreeV, 'categorical'))
assert(isa(yrSchoolV, 'double'));

end