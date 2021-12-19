function y = midpoint_filter(A)
  A = padarray(A,[1,1]);
   [row col]=size(A);
   for i = 2:(row-1)
       for j = 2 : (col-1)
           dum=[A(i-1,j-1),A(i-1,j),A(i-1,j+1),A(i,j-1),A(i,j),A(i,j+1),A(i-1,j),A(i+1,j-1),A(i,j-1),A(i+1,j),A(i+1,j-1)];
           a=max(dum);
           b=min(dum);
           img(i,j)=(a+b)/2;
       end
   end
     y=img(2:601,2:801);