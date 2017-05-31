classdef Directories < handle

properties
   setName  char
   baseDir  char
   progDir  char
   setDir   char
   matDir   char
   outDir   char
end

methods
   function dirS = Directories(setName)
      dirS.setName = setName;
      dirS.baseDir = '/Users/lutz/Dropbox/classes/honors/code/cps_earnings';
      dirS.progDir = fullfile(dirS.baseDir, 'prog');
      dirS.setDir  = fullfile(dirS.baseDir, setName);
      dirS.matDir  = fullfile(dirS.setDir, 'mat');
      dirS.outDir  = fullfile(dirS.setDir, 'out');
   end
   
   
   %% Make required directories
   function make_dirs(dirS)
      dirV = {dirS.setDir, dirS.matDir, dirS.outDir};
      for i1 = 1 : length(dirV)
         filesLH.mkdir(dirV{i1});
      end
   end
end
   
end