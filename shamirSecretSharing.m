function c = shamirSecretSharing1(points)
    % This function finds the constant term (the secret) of a polynomial 
    % using given points in Shamir's Secret Sharing.

    [n, ~] = size(points);  % Find the number of points (rows)
    x_vals = points(:, 1);  % Extract all the x-values from the points
    y_vals = points(:, 2);  % Extract all the y-values from the points

    % Initialize the constant term c (which is f(0))
    c = 0;
    
    % Loop over each point to calculate its contribution to the constant term
    for i = 1:n
        % Initialize Lagrange basis polynomial at x = 0
        Li_0 = 1;
        for j = 1:n
            if j ~= i
                % Multiply to compute the Lagrange basis polynomial at x = 0
                Li_0 = Li_0 * (-x_vals(j)) / (x_vals(i) - x_vals(j));
            end
        end
        % Add the contribution from this point to the constant term c
        c = c + y_vals(i) * Li_0;
    end
end

% Example usage:
points = [1, 6; 2, 11; 3, 18];  % Input points (x_i, y_i)
c = shamirSecretSharing1(points);  % Compute the constant term
disp(['The constant term (secret) is: ', num2str(c)]);