function data = readFile(filename, nS)
% Reading the raw csv file and cleaning it

data = -xlsread(filename, ['AJ18:AMU' num2str(nS*30+15)]);

data = reshape(data(~isnan(data)), [nS*28, 1000]);

end