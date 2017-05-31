function test_all_hcps

import matlab.unittest.TestSuite

progDir = fileparts(mfilename('fullpath'));

displayV = [TestSuite.fromFolder(progDir),  TestSuite.fromPackage('import_hcps'),  ...
   TestSuite.fromPackage('param_hcps'),  TestSuite.fromPackage('stats_hcps'),  TestSuite.fromPackage('vars_hcps')];

run(displayV);


end