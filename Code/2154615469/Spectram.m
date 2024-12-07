Fs = 1000;
t = linspace(0,1,Fs);
x = cos(2*pi*10*t)+0.2*randn(size(t));
minm=min(x);
x=100*((x)-minm);
x=int32(x);

fileID = fopen('FilterIN.txt','w');
fprintf(fileID,'%5d \n',x);
fclose(fileID);