%PROBLEMA XXXXXX

%parametros
cant_iterac = XXXXXX;
max_eps = XXXXXX;
Bounds = XXXXXX;

f = @(x) XXXXXX;
cantidad_pruebas = 1; %cantidad de veces que tiro el algoritmo

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
end
