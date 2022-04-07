function output_ranks(submissions, points)
% Output the ranking table
%
% Input args:
%   submissions - cell array of competing submissions
%   points      - number of points earned by the submissions
% Output args:
%   Nothing, but the table is printed out
    [~, sorted_idx] = sort(points, 'descend');
    for pos = 1:length(sorted_idx)
        idx = sorted_idx(pos);
        fprintf('%2d. %-8.8s %3d\n', pos, submissions{idx}, points(idx));
    end
end