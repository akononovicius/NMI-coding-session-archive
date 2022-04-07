function serviceTime = generateBadServiceTimeN(meanBatteryTime,...
    stdBatteryTime, nBatteries)
% This function calculates total service time of nBatteries used for a
% mouse requiring 2 batteries to operate. Unlike similarly named function
% this function assumes that battery life times are exponentially
% distributed.
%
% Input arguments:
% * meanBatteryTime - mean life time of a battery (in hours)
% * stdBatteryTime - standard deviation of life time of a battery (in
%   hours)
% * nBatteries - number of batteries in the experiment
%
% Output arguments:
% * serviceTime - number of hours served by nBatteries
%
    batteryLifeTimes = generateBatteryLifeTimeN(meanBatteryTime,...
        stdBatteryTime, nBatteries);
    
    serviceTime = 0;
    
    % initially lets place just one battery into mouse and it can serve
    % batteryLifeTimes(1) hours
    canServe = batteryLifeTimes(1);
    for idx = 2:nBatteries
        if canServe > batteryLifeTimes(idx)
            % old battery serves longer than the new battery
            serviceTime = serviceTime + batteryLifeTimes(idx);
            canServe = canServe - batteryLifeTimes(idx);
            % old battery remains and waits for another replacement
        else
            % new battery serves longer than the old battery
            serviceTime = serviceTime + canServe;
            canServe = batteryLifeTimes(idx) - canServe;
            % new battery becomes old battery and waits for replacement
        end
    end
end