function tests = var_save_hcps_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   xV = 1 : 10;
   setName = 'default';
   varName = 'test1';
   year1 = 1980;
   var_save_hcps(xV, varName, setName, year1);
   loadV = var_load_hcps(varName, setName, year1);
   testCase.verifyEqual(loadV, xV);
end