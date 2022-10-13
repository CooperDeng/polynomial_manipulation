function [fval] = evaluate(coeffs, degree, x_vals)

    coeffs = flip(coeffs);

    
    x_size = size(x_vals,2);
    result = zeros(1,x_size);

    % trying to come up with multiple evaluations using x_val    
    for j = 1:x_size
        
        % x0 used for each iteration
        x_value = x_vals(1,j);
        h_val = coeffs(1,1);
        
        % calculate h_val repetitively
        for i = 1:degree            
            h_val = coeffs(1,i+1) + x_value*h_val;       
        end
        
        % writing the value into the result vector
        result(1, j) = h_val;
        
    end
    
    fval = result;
    return;
    
    
end

