nx=50;
ny=50;
numLoops=200;


V= zeros(nx,ny);
bcOnes=ones(ny,1);
bcZeros=zeros(ny,1);
V(:,1)=bcOnes;
V(:,ny)=bcZeros;

figure(2)
h = surf(V);
set(h, 'edgecolor','none');


for i=1:numLoops
%    for j=2:(nx-1)
%       for k=2:(ny-1)
% %          if k==1
% %             V(k,j) = V(k+1,j);         
% %          elseif k==ny
% %             V(k,j)= V(k-1,j);
% %          else
% %              V(k,j)= (V(k+1,j)+ V(k-1,j) + V(k,j+1) + V(k,j-1))./4;
% %              assuming the deltas are equal to each other.
% %          end
%         
%          
%       end
%    end
   V = imboxfilt(V,3);
   V(:,1)=bcOnes;
   V(:,ny)=bcOnes;
   V(1,:) = bcZeros;
   V(nx,:) = bcZeros;
   
   fprintf(num2str(i) + "\n");
   h = surf(V);
   %set(h, 'edgecolor','none');
     
   pause(0.01);
end

[Ex,Ey] = gradient(V);

figure(1)
Esurfplot = subplot(2,1,1);
Esurf = surf(Ex,Ey);
Equivplot = subplot(2,1,2);
Equiv = quiver(Ex,Ey);
%h = surf(V);


sprintf("done");