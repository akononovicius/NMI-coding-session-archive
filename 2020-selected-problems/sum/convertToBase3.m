function num3 = convertToBase3(num10)
% num3 will be a vector with values equal to 0, 1 or 2.
    num3 = zeros(1,8);
    coeffs = 3 .^ (7:-1:0);
    if 0 <= num10 && num10 < 6561
        % if the number is proper in context of our problem
        for idx = 1:length(coeffs)
            num3(idx) = floor(num10/coeffs(idx));
            num10 = num10 - num3(idx)*coeffs(idx);
        end
    end
end