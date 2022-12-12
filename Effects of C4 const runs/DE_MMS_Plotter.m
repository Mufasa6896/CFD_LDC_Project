clear;clc;
close all;


%% for ploting DE error at y=0.042 &   0<x<0.01\
% FOR DE PLOTING, ALL RUNS MUST BE ON EQUAL SIZE GRIDS!!!

data1=load('33x33_MMS_SGS_CFL_05_Rkap_01_C4_002_Re100@5043.mat');
% data2=load('33x33_MMS_SGS_CFL_05_Rkap_01_C4_001_Re100@4819.mat');
data3=load('33x33_MMS_SGS_CFL_05_Rkap_01_C4_0005_Re100@4705.mat');
data4=load('33x33_MMS_SGS_CFL_05_Rkap_01_C4_0001_Re100@4606.mat');
data5=load('33x33_MMS_SGS_CFL_05_Rkap_01_C4_00001_Re100@4595.mat');


% set x and y varibles
xmin=data1.xmin;xmax=data1.xmax;imax=data1.imax;
ymin=data1.ymin;ymax=data1.ymax;jmax=data1.jmax;

XX=linspace(xmin,xmax,imax);
YY=linspace(ymin,ymax,jmax);

% find the x indexs that corispond to  0<x<.01
[~,X_DE_idx]=find(XX<=0.01);
X_DE_idx=X_DE_idx(end);

% Find the y index that is closest to 0.42 m
Y_DE_pos=0.042;
Y_DE_Tol=.9*(ymax-ymin)/jmax;
[~,Y_DE_idx]=find(abs(YY-Y_DE_pos)<Y_DE_Tol);


figure()
plot(XX(1:X_DE_idx)',data1.DE(1:X_DE_idx,Y_DE_idx,1)')
hold on
% plot(XX(1:X_DE_idx)',data2.DE(1:X_DE_idx,Y_DE_idx,1)')
plot(XX(1:X_DE_idx)',data3.DE(1:X_DE_idx,Y_DE_idx,1)')
plot(XX(1:X_DE_idx)',data4.DE(1:X_DE_idx,Y_DE_idx,1)')
plot(XX(1:X_DE_idx)',data5.DE(1:X_DE_idx,Y_DE_idx,1)')
legend('C4=0.02',...'C4=0.01',
    'C4=0.005','C4=0.001','C4=0.0001')
ylim([-.001,.001])
xlabel('x position (m)')
ylabel('DE in pressure (Pa)')
title('DE in pressure vs x position @ y=0.042 m on 33x33 grid')
hold off