function [m A eigenfaces pr_img] = eigenface_core(database_path)
  T=[];
  V=[];
  A=[];
  m=[];
  aux=[];
  indice=[];
  ordine=[];
  D='dataset';
  S=dir(fullfile(D,'*.jpg'));
  for i=1:10
    F=fullfile(D,S(i).name);
   S(i).name = S(i).name(1:end-4);
     ordine(i) = str2num(S(i).name);
    Aux=double(rgb2gray(imread(F)));
    [m,n]=size(Aux);
    Aux=reshape(Aux,1,m*n);
    T=[ T;Aux];
  endfor
   ok=1;
   T=T';
   while ( ok==1 )
     ok=0;
     for i=1:10
       if(ordine(i)!=i)
          ok=1;
        T(:,[i,ordine(i)])=T(:,[ordine(i),i]);
        aux=ordine(ordine(i));
        ordine(ordine(i))=ordine(i);
        ordine(i)=aux;
       endif
     endfor
   endwhile
  A=T;
  for i=1:rows(T)
      m(i)=mean(T(i,:));
    endfor
    m=m';
    A=T-m;
    L=transpose(A)*A;
    %disp(size(L));
    a=eig(L);
    a=a';
    k=1;
    for i=1:columns(a)
      if a(i)>1
        indice(k)=i;
        k=k+1;
       endif
    endfor
     k=k-1;
    [b ,values]=eig(L);
   for i=1:k
     aux=b(:,indice(i));
     aux=aux';
     V=[V;aux];
   endfor;
   V=V';
   eigenfaces=A*V;
   pr_img=eigenfaces'*A;
end