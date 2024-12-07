load ECG_rec_3m.mat;

ECG_withNoice=val(1,1:end);

ECG_Filter=val(2,1:end);

subplot(2,1,2);
plot(ECG_withNoice(200:2000));
subplot(2,1,1);
plot(ECG_Filter(200:2000));

x=ECG_withNoice;
minX=min(x);
x=int32(x-minX);

fileID = fopen('ECG_IN.txt','w');
fprintf(fileID,'%5d \n',x);
fclose(fileID);

figure,plot(x);