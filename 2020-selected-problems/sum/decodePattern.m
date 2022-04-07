function [res, strp] = decodePattern(patternId)
    nums = 1:9;
    
    pattern = convertToBase3(patternId) -1;
    % -1 means subtraction
    %  0 means concatenation ('1 2' -> '12')
    %  1 means addition

    % lets do concatenation
    nothingIds = find (pattern == 0);
    if ~isempty(nothingIds)
        for nid = nothingIds
            nums(nid+1) = nums(nid)*10 + nums(nid+1);
        end
        nums(nothingIds) = [];
        pattern(nothingIds) = [];
    end
    
    % dealing with + and -
    strp = sprintf('%d',nums(1));
    res = nums(1);
    for idx = 1:length(pattern)
        if pattern(idx) < 0 % subtraction
            sim = ' - ';
            res = res - nums(idx+1);
        else % addition
            sim = ' + ';
            res = res + nums(idx+1);
        end
        strp = [strp sim sprintf('%d',nums(idx+1))];
    end
end