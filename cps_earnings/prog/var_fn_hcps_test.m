function tests = var_fn_hcps_test

tests = functiontests(localfunctions);

end

function oneTest(testCase)
   setName = 'default';
   varName = 'test1';
   year1 = 1980;
   sGroup = 'HSG';
   
   vS = var_fn_hcps(varName, setName);
   testCase.verifyEqual(vS.name, [varName, '.mat']);
   assert(isa(vS.dir, 'char'));
   assert(isa(vS.path, 'char'));
   
   
   vS = var_fn_hcps(varName, setName, 'year', year1);
   testCase.verifyEqual(vS.name, [varName, sprintf('_%i', year1), '.mat']);
   
   vS = var_fn_hcps(varName, setName, 'year', year1, 'schoolGroup', sGroup);
   testCase.verifyEqual(vS.name, [varName, sprintf('_%i_s2', year1), '.mat']);
end