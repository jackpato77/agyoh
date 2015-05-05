% Algoritmos Geneticos y Optimizacion Heuristicas - 2015
%

function [z] = DeJong5(x)
z = 0;
A = [-32 -32 -32 -32 -32 -16 -16 -16 -16 -16   0   0 0  0  0  16  16 16 16 16  32  32 32 32 32;...
     -32 -16   0  16  32 -32 -16   0  16  32 -32 -16 0 16 32 -32 -16  0 16 32 -32 -16  0 16 32];
for j = 0:4
    for i = 1:5       
        z = z + 1 / (  i + (x(1)-A(1,j*5+i))^6 + (j+1) + (x(2)-A(2,j*5+i))^6  );
    end
end
