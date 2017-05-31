function wage_dispersion_show(setName)

dirS = param_hcps.Directories(setName);
tbM = var_load_hcps('wage_dispersion', setName, []);

% One graph per statistic
varNameV = {'stdLog', 'R9010', 'R7525', 'R9050', 'R5010'};
outFnV = varNameV;
xLimLowV = [0, 0, 0, 0, 0];

for iFig = 1 : length(varNameV)
   varName = varNameV{iFig};

   fS = FigureLH('visible', false);
   fS.new;
   fS.plot_line(tbM.year, tbM.(varName), 1);
   xlabel('Year');
   ylabel(varName);
   if ~isnan(xLimLowV(iFig))
      fS.axis_range([NaN, NaN, xLimLowV(iFig), NaN])
   end
   fS.format;
   fS.save(fullfile(dirS.outDir, outFnV{iFig}), true);
end


end