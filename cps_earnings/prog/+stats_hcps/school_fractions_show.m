function school_fractions_show(setName)

cS = const_hcps(setName);

frac_ysM = stats_hcps.school_fractions(setName);
ns = size(frac_ysM, 2);



fS = FigureLH('visible', false);
fS.new;
hold on;

for i_s = 1 : ns
   fS.plot_line(cS.yearV,  frac_ysM(:,i_s), i_s);
end

xlabel('Year');
ylabel('Fraction');
fS.axis_range([NaN, NaN, 0, NaN])
legend(cS.sLabelV, 'location', 'southoutside', 'orientation', 'horizontal');
fS.format;

dirS = param_hcps.Directories(setName);
fS.save(fullfile(dirS.outDir, 'school_fractions'), true);


end