% This scripts solves battery problem outlined in Tutorial I of Numerical
% Methods I course of year 2020.
%
% This scripts is meant as a tutorial on how to solve statistical problems
% in Matlab. Especially in context ETS2.
%
% Author: Aleksejus Kononovicius
% License: CC-BY
%

clear all;

% Setting the seed of the random number generator
rng(1440);

% General settings which will be used throught the simulation.
meanBatteryTime = 240; % hours
stdBatteryTime = 10; % hours (applicable only to normally distributed)
nSamples = int64(1e5);

%% Q1: Calculating mean operation time

% Generate mouse operational times
mouseTimes = generateMouseOpTime(meanBatteryTime, nSamples);
meanMouseTime = mean(mouseTimes);

fprintf('Average operational time of mouse with two batteries: ');
fprintf('%.2f hours.\n', meanMouseTime);

%% Q2: Distribution of operation time

% Here we estimate empirical PDF of the operation times
pdf.x = [];
pdf.y = [];
[pdf.y, pdf.x] = ksdensity(mouseTimes,'Support','positive');

% Plotting empirical PDF
figure(1);
clf();

semilogy(pdf.x,pdf.y,'r','DisplayName','Empirical PDF');
hold on;
semilogy(pdf.x,exppdf(pdf.x,meanMouseTime),'k',...
    'DisplayName','Exponential PDF');
hold off;

xlabel('T_M');
ylabel('p(T_M)');
title('Mouse operation times with "replace both" strategy');

legend('show');
grid on;

%% Q3: Exploring total service times of two different strategies
%
% Here we explore mouse service times when two different battery
% replacement strategies are used.
%

% For "replace both" strategy we get a total service time of:
totalServiceTimeBoth = sum(mouseTimes);
fprintf('For "replace both" total service time is %.2f hours.\n',...
    totalServiceTimeBoth);

% For "replace bad" strategy we get a total service time of:
totalServiceTimeBad = generateBadServiceTime(meanBatteryTime, 2*nSamples);
fprintf('For "replace bad" total service time is %.2f hours.\n',...
    totalServiceTimeBad);

% What is the gain of using "replace bad" strategy?
fprintf('"Replace bad" strategy %.2f times as good.\n',...
    totalServiceTimeBad/totalServiceTimeBoth);

%% Q4: What if battery life times would be normally distributed?
%
% Now we assume that battery life times are normally distributed.
fprintf('\nNow we assume that battery life times are ');
fprintf('normally distributed.\n');

% For "replace both" strategy we get a total service time of:
mouseTimesN = generateMouseOpTimeN(meanBatteryTime, stdBatteryTime,...
    nSamples);
totalServiceTimeBothN = sum(mouseTimesN);
fprintf('For "replace both" total service time is %.2f hours.\n',...
    totalServiceTimeBothN);

% For "replace bad" strategy we get a total service time of:
totalServiceTimeBadN = generateBadServiceTimeN(meanBatteryTime,...
    stdBatteryTime, 2*nSamples);
fprintf('For "replace bad" total service time is %.2f hours.\n',...
    totalServiceTimeBadN);

% What is the gain of using "replace bad" strategy?
fprintf('"Replace bad" strategy %.2f times as good.\n',...
    totalServiceTimeBadN/totalServiceTimeBothN);
