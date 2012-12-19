function vx = simorder(matp)
  eps = 1e-7;
  ax1 = sparse(matp(:,2)+ max(matp(:,2))*(matp(:,3)-1), matp(:,1),1);
  ax2 = 0.1*sparse(matp(:,2), matp(:,1),1);
  ax3 = 0.1*sparse(matp(:,3), matp(:,1),1);
  ax = [ax1 ; ax2 ; ax3];
  aa = full(ax'*ax);
  saa2 = sum(aa,2);
  igood = find(saa2 >= 1e-4);
  ibad = find(saa2 < 1e-4);
  aa = aa(igood,igood);
  dd = sum(aa,2).^-0.5;
  bb = diag(dd) * aa * diag(dd);
  [vv ev] = eig(bb);
  vv2 = vv(:,2);
  [dmy iis] = sort(vv2);
  iinv = accumarray(iis, (1:length(iis))');
  vp = accumarray(igood, iinv - mean(iinv), [max(matp(:,1)) 1]);
  vp(ibad) = 1.0*(min(vp) + (max(vp)-min(vp))*rand(length(ibad),1));
  vx = vp(matp(:,1));
