function [score, assignment_1, assignment_2] = ...
    single_war(player_1, player_2, history_1, history_2)
% This function runs a single war between two players
%
% Input args:
%   player_1 - handle to a function, which will play for player 1
%   player_2 - handle to a function, which will play for player 2
%   history_1 - matrix of plays by player 1
%   history_2 - matrix of plays by player 2
% Output args:
%   score    - is a vector of points scored by the players
%   assignment_1 - troop assignment by player 1
%   assignment_2 - troop assignment by player 2
%
    score = zeros([1,2]);
    castles_scores = 1:10;
    
    assignment_1 = standardize_assignment(player_1(history_1, history_2));
    assignment_2 = standardize_assignment(player_2(history_2, history_1));
    
    % if one of the assingment is not valid
    if ~is_valid_assignment(assignment_1) || ...
        ~is_valid_assignment(assignment_2)
       if is_valid_assignment(assignment_1)
           score(1) = sum(castles_scores);
       elseif is_valid_assignment(assignment_2)
           score(2) = sum(castles_scores);
       end
       return
    end

    % calculate the score if both assingments are valid
    victory_1 = (assignment_1 > assignment_2);
    victory_2 = (assignment_1 < assignment_2);
    draws = (assignment_1 == assignment_2);
        
    score(1) = sum((castles_scores .* victory_1) + ...
        (castles_scores .* draws)/2);
    score(2) = sum((castles_scores .* victory_2) + ...
        (castles_scores .* draws)/2);
end