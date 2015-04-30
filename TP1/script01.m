%PROBLEMA XXXXXX
clear all
clc
%parametros
cant_iterac = 10;
max_eps = 2;
Bounds = [-5 5];

f = @(x) -(x^2);
cantidad_pruebas = 10; %cantidad de veces que tiro el algoritmo

%ejecuto las pruebas
for i = 1:cantidad_pruebas
    
    %genero punto inicial al azar
    X0 = rand(1,size(Bounds,1)) .* (Bounds(:,2)-Bounds(:,1))' + Bounds(:,1)';
    %X0 = Bounds(:,2)'; %esquina
    
    %ejecuto el algoritmo
    [X, MejorValor, Soluciones, Valores] = hillClimbing(f, X0, Bounds, max_eps, cant_iterac);
    
    %busco en que iteración encontro el mejor valor
    [maxVal, maxPos] = max(Valores);
    
    %guardo resultados de la prueba actual
    X0
    X
    maxPos
    MejorValor
    
    graficar(f,Soluciones,Valores,'bla');
    %fplot(f(MejorValor),Bounds);
end
