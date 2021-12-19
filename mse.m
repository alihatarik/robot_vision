function y = mse(B,C)
[r c]=size(B);
se = (double(B) - double(C)) .^ 2;
y = sum(sum(se))/(r*c);
   