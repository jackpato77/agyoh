%PROBLEMA n∞1 Problema 4 

%parametros

clear all;
cant_iterac = 50;
max_eps =pi;
%Bounds = [-10 10]; 
%Bounds = [-4*pi 4*pi];
%Bounds = [-50 50];
%Bounds = [-5 5;-10 10];
%Bounds =[0 10;0 10];

%f = @(x) -(x.^2);
%f = @(x) -0.01*x.^2 + cos(2*x);
%f=tp1p3a;

%problema 3 a
%f(x; y) = -x^2 -y^2; x; y E [5; 5]; y x; y E [10; 10]
%Bounds = [-5 5;-10 10];
%f = @(x) -(x(:,1).^2) -(x(:,2).^2);

%problema 3 b
%g(x; y) = -0.01(x^2+y^2) + cos(2x) + cos(2y);  x,y E [-4pi; 4pi]
Bounds = [-4*pi 4*pi;-4*pi 4*pi];
f = @(x) -0.01*(x(:,1).^2+x(:,2).^2) + cos(2.*x(:,1)) + cos(2.*x(:,2));

%cantidad de veces que tiro el algoritmo
cantidad_pruebas = 10; %cantidad de veces que tiro el algoritmo

%ejecuto las pruebas
for i = 1:cantidad_pruebas
    
    %genero punto inicial al azar
    X0 = rand(1,size(Bounds,1)) .* (Bounds(:,2)-Bounds(:,1))' + Bounds(:,1)';
    %X0 = Bounds(:,2)'; %esquina
    
    %ejecuto el algoritmo
    [X, MejorValor, Soluciones, Valores] = hillClimbing02(f, X0, Bounds, max_eps, cant_iterac);
    
    %busco en que iteraci√≥n encontro el mejor valor
    [maxVal, maxPos] = max(Valores);
    
    %guardo resultados de la prueba actual
    X0
    X
    maxPos
    MejorValor
   
end

   f_eval=f;
   Titulo ='TP1 - Problema Nro 4';
   graficar(f_eval, Soluciones, Valores, Bounds, Titulo)