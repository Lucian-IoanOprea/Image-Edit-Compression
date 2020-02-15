function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
    min_dist=intmax;
    output_img_index=0;
    aux=double(rgb2gray(imread(image_path)));
    [m1,n]=size(aux);
    aux=reshape(aux,1,m1*n);
    aux=aux';
    aux=aux-m;
    eigenfaces=eigenfaces';
   prtestimage=eigenfaces*aux;
   for i=1:10
      numar=norm(pr_img(:,i)-prtestimage);
      if min_dist>numar
         min_dist=numar;
          output_img_index=i;
          endif
      endfor
end
