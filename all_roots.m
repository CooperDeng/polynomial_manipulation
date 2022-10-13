function [roots] = all_roots(coeffs)
    %Setting up function degree
    coeffs_size = size(coeffs);
    degree = coeffs_size(1,2) - 1;

    %start finding roots
    %declare size of root
    roots = zeros(1,degree);
    r_coeffs = coeffs;

    %iterates roots
    for i=1:degree
        roots(1,i) = find_root(r_coeffs,degree-(i-1));
        d_coeffs = divide(r_coeffs,degree-(i-1),roots(1,i));
        r_coeffs = d_coeffs(2:2+(degree-i));
    end
    
    return;
end