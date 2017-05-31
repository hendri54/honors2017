function var_save_hcps(saveS, varNameStr, setName, year1)
% Save a MAT variable
%{
Make directory if needed
%}

[fn, fDir] = var_fn_hcps(varNameStr, setName, year1);

if ~exist(fDir, 'dir')
   filesLH.mkdir(fDir);
end

save(fn, 'saveS');
fprintf('Saved file [%s] [%i]\n',  varNameStr, year1);

end