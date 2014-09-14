fnm = cellstr(ls('*.csv'));
for i = 1:length(fnm)
    raweeg = csvread(fnm{i},2560,1); % read 5 seconds from csv
    alpha = filter(alphafilter, raweeg); % filter alpha (8-13 Hz)
    beta = filter(betafilter, raweeg); % filter beta (13-30 Hz)
    medianalpha = median(alpha); % calculate median for alpha
    medianbeta = median(beta); % calculate median for beta
    Y = [medianalpha medianbeta]; % save results for this iteration
    X = [X Y]; % append this iteration to the other results
    disp([num2str(i) '. Datensatz fertig'])
end
save('cal.mat', 'X')
