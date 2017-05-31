function [fPath, fDir] = var_fn_hcps(varNameStr, setName, year1)
% File name for a variable file

if isempty(year1)
   yearStr = [];
else
   yearStr = sprintf('_%i', year1);
end

dirS = param_hcps.Directories(setName);
fDir = dirS.matDir;
fPath = fullfile(fDir, [varNameStr, yearStr, '.mat']);

end