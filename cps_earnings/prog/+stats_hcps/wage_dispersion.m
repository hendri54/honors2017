function wage_dispersion(schoolGroup, setName)
% Compute wage dispersion by year
%{
IN
   schoolGroup  ::  char
      e.g. HSD
      []: use all
%}

cS = const_hcps(setName);
ny = length(cS.yearV);


%% Compute dispersion

outM = array2table(nan(ny, 5),  'VariableNames', {'stdLog', 'R9010', 'R7525', 'R9050', 'R5010'});
outM.year = cS.yearV(:);

for iy = 1 : ny
   year1 = cS.yearV(iy);
   tbM = var_load_hcps('data_main', setName,  'year', year1);
   
   if ~isempty(schoolGroup)
      tbM(tbM.degree ~= schoolGroup, :) = [];
   end
   
   dS = WeightedDataLH(tbM.wage, tbM.wtsupp);
   
   outM.stdLog(iy) = sqrt(dS.var_log);
   qV = dS.quantiles([0.1, 0.25, 0.5, 0.75, 0.9]);
   outM.R9010(iy) = qV(5) ./ qV(1);
   outM.R7525(iy) = qV(4) ./ qV(2);
   outM.R9050(iy) = qV(5) ./ qV(3);
   outM.R5010(iy) = qV(3) ./ qV(1);
end


%% Save

% if isempty(schoolGroup)
%    suffixStr = [];
% else
%    suffixStr = c
% end
if isempty(schoolGroup)
   var_save_hcps(outM, 'wage_dispersion', setName);
else
   var_save_hcps(outM, 'wage_dispersion', setName,  'schoolGroup', schoolGroup);
end

end