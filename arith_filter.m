 function y=arith_filter(A)
  h=ones(3,3)/9;
  y=imfilter(A,h,'conv','replicate');
  