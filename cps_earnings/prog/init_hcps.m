function init_hcps

disp('Startup CPS code for honors class');
dirS = param_hcps.Directories;
addpath(dirS.progDir);

project_start('cps');

cd(dirS.progDir);

end