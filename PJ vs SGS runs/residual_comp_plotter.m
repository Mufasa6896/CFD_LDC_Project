clear;clc;
close all;

% For plotting residuals of SGS and PJ and comparing
data1=load('65x65_MMS_PJ_CFL_02_Rkap_01_C4_0001_Re100@55324.mat');
data2=load('65x65_MMS_SGS_CFL_02_Rkap_01_C4_0001_Re100@50378.mat');
data3=load('65x65_MMS_SGS_CFL_09_Rkap_01_C4_0001_Re100@7594.mat');


xx=linspace(data3.xmin,data3.xmax,data3.imax);
yy=linspace(data3.ymin,data3.ymax,data3.jmax);

contlevelsU=(.44:.02:.8);
colorsizeU=length(contlevelsU);
contlevelsV=(.5:.02:.7);
colorsizeV=length(contlevelsV);
contlevelsP=(.25:.05:1);
colorsizeP=length(contlevelsP);

axtix_y=(data3.ymin:0.01:data3.ymax);  
axtix_x=(data3.xmin:0.01:data3.xmax);

[X,Y]=meshgrid(xx,yy);



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

 figure()
contourf(X,Y,data3.u(:,:,2)',contlevelsU)
colormap(jet(colorsizeU))
colorbar
hold on
yticks(axtix_y)
xlabel('x(m)')
ylabel('y(m)')
title(['SGS u vel (m/s) ',num2str(data3.imax),'x',num2str(data3.jmax),' grid'])
axis equal
hold off

 figure()
contourf(X,Y,data1.u(:,:,2)',contlevelsU)
colormap(jet(colorsizeU))
colorbar
hold on
yticks(axtix_y)
xlabel('x(m)')
ylabel('y(m)')
title(['Point Jacobi u vel (m/s) ',num2str(data3.imax),'x',num2str(data3.jmax),' grid'])
axis equal
hold off