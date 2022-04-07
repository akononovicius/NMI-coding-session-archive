function play = AK003(my_plays, op_plays)
% Generates semi-fixed strategy, purely for testing purpose
    play = [5, 12, 17, 0, 13, 11, 0, 5, 4, 7];
    play(7) = randi([0,26]);
    play(4) = 26 - play(7);
end
