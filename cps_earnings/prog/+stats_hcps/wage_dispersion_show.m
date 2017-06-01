function wage_dispersion_show(bySchool, setName)

assert(isa(bySchool, 'logical'));
cS = const_hcps(setName);
ns = length(cS.sLabelV);
dirS = param_hcps.Directories(setName);


%% Load

if bySchool
   tbV = cell(ns, 1);
   for i_s = 1 : ns
      tbV{i_s} = var_load_hcps('wage_dispersion', setName,  'schoolGroup',  cS.sLabelV{i_s});
   end
else
   tbM = var_load_hcps('wage_dispersion', setName);
end


%% One graph per statistic

varNameV = {'stdLog', 'R9010', 'R7525', 'R9050', 'R5010'};
outFnV = varNameV;
xLimLowV = [0, 0, 0, 0, 0];

for iFig = 1 : length(varNameV)
   varName = varNameV{iFig};

   fS = FigureLH('visible', false);
   fS.new;
   hold on;
   
   if bySchool
      for i_s = 1 : ns
         fS.plot_line(tbV{i_s}.year, tbV{i_s}.(varName), i_s);
      end
   else
      fS.plot_line(tbM.year, tbM.(varName), 1);
   end
   
   hold off;
   xlabel('Year');
   ylabel(varName);
   if ~isnan(xLimLowV(iFig))
      fS.axis_range([NaN, NaN, xLimLowV(iFig), NaN])
   end
   if bySchool
      legend(cS.sLabelV,  'location', 'southoutside',  'orientation', 'horizontal');
      suffixStr = '_byschool';
   else
      suffixStr = '';
   end
   
   fS.format;
   fS.save(fullfile(dirS.outDir, [outFnV{iFig}, suffixStr]),  true);
end


end