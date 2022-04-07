%% The main script running the Colonel Blotto Tournament
%
% Author: Aleksejus Kononovicius
%

clear;

% settings
strategies_folder = './strats';

% allow for strategies to be stored in a subfolder
addpath(strategies_folder);

submissions = get_submissions(strategies_folder);

points = run_tournament(submissions);

output_ranks(submissions, points);

% remove the strategies subfolder as it is no longer need to remain in the
% path
rmpath(strategies_folder);
