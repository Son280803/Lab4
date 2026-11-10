clc;
clear;
clf();

x = [1 2 -3 2 1];
h = [1 0 -1];

y = convol(x, h);

nx = 0:length(x)-1;
ny = 0:length(y)-1;

Ex = sum(x.^2);
Ey = sum(y.^2);

disp("EXERCISE 6 - LINEAR CONVOLUTION");
disp("Output y(n):");
disp(y);
mprintf("Energy Ex = %f\n", Ex);
mprintf("Energy Ey = %f\n", Ey);

scf(6);
clf();

subplot(2,2,1);
plot2d3(nx, x);
xgrid();
xtitle("Input Signal x(n)", "n", "Amplitude");

subplot(2,2,2);
plot2d3(ny, y);
xgrid();
xtitle("Linear Convolution y(n)", "n", "Amplitude");

subplot(2,2,3);
plot2d3(nx, x.^2);
xgrid();
xtitle("Energy of x(n)", "n", "|x(n)|^2");

subplot(2,2,4);
plot2d3(ny, y.^2);
xgrid();
xtitle("Energy of y(n)", "n", "|y(n)|^2");

xs2png(gcf(), "Lab4_Exercise6.png");
