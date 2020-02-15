function task2()
  sum1=0;
 %1
 A_k=task1("./in/images/image1.gif",100);
 %a=svd(A_k); 
 %plot(a);
  
  
 %2
  [m,n]=size(A_k);
  mini=min(m,n);
   A_k=task1("./in/images/image1.gif",mini);
   s=svd(A_k);
     sum1=sum(s);
 for k=1:mini
   A_k=task1("./in/images/image1.gif",k);
    a=svd(A_k);
    sum0=0;
      sum0=sum(a);
     value(k)=sum0/sum1;
endfor 
  k=[1 : mini];
  %plot(k,value);
  
 %3
  A_k=double(imread("./in/images/image1.gif"));
 for k=1:mini
   A=task1("./in/images/image1.gif",k);
    val(k)=sum(sum((A_k-A).^2))/(m*n);
endfor 
 k=[1:mini];
% plot(k,val);

%4
 [m,n]=size(A_k);
 for k=1:mini
    val(k)=(m*k+n*k+k)/(m*n);
 endfor;
  k=[1:mini];
plot(k,value); 
endfunction