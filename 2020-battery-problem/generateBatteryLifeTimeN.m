function lifeTime = generateBatteryLifeTimeN(meanTime, stdTime, nSamples)
% This function generates battery life times which are normally
% distributed.
%
% Input arguments:
% * meanTime - average battery life time (in hours)
% * stdTime - standard deviation of batter life lime (in hours)
% * nSamples - number of samples to make
%
% Output argument:
% * lifeTime - vector with samples of battery life time (of size nSamples)
%
    lifeTime = max(normrnd(meanTime, stdTime, 1, nSamples),0);
end