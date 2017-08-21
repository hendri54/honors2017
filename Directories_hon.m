% Defines directory structure
classdef Directories_hon < handle

properties 
   % Everything hangs off this directory. Adjust to your computer's file structure
   baseDir  char
   % Shared code (general purpose)
   sharedDir  char
   % General purpose CPS program files
   cpsDir  char
   % Code with `export_fig`
   exportFigDir  char
end

methods
   %% Constructor
   function dirS = Directories_hon
      userDir = '/Users/lutz';
      dirS.baseDir = fullfile(userDir, 'Dropbox', 'classes', 'honors', 'code');
      dirS.sharedDir = fullfile(dirS.baseDir, 'shared');
      dirS.cpsDir = fullfile(userDir, 'Documents', 'econ', 'data', 'Cps', 'prog');
      dirS.exportFigDir = fullfile(userDir, 'Documents', 'econ', 'Matlab', 'github', 'export_fig');
   end
end
   
end