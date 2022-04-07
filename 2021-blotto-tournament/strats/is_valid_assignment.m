function flag = is_valid_assignment(assignment)
% Check if the troop assignment is valid
    flag = all(assignment >= 0) & (sum(assignment) == 100);
end
