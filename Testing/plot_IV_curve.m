function [] = plot_IV_curve(vS,iS)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%ylimit=inputdlg('Please enter desired y-axis limit');
%w = waitforbuttonpress;

%negylimit=-ylim;
%Force x-axis to use 250uA as peak so we don't see low level noise
axis([-50 50 -0.01 0.01]);

figure(1)
hold on

plot(vS,iS,'-o');

set(gca,'FontSize',12);
grid on;
xlabel("Measured Voltage at Gate [V]")
ylabel("Measured Current at Gate [A]")
title("I-V Curve Demonstrating Potential Breakdown over Input Voltage Range");
hold off;

end

