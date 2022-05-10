

clc;
clear all;
close all;
bit_count=100000;
SNR=0:1:10;
for k=1:1:length(SNR)
    tote=0;
    totb=0;
    while tote<100
        rbits=round(rand(1,bit_count));
        tx= -2*(rbits-0.5);
        N0=1/10^(SNR(k)/10);
        rx=tx+sqrt(N0/2)*(randn(1,length(tx))+i*randn(1,length(tx)));
        rx2=rx<0;
        diff=rbits-rx2;
        tote=tote+sum(abs(diff));
        totb=totb+length(rbits);
    end
    BER(k)=tote/totb;
end
semilogy(SNR,BER,'*r');
hold on;
xlabel('EB/N0(dB)');
ylabel('BER');
title('EB/N0(SNR) VS BER for BPSK MODULATION IN AWGN CHANNEL');
thber=0.5*erfc(sqrt(10.^(SNR/10)));
semilogy(SNR,thber);
grid on;
legend('simulated curve','Theoretical curve');