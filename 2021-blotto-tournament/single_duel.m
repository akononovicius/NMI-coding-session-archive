function score = single_duel(player_1, player_2)
% This function performs 1001 wars between two players, who are represented
% by the given function handles.
%
% Input args:
%   player_1 - handle to a function, which will play for player 1
%   player_2 - handle to a function, which will play for player 2
% Output args;
%   score    - is a vector of victories by each player
%

    rng(18152);
    score = zeros([1,2]);
    history_1 = [];
    history_2 = [];
    
    for war_idx = 1:1001
        % run the single war
        [single_war_score, assignment_1, assignment_2] = ...
            single_war(player_1, player_2, history_1, history_2);
        
        % append history
        history_1 = [history_1; assignment_1];
        history_2 = [history_2; assignment_2];
        
        % score the single war
        if single_war_score(1) > single_war_score(2)
            score(1) = score(1) + 1;
        elseif single_war_score(1) < single_war_score(2)
            score(2) = score(2) + 1;
        end
    end
end