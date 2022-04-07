% the main script of ets 1-5

clear all;

target = input('Target: ');

found = 0;
for patIdx = 0:((3^8)-1)
    [res, expr] = decodePattern(patIdx);
    if res == target
        found = found+1;
        fprintf('    [%2d] %s = %d\n',found,expr,target);
    end
end

if found == 0
    fprintf('Not found!\n');
end