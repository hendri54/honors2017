function weeksV = make_weeks_worked(tbM, setName, year1)

varS = vars_cps.WksWork2;
weeksV = varS.recode_to_weeks(tbM.wkswork2);

end