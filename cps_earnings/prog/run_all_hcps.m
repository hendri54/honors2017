function run_all_hcps(setName)

dirS = param_hcps.Directories(setName);
dirS.make_dirs;

% Import cps data files
import_hcps.import(setName);
% Make derived variables
import_hcps.derived_vars(setName);

% Filter +++++

% Compute wage dispersion
stats_hcps.wage_dispersion(setName);
stats_hcps.wage_dispersion_show(setName);

end