function wageV = make_wage(tbM, setName, year1)
% Make wage variable

% cS = const_hcps(setName);

wageV = tbM.incwage ./ tbM.weeksWorked;

% Deal with top coding! +++++

end