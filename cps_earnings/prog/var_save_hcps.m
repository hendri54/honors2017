function var_save_hcps(saveS, varNameStr, setName, varargin)
% Save a MAT variable
%{
Make directory if needed
%}

fnS = var_fn_hcps(varNameStr, setName, varargin{:});
fnS.mkdir;

save(fnS.path, 'saveS');
fprintf('Saved file [%s]\n',  fnS.name);

end