function ans = divide(coeffs, degree, r)

coeffs_flipped = flip(coeffs);
coeffs_size = degree+1;
coeffs_q_flipped(1)=coeffs_flipped(1);

for index = 2:(coeffs_size-1)
    coeffs_q_flipped(index) = coeffs_q_flipped(index - 1)*r + coeffs_flipped(index);
end

coeffs_q = flip(coeffs_q_flipped);

coeffs_q(coeffs_size) = NaN;

remainder = coeffs_q_flipped(coeffs_size - 1)*r + coeffs_flipped(coeffs_size);

ans = [remainder, coeffs_q];

end