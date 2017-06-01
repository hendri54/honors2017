function [loadV, success] = var_load_hcps(varNameStr, setName, varargin)

fnS = var_fn_hcps(varNameStr, setName, varargin{:});

if exist(fnS.path, 'file')
   % Some variables are output as single by StatTransfer
   loadV = load(fnS.path);
   loadV = loadV.saveS;
else
   loadV = [];
   success = 0;
end

end