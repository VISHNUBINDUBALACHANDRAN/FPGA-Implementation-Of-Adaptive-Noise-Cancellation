clc;
clear all;
close all;


load ECG_rec_3m.mat;

ECG_withNoice=val(1,1:end);
ss=int8(ECG_withNoice);
ECG_Filter=val(2,1:end);

x=ECG_withNoice;
minX=min(x);
x=(x-minX)/2;

 figure(1),plot(x);
 k=zeros(1,length(x)+50);
 
k(50:length(x)+49)=x;


s = serial('COM1','Baudrate',115200);

fopen(s);


for i=2:5002
       fprintf(s,'%s','*');   
    for j=-1:48 
         
         fwrite(s,k(i+j),'uint8');

    end
    
     

end    

fclose(s);


