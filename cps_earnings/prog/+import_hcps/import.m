function import(setName)
% Import cps data files
%{
Basic filtering
%}

fprintf('\nImporting data from CPS\n\n');

cS = const_hcps(setName);

for year1 = cS.yearV(:)'
   % Read the cps file
   tbM = vars_cps.load_vars(cS.varNameV, year1, 'data_main');
   n = size(tbM, 1);
   
   % Basic filtering
   validV = (tbM.age >= cS.filterS.ageMin)  &  (tbM.age <= cS.filterS.ageMax)  &  (tbM.empstat == 10)  &  ...
      (tbM.classwkr == 21);
   if cS.filterS.fullTime
      validV(tbM.wkswork2 < 3  |  tbM.wkswork2 > 6) = false;
   end
   
   tbM(~validV,:) = [];
   
   var_save_hcps(tbM, 'data_main', setName, 'year', year1);
   
   fprintf('%i:  Observations %i / %i k \n',  year1,  round(n/1e3),  round(size(tbM,1) ./ 1e3));
end

end