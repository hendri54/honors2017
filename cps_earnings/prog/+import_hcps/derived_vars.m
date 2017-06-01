function derived_vars(setName)
% Add derived variables to imported files

cS = const_hcps(setName);

for year1 = cS.yearV(:)'
   tbM = var_load_hcps('data_main', setName, 'year', year1);
   
   tbM.weeksWorked = import_hcps.make_weeks_worked(tbM, setName, year1);
   tbM.wage = import_hcps.make_wage(tbM, setName, year1);
   
   [tbM.degree, tbM.yrSchool] = import_hcps.make_schooling(tbM, setName, year1);
   
   var_save_hcps(tbM, 'data_main', setName, 'year', year1);
end

end