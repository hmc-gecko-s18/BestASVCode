voltage = [.58 .48 .52 .45 .42]; %percent of max fan speed
%REQUIRES ATTENTION
turb = [2.2 25 65 107 184]; %read in the white box
%REQUIRES ATTENTION
xmeas = voltage; %copying variable names for copy pasta purposes
ymeas = turb;

%coefficients of the fit and information about the errors
%REQUIRES ATTENTION
order = 1; %order of the polynomial fit
[coefficients, S] = polyfit(xmeas, ymeas, order); 

%values to plot the best fit curve over
%REQUIRES ATTENTION
xstart = .4; %start and end values to cover the range
%REQUIRES ATTENTION
xend = .6; %of the measured data
x0 = linspace(xstart,xend,100); 

%bestfit is the y values of the best fit, delta is something about the errors
[bestfit, delta] = polyval(coefficients, x0, S);

%uncertainties on the best fit line
upper = bestfit + delta;
lower = bestfit - delta;

%plot the original data and the best fit line with its uncertainties
plot(xmeas,ymeas,'*k');
hold on;
plot(x0, bestfit,'-k');
hold on;
plot(x0, upper, '-r');
hold on;
plot(x0, lower, '-r');
%REQUIRES ATTENTION
xlabel('Voltage (V)');
%REQUIRES ATTENTION
ylabel('Turbidity (ntu)');
title('Turbidity vs Voltage for Straight Across Photodiode');
legend('Measured Data','Best Fit','Best Fit + Uncertainty','Best Fit - Uncertainty');
%REQUIRES ATTENTION
text(.5, 0, ['Turbidity = ' num2str(coefficients(1)) ' * Voltage + ' num2str(coefficients(2))]);

