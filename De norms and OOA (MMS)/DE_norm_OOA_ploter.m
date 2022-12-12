clear;clc;
close all;

% For plotting DE norms and OOA for MMS case
data1=load('33x33_MMS_SGS_CFL_09_Rkap_01_C4_0001_Re100@2011.mat');
data2=load('65x65_MMS_SGS_CFL_09_Rkap_01_C4_0001_Re100@7594.mat');
data3=load('129x129_MMS_SGS_CFL_09_Rkap_01_C4_0001_Re100@29899.mat');

h(1)= data1.xmax/data1.imax;
h(2)= data2.xmax/data2.imax;
h(3)= data3.xmax/data3.imax;

PrL1normvec=[data1.rL1norm(1),data2.rL1norm(1),data3.rL1norm(1)];
UrL1normvec=[data1.rL1norm(2),data2.rL1norm(2),data3.rL1norm(2)];
VrL1normvec=abs([data1.rL1norm(3),data2.rL1norm(3),data3.rL1norm(3)]);

PrLinfnormvec=[data1.rLinfnorm(1),data2.rLinfnorm(1),data3.rLinfnorm(1)];
UrLinfnormvec=[data1.rLinfnorm(2),data2.rLinfnorm(2),data3.rLinfnorm(2)];
VrLinfnormvec=[data1.rLinfnorm(3),data2.rLinfnorm(3),data3.rLinfnorm(3)];



OOA_P_L1vec=[log(PrL1normvec(2)/PrL1normvec(1))/log(h(2)/h(1)),log(PrL1normvec(3)/PrL1normvec(2))/log(h(3)/h(2))];
OOA_P_Linfvec=[log(PrLinfnormvec(2)/PrLinfnormvec(1))/log(h(2)/h(1)),log(PrLinfnormvec(3)/PrLinfnormvec(2))/log(h(3)/h(2))];

OOA_U_L1vec=[log(UrL1normvec(2)/UrL1normvec(1))/log(h(2)/h(1)),log(UrL1normvec(3)/UrL1normvec(2))/log(h(3)/h(2))];
OOA_U_Linfvec=[log(UrLinfnormvec(2)/UrLinfnormvec(1))/log(h(2)/h(1)),log(UrLinfnormvec(3)/UrLinfnormvec(2))/log(h(3)/h(2))];

OOA_V_L1vec=[log(VrL1normvec(2)/VrL1normvec(1))/log(h(2)/h(1)),log(VrL1normvec(3)/VrL1normvec(2))/log(h(3)/h(2))];
OOA_V_Linfvec=[log(VrLinfnormvec(2)/VrLinfnormvec(1))/log(h(2)/h(1)),log(VrLinfnormvec(3)/VrLinfnormvec(2))/log(h(3)/h(2))];

figure()
loglog(h',PrL1normvec','-*b')
hold on
loglog(h',PrLinfnormvec','--*b')
loglog(h',UrL1normvec','- *r')
loglog(h',UrLinfnormvec','--*r')
loglog(h',VrL1normvec','- *g')
loglog(h',VrLinfnormvec','--*g')
legend('p:L1','p:Linf','u:L1','u:Linf','v:L1','v:Linf')
xlabel('h')
ylabel('Discretization error norms')
title('Discretization error norms vs h')
hold off 

figure()
plot(h(1:end-1)',OOA_P_L1vec','-*b')
hold on
plot(h(1:end-1)',OOA_P_Linfvec','--*b')
plot(h(1:end-1)',OOA_U_L1vec','- *r')
plot(h(1:end-1)',OOA_U_Linfvec','--*r')
plot(h(1:end-1)',OOA_V_L1vec','- *g')
plot(h(1:end-1)',OOA_V_Linfvec','--*g')
legend('p:L1','p:Linf','u:L1','u:Linf','v:L1','v:Linf')
xlabel('h')
ylabel('Observed order of accuracy')
title('Observed order of accuracy vs h')
