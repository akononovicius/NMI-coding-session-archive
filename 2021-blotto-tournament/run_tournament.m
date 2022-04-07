function points = run_tournament(submissions)
% Function that runs the tournament itself.
%
% Input args:
%   submissions - cell array of submission names
% Output args:
%   points      - points scored by the submissions
%

    n_subs = length(submissions);
    points = zeros([1,n_subs]);

    % We want for each pair of submissions to "meet" once.
    %
    % This realized by running external for loop over all submissions and
    % internal for loop over submissions who are later than the said submission in
    % the list. This way each pair of submissions "meet" only once.
    for sub_1_idx = 1:n_subs
        sub_1_name = submissions{sub_1_idx};
        
        for sub_2_idx = (sub_1_idx+1):n_subs
            sub_2_name = submissions{sub_2_idx};
            
            sub_1 = str2func(sub_1_name);
            sub_2 = str2func(sub_2_name);
            
            duel_result = single_duel(sub_1, sub_2);
            % clear is necessary to allow "clean" persistence, so that the
            % creators of strategies would be able to use persistent
            % variables if they want, but the persistence would work only
            % during single duel.
            clear("sub_1", "sub_2");
        
            if duel_result(1) > duel_result(2) % submission one wins
                points(sub_1_idx) = points(sub_1_idx) + 3;
            elseif duel_result(1) < duel_result(2) % submission two wins
                points(sub_2_idx) = points(sub_2_idx) + 3;
            else % draw
                points(sub_1_idx) = points(sub_1_idx) + 1;
                points(sub_2_idx) = points(sub_2_idx) + 1;
            end
        end
    end
end