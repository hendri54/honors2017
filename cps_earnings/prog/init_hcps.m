function init_hcps
% Assumes that shared code and CPS code are on path

disp('Startup CPS code for honors class');
dirS = param_hcps.Directories('default');
addpath(dirS.progDir);

% project_start('cps');

cd(dirS.progDir);

end