function [A_k S] = task4(image, k)
    A_k=double(imread(image));
    [m, n]=size(A_k);
    for i=1:m
      y(i)=mean(A_k(i,:));
      A_k(i,:)=A_k(i,:)-y(i);
    endfor
   A_kt=A_k';
   Z=A_k*A_kt;
   Z/=(n-1);
  [V, S]=eig(Z);
  W=resize(V,m,k);
  Y=W'*A_k;
  A_k=W*Y-y';
endfunction