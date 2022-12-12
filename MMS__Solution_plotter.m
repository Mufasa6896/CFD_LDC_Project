clear;clc;
close all;


%% For plotting individual u/v/p results (contour plots, streamlines, raw plots)
% for MMS solutions
load('65x65_MMS_SGS_CFL_09_Rkap_01_C4_0001_Re100@7594.mat');

U=u(:,:,2)';
V=u(:,:,3)';
P=u(:,:,1)';





xx=linspace(xmin,xmax,imax);
yy=linspace(ymin,ymax,jmax);

contlevelsU=(.44:.02:.8);
colorsizeU=length(contlevelsU);
contlevelsV=(.5:.02:.7);
colorsizeV=length(contlevelsV);
contlevelsP=(.25:.05:1);
colorsizeP=length(contlevelsP);

axtix_y=(ymin:0.01:ymax);  
axtix_x=(xmin:0.01:xmax);

[X,Y]=meshgrid(xx,yy);

% risidual plot
figure()
  plot(nvec,resvec)
  ylim([0,1])
  xlabel('iteration')
  ylabel('residuals')
  legend('Continuity','x-momentum','y-momentum')
  set(gca, 'YScale', 'log')

% contour plots (u,v,p)
figure()
contourf(X,Y,U,contlevelsU)
colormap(jet(colorsizeU))
colorbar
hold on
yticks(axtix_y)
xlabel('x(m)')
ylabel('y(m)')
title(['u vel (m/s) ',num2str(imax),'x',num2str(jmax),' grid'])
axis equal
hold off

figure()
contourf(X,Y,V,contlevelsV)
colormap(jet(colorsizeV))
colorbar
hold on
yticks(axtix_y)
xlabel('x(m)')
ylabel('y(m)')
title(['v vel (m/s) ',num2str(imax),'x',num2str(jmax),' grid'])
axis equal
hold off

figure()
contourf(X,Y,P,contlevelsP)
colormap(jet(colorsizeP))
colorbar
hold on
yticks(axtix_y)
xlabel('x(m)')
ylabel('y(m)')
title(['Pressure (Pa) ',num2str(imax),'x',num2str(jmax),' grid'])
axis equal
hold off

% u contour plot with streamlines
figure()
contourf(X,Y,U,contlevelsU)
colormap(turbo(colorsizeU))
colorbar
hold on
SLU=streamslice(X,Y,U,V,.5);
set(SLU,'Color','k')
yticks(axtix_y)
xlabel('x(m)')
ylabel('y(m)')
title(['u vel (m/s) with streamlines ',num2str(imax),'x',num2str(jmax),' grid'])
axis equal
hold off

% u,v,p 'raw' plots
figure()
surf(X,Y,U)
view(2)
yticks(axtix_y)
xticks(axtix_x)
colorbar
xlabel('x(m)')
ylabel('y(m)')
title(['u vel (m/s) raw ',num2str(imax),'x',num2str(jmax),' grid'])
shading interp
colormap(turbo(512))

figure()
surf(X,Y,V)
view(2)
yticks(axtix_y)
xticks(axtix_x)
colorbar
xlabel('x(m)')
ylabel('y(m)')
title(['v vel (m/s) raw ',num2str(imax),'x',num2str(jmax),' grid'])
shading interp
colormap(turbo(512))

figure()
surf(X,Y,P)
view(2)
yticks(axtix_y)
xticks(axtix_x)
colorbar
xlabel('x(m)')
ylabel('y(m)')
title(['Pressure (Pa) raw ',num2str(imax),'x',num2str(jmax),' grid'])
shading interp
colormap(turbo(512))

