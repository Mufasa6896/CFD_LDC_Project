clear;clc;
close all;

% For plotting residuals of SGS and PJ and comparing
data1=load('65x65_MMS_PJ_CFL_02_Rkap_01_C4_0001_Re100@55324.mat');
data2=load('65x65_MMS_SGS_CFL_02_Rkap_01_C4_0001_Re100@50378.mat');
data3=load('65x65_MMS_SGS_CFL_09_Rkap_01_C4_0001_Re100@7594.mat');


    figure()
    plot(data1.nvec,data1.resvec,"--")
    hold on
    plot(data2.nvec,data2.resvec,"-.")
    plot(data3.nvec,data3.resvec)
    ylim([0,1])
    legend('65x65: Point Jacobi','65x65: Point Jacobi','65x65: Point Jacobi'...
        ,'65x65: SGS CFL: 0.2','65x65: SGS CFL: 0.2','65x65: SGS CFL: 0.2'...
        ,'65x65: SGS CFL: 0.9','65x65: SGS CFL: 0.9','65x65: SGS CFL: 0.9')
    set(gca, 'YScale', 'log')