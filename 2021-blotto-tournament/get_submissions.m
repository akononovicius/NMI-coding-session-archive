function submissions = get_submissions(path)
% Get the list of the main submited files found by following a given path.
%
% Input args:
%   path        - file path to folder, which stores submited files
% Output args:
%   submissions - cell arrray with valid submission names
%
    
    % all *.m files in the directory/folder
    % NEW THING: fullfile - more robust way to combine path elements
    submissions = dir(fullfile(path, '*.m'));
    submissions = string({submissions.name});
    
    % only those that match ABC000.m pattern
    % NEW THING: it seems we can use logical indexing to find non-empty cells!
    submissions = regexpi(submissions, '^[A-Z]{2,}\d{3}\.m$', 'match');
    non_empty_idx = ~cellfun(@isempty, submissions);
    submissions = submissions(non_empty_idx);
    
    % drop the *.m extension
    % NEW THING: regexprep replaces elements based on regular expression
    extension_remover = @(s) regexprep(s,'\.m$','');
    submissions = cellfun(extension_remover, submissions);
end