
nx=50;
ny=50;
%if nx and ny are not equal matrix errors occur
G = sparse(nx*ny,nx*ny);

for i=1 : nx
    for j=1 : ny
        
        n = i + (j-1)*ny;

        if i==1 || i == nx || j == 1 || j == ny
            G(n,n) = 1;
        elseif i>1 && j>1
             
            nxm = j + (i-2)*ny;
            nxp = j + i*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j + 1 + (i-1)*ny;
            
            G(n,n) = 1;
            G(n,nxm) = 0;
            G(n,nxp) = 0;
            G(n,nyp) = 0;
            G(n,nym) = 0;   
        end
        
    end
    
end

figure (1)
spy(G)


[E,D] = eigs(G,9,'SM')

Vec(nx,ny)=0;

%Plot Eigen Values
figure(2)
plot(D)


     
figure (3)
surf(E)



 


