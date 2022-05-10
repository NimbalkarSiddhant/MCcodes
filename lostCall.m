clc
clear all;
close all;

N = input('Enter the number of trunks');
A = input('Enter the value of A');
kk=1;

for n=1:N
  num = power(A,n)/factorial(n);
  den = 0;
  for k=0:N
    den = den+ power(A,k)/factorial(k);
  endfor
    final(kk)=num/den;
    kk = kk + 1;
endfor

disp(final);

n=1:N
  stem(n,final);
  xlabel('Number of trunks');
  ylabel('GOS');
  hold on;
  
  plot(n,final);
  hold on;
