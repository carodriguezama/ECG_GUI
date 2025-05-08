patient = [dir('*.info')];

for n=1:length(patient)
    names{n} = erase(patient(n).name, '.info');
    dates{n} = patient(n).date;
end
[t,ecg, Fs] = LoadMITecg(names{1});
smoothECG = sgolayfilt(ecg,7,201);
ecgLP = lowpass(ecg,4,Fs);
d = designfilt('bandstopiir','FilterOrder',2, ...
    'HalfPowerFrequency1',59,'HalfPowerFrequency2',61, ...
    'DesignMethod','butter','SampleRate',Fs);
ecgNotch = filtfilt(d,ecgLP);
[~,locs_Rwave] = findpeaks(ecgNotch, 'MinPeakHeight',(max(ecgNotch)-2) ...
    ,'MinPeakDistance',290);
figure
plot(t,ecgNotch)
hold on
plot(t(locs_Rwave),ecgNotch(locs_Rwave),'rv','MarkerFaceColor','r')
axis([0 200 -2 2])
currentplot = figure;
k=1:290:650000;

for i=1:(length(k)-1)
    m(i) = max(smoothECG(k(i):k(i+1)));
end
for j = 1:(length(m))
 h(j) = find(smoothECG == m(j));%get the indexes of the peaks
end
timepeaks2 = t(h);%find times from the peak indices
%find the sum of the difference between peaks time and average
avg2 = sum(diff(timepeaks2))/(length(k)-1);
avgHR = 60/avg2 %get avg beats/ min
file = names{1} + ".jpg"
saveas(currentplot, file)

