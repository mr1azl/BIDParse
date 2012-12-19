spillmat = max(0, regmat-spillthresh);
fprintf('Total reads=%d, total spills=%d, Mean-max spill=%4.2f\n',...
        sum(gcounts(:))+sum(lcounts(:))+sum(rcounts(:)), ...
        sum(spillmat(:)), mean(max(spillmat,[],2)));