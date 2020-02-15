function [A_k S] = task3(image, k)
    A_k=double(imread(image));
    [m, n]=size(A_k);
    for i=1:m
      y(i)=mean(A_k(i,:));
      A_k(i,:)=A_k(i,:)-y(i);
    endfor
    Z=A_k'/(sqrt(n-1));
  [U, S, V]=svd(Z);
  W=resize(V,m,k);
  Y=W'*A_k;
  A_k=W*Y;
  for i=1:m
    A_k(i,:)+=y(i);
    endfor
endfunction