function lifeTime = generateBatteryLifeTime(meanTime, nSamples)
% This function generates battery life times which are exponentially
% distributed.
%
% Input arguments:
% * meanTime - average battery life time (in hours)
% * nSamples - number of samples to make
%
% Output argument:
% * lifeTime - vector with samples of battery life time (of size nSamples)
%
    lifeTime = exprnd(meanTime,1,nSamples);
end