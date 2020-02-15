
function A_k = task1(image, k)
  A_k=double(imread(image));
   m=rows(A_k);
   n=columns(A_k);
  [U, S, V]=svd(A_k);
  U=resize(U,m,k);
  S=resize(S,k,k);
  V=resize(V,n,k);
  A_k=U*S*V';
  endfunction
  