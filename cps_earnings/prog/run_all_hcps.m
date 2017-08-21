function run_all_hcps(setName)
% Run everything in sequence
%{
IN
   setName  ::  char
      defines settings used in data processing. See `const_hcps`
%}

cS = const_hcps(setName);

% Make required directories
dirS = param_hcps.Directories(setName);
dirS.make_dirs;

% Import cps data files
import_hcps.import(setName);
% Make derived variables
import_hcps.derived_vars(setName);

% Filter
% import_hcps.filter(setName);

% Compute wage dispersion
stats_hcps.wage_dispersion([], setName);
stats_hcps.wage_dispersion_show(false, setName);

% By schooling
stats_hcps.school_fractions_show(setName);
for i_s = 1 : length(cS.sLabelV)
   stats_hcps.wage_dispersion(cS.sLabelV{i_s}, setName);
end
stats_hcps.wage_dispersion_show(true, setName);

end