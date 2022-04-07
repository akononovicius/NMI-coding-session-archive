function opTime = generateMouseOpTime(meanBatteryTime, nSamples)
% This function generates operation times of a mouse with two batteries.
% Batteries are removed as soon as one of them fails.
%
% Input arguments:
% * meanBatteryTime - mean life time of a battery (in hours)
% * nSamples - number of samples of mouse operation time to take
%
% Output arguments:
% * opTime - vector of length nSamples, which contains samples of mouse
%   operation times.
%
    batteryTimes = generateBatteryLifeTime(meanBatteryTime, 2*nSamples);
    batteryTimes = reshape(batteryTimes, 2, nSamples);
    opTime = min(batteryTimes);
end