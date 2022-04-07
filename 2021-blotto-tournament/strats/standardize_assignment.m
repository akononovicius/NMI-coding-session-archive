function standard = standardize_assignment(assignment)
% Convert "any" troop assignment into a standard one (accepted by the
% problem).
    if numel(assignment) >= 10
        standard = assignment(1:10);
    else
        standard = zeros(1,10);
        standard(1:numel(assignment)) = assignment(1:end);
    end
    standard = int64(floor(standard));
end