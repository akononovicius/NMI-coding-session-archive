% This main script of ets 2-2

clear all;

rng(1434);

nSamples = 1000;

%% Q1: Standard Gaussian rvs X are in [-1,1]

mu = 0;
sigma = 1;

simProb = simulate(mu,sigma,nSamples);
theorProb = normcdf(1,mu,sigma) - normcdf(-1,mu,sigma);

fprintf('Q1\n\tExperiment: %.3f\n\tTheory: %.3f\n',simProb,theorProb);

%% Q2: P(X in [-1,1]) as mu changes

mus = linspace(-3,3,11);
sigma = 1;

simProbs = zeros(size(mus));
for idx=1:length(mus);
    simProbs(idx) = simulate(mus(idx),sigma,nSamples);
end

figure(1);
clf();
plot(mus,simProbs);
xlabel('mu');
ylabel('P(X in [-1,1])');

%% Q3: P(X in [-1,1]) as sigma changes

mu = 0;
sigmas = logspace(-3,6,33);

simProbs = zeros(size(sigmas));
for idx=1:length(sigmas);
    simProbs(idx) = simulate(mu,sigmas(idx),nSamples);
end

figure(2);
clf();
loglog(sigmas,simProbs);
xlabel('sigma');
ylabel('P(X in [-1,1])');

%% Q4: properties of squared Gaussian rvs

mus = linspace(-3,3,11);
sigma = 3;

meanSq = zeros(size(mus));
for idx=1:length(mus)
    X = normrnd(mus(idx),sigma,1,nSamples);
    XSq = X .^ 2;
    meanSq(idx) = mean(XSq); 
end

figure(3);
clf();
plot(mus,meanSq,'ro');
hold on;
plot(mus,mus.^2 + sigma.^2,'k--');
hold off;
xlabel('mu');
ylabel('mean of X squared');

%% std part
mu = 0;
sigmas = logspace(-3,3,11);

stdSq = zeros(size(sigmas));
for idx=1:length(sigmas)
    X = normrnd(mu,sigmas(idx),1,nSamples);
    XSq = X .^ 2;
    stdSq(idx) = std(XSq); 
end

figure(4);
clf();
loglog(sigmas,stdSq,'ro');
hold on;
loglog(sigmas,sigmas.^2,'k--');
hold off;
xlabel('sigma');
ylabel('std of X squared');