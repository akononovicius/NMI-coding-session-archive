function play = AK999(my_plays, op_plays)
% Strategy based our playing against mean of the opponent plays.
% My true strategy.
%
% Author: Aleksejus Kononovicius
%
    play = zeros(1, 10);
    valid_plays = find(is_valid_assignment(op_plays'));
    if(isempty(valid_plays)) % first time we don't know the mean
        play = play + 10; % we assign soldiers equally
        return
    end
    op_plays = op_plays(valid_plays, :);
    % we estimate mean played by our opponent
    if any(size(op_plays)==1)
        mean_play = op_plays;
    else
        mean_play = ceil(mean(op_plays));
    end
    % now we will ignore castles as long as that by ignoring the castles we
    % won't loose too much points
    lost_points = 0;
    points_thresh = 19;
    consider_castles = 1:10;
    
    [~, forfeit] = max(mean_play(consider_castles));
    lost_points = lost_points + consider_castles(forfeit);
    while lost_points < points_thresh
        consider_castles(forfeit) = [];
        [~, forfeit] = max(mean_play(consider_castles));
        lost_points = lost_points + consider_castles(forfeit);
    end
    play(consider_castles) = mean_play(consider_castles);
    unused_soldiers = 100 - sum(play);
    unused_soldiers = unused_soldiers - length(consider_castles);
    play(consider_castles) = play(consider_castles) + 1;
    if unused_soldiers > 0
        for idx = randsample(consider_castles, unused_soldiers, true, play(consider_castles))
            play(idx) = play(idx) + 1;
        end
    end
end
