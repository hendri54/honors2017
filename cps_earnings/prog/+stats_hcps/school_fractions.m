function frac_ysM = school_fractions(setName)
% Show school fractions over time

cS = const_hcps(setName);

ns = length(cS.sLabelV);
ny = length(cS.yearV);

frac_ysM = nan([ny, ns]);

for iy = 1 : ny
   tbM = var_load_hcps('data_main', setName, 'year', cS.yearV(iy));
   mass_sV = zeros(ns, 1);
   for i_s = 1 : ns
      idxV = find(tbM.degree == cS.sLabelV{i_s});
      assert(length(idxV) > 500);
      mass_sV(i_s) = sum(tbM.wtsupp(idxV));
   end
   
   frac_ysM(iy,:) = mass_sV ./ sum(mass_sV);
end

validateattributes(frac_ysM, {'double'}, {'finite', 'nonnan', 'nonempty', 'real', 'positive', '<', 0.6, ...
   'size', [ny, ns]})

end