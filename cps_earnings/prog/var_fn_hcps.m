% File name for a variable file
classdef var_fn_hcps < handle

properties
   varName  char
   setName  char
   year  double = []
   schoolGroup  char = []
end


methods
   %% Constructor
   function vS = var_fn_hcps(varNameIn, setNameIn, varargin)
      vS.varName = varNameIn;
      vS.setName = setNameIn;
      
      if ~isempty(varargin)
         assert(rem(length(varargin), 2) == 0,  'Requires even number of inputs')
         functionLH.varargin_parse(vS, varargin);
      end
   end
   
   
   %% Directory
   function fDir = dir(vS)
      dirS = param_hcps.Directories(vS.setName);
      fDir = dirS.matDir;
   end
   
   
   %% File name
   function fName = name(vS)
   
      if isempty(vS.year)
         yearStr = [];
      else
         yearStr = sprintf('_%i', vS.year);
      end
      
      if isempty(vS.schoolGroup)
         sStr = [];
      else
         sIdx = find(strcmp(vS.schoolGroup, {'HSD', 'HSG', 'CD', 'CG'}));
         sStr = sprintf('_s%i', sIdx);
      end
      
      fName = [vS.varName, yearStr, sStr, '.mat'];
   end
   
   
   %% Full path
   function fPath = path(vS)
      fPath = fullfile(vS.dir, vS.name);
   end
   
   
   %% Make directory, if it does not exist
   function mkdir(vS)
      fDir = vS.dir;
      if ~exist(fDir, 'dir')
         filesLH.mkdir(fDir);
      end
   end
end

end