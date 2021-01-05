function [fitresult, gof] = createFit1(Months, TaL, HgL)
%CREATEFIT1(MONTHS,TAL)
%  Create a fit.
%
%  Data for 'Ambient Temperature' fit:
%      X Input : Months
%      Y Output: TaL
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 04-Jan-2021 13:32:12


%% Fit: 'Ambient Temperature'.
[xData, yData] = prepareCurveData( Months, TaL );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );
opts = fitoptions( 'Method', 'SmoothingSpline' );
opts.SmoothingParam = 0.999998144258912;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Ambient Temperature' );
yyaxis right
h = plot( fitresult, xData, yData ,'ko'  );
legend( h, 'Ta vs. Months', 'Ambient Temperature' , 'Location', 'Best' , [237 191 160 160] );
% Label axes
yyaxis right
xlabel Months
ylabel('Temperature(�C)')
ylim([0 35])
yyaxis left
ylabel('Global Horizontal Radiation (KW-hr / m^2 / Day)')
grid on
hold on;
yyaxis left
h2 = bar(Months, HgL ,0.5 , 'DisplayName','Average GHI');
title('Global Horizontal Irradiance(GHI) and Ambient Temperature');
end



