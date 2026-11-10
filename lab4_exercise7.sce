clc;
clear;

x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];

N = max(length(x), length(h));
x_pad = [x, zeros(1, N - length(x))];
h_pad = [h, zeros(1, N - length(h))];

y = zeros(1, N);

for n = 0:N-1
    for k = 0:N-1
        index = pmodulo(n-k, N);
        y(n+1) = y(n+1) + h_pad(k+1) * x_pad(index+1);
    end
end

nx = 0:N-1;

Ex = sum(x_pad.^2);
Ey = sum(y.^2);

disp("EXERCISE 7 - CIRCULAR CONVOLUTION");
disp("Output y(n):");
disp(y);
mprintf("Energy Ex = %f\n", Ex);
mprintf("Energy Ey = %f\n", Ey);

scf(7);
clf();

subplot(2,2,1);
plot2d3(nx, x_pad);
xgrid();
xtitle("Input Signal x(n)", "n", "Amplitude");

subplot(2,2,2);
plot2d3(nx, y);
xgrid();
xtitle("Circular Convolution y(n)", "n", "Amplitude");

subplot(2,2,3);
plot2d3(nx, x_pad.^2);
xgrid();
xtitle("Energy of x(n)", "n", "|x(n)|^2");

subplot(2,2,4);
plot2d3(nx, y.^2);
xgrid();
xtitle("Energy of y(n)", "n", "|y(n)|^2");

xs2png(gcf(), "Lab4_Exercise7.png");
