function [root] = find_root(coeffs, degree)

    coeffs = flip(coeffs);
    
    %using Newton's method, try to find root
    %
    % x = x0 - (f(x0)/f'(x0))
    %
    %iterating the guess value using for loop
    
    % trying to find f'(x)
    d_coeffs = zeros(1, degree);
    for i = 1:size(d_coeffs,2)
        d_coeffs(1,i) = coeffs(1,i) * (degree-i+1);
    end


    %initial complex guess
    a = sqrt(-1);
    c_guess = rand()*20-10 + (rand()*20-10)*a;

    coeffs = flip(coeffs);
    d_coeffs = flip(d_coeffs);

    %finding complex root
    for eps_c = 1:10000
        
        e_result_c = evaluate(coeffs, degree, c_guess);
        d_result_c = evaluate(d_coeffs, degree-1, c_guess);
        

        if e_result_c == 0
            root = c_guess;
            return; 
        end
        
        if e_result_c ~= 0
            c_guess = c_guess - (e_result_c/d_result_c);
        end

    end



    %initial real guess 
    i_guess = rand()*100;
    
    %finding real root
    for eps = 1:10000
        
        %f(x0)
        e_result = evaluate(coeffs, degree, i_guess);

        %f'(x0)
        d_result = evaluate(d_coeffs, degree-1, i_guess);

        if e_result == 0
            root = i_guess;
            return;
        end

        if e_result ~= 0
            i_guess = i_guess - (e_result/d_result);
        end    
    
    end

end