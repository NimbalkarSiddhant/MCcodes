clc;
clear all;
close all;

d= 1:0.01:20;

hm = 5;
hb1=30;
hb2=100;
hb3=200;
fc = 1000;

ahm = 3.2*(log10(11.75*hm)).^2-4.97;

%for urban cites

L50urban1 = 69.55+26.16*log10(fc)+(44.9-6.55*log10(hb1)*log10(d)-13.82*log10(hb1))-ahm;
L50urban2 = 69.55+26.16*log10(fc)+(44.9-6.55*log10(hb2)*log10(d)-13.82*log10(hb2))-ahm;
L50urban3 = 69.55+26.16*log10(fc)+(44.9-6.55*log10(hb3)*log10(d)-13.82*log10(hb3))-ahm;

%for suburban

L50suburban1 = L50urban1-2*(log10(fc/28)).^2-5.4;
L50suburban2 = L50urban2-2*(log10(fc/28)).^2-5.4;
L50suburban3 = L50urban3-2*(log10(fc/28)).^2-5.4;

%for rural

L50rural1=L50urban1-4.78*(log10(fc)).^2+18.33*log10(fc)-40.94;
L50rural2=L50urban2-4.78*(log10(fc)).^2+18.33*log10(fc)-40.94;
L50rural3=L50urban3-4.78*(log10(fc)).^2+18.33*log10(fc)-40.94;

figure(1);
plot(d,L50urban1,'r',L50urban2,'--r',L50urban3,':r');
hold on;
legend('Large urban hb =30','Large urban hb =100','Large urban hb =200','suburban hb =30','suburban hb =100','suburban hb =200','rural hb =30','rural hb =100','rural hb =200');

figure(2);
plot(d,L50suburban1,'b',L50suburban2,'--b',L50suburban3,':b');
hold on;
legend('suburban hb =30','suburban hb =100','suburban hb =200');

figure(3);
plot(d,L50rural1,'g',L50rural2,'--g',L50rural3,':g');
hold on;
legend('rural hb =30','rural hb =100','rural hb =200');

grid on;
xlabel('d [km]');
ylabel('L [dB]');
title('Hata Model for different base station ant. ht. in different environments');
