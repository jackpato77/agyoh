% Algoritmos Geneticos y Optimizacion Heuristica - U.T.N. - F.R.T.
%   Trabajo Practico Nro 2 - 2015
%
% Algoritmo Genetico Simple
%
% Sintaxis
% function [mejorSoluc, mejorFitness, mejoresFitness, fitnessPromedios] = genetico(Pop,
% Bounds, cant_generac, cant_mutados, cant_elite, eps, f, crossover,
% mutation) 
%
% Parametros
% - cant_soluc: tamano de poblacion
% - cant_generac: cantidad de iteraciones del algoritmo.
% - Bounds: matriz que indica los valores maximo y minimo de cada variable.
% - cant_selecc: cantidad de individuos seleccionados. El resto de
%   individuos pasa sin pasar por la seleccion.
% - cant_mutados: cantidad de soluciones a las cuales se le aplicara
%   mutacion.
% - cant_elite: numero de mejores soluciones que pasan a la siguiente 
%   generacion sin cambio alguno.
% - eps: peso que se le asigna a la solucion menos probable en el calculo 
%   de la probabilidad
% - f: funcion de evaluacion. Debe recibir como parametro un vector
%   solucion y devolver un numero real.
%
% Salida
% - mejorSolucion: vector solucion que obtuvo fitness mas alto.
% - mejorFitness: valor de evaluacion de la mejor solucion.
% - mejoresFitness: vector con los mejores valores de fitness obtenidos en cada
%   generacion. Se puede utilizar para determinar si el algoritmo llego a
%   crowding.
% - fitnessPromedios: vector con los valores promedio de fitness obtenidos en cada
%   generacion.
% - Pop: matriz de la poblacion final. Recordar que la ultima columna tiene
%   los valores de fitness.
% - Elite: matriz que contiene las mejores soluciones para cada generacion.
% - cant_selecc: cantidad de padres que se reproduciran(sin contar la
%   elite). 

function [mejorSoluc, mejorFitness, mejoresFitness, fitnessPromedios, Pop] = geneticoSimple(...
    Pop, cant_generac, Bounds, cant_selecc, cant_mutados, cant_elite, eps, f)

% Variables auxiliares
% - P: vector para almacenar la probabilidad de cada generacion.
% - I: vector con las posiciones de las soluciones resultado de la seleccion.
% - S: matriz de la poblacion luego de la seleccion.
% - m,n: entero que indica una posicion dentro de un vector.
% - i,j,k: contadores enteros usados en los bucles.

%genero poblacion inicial aleatoria
cant_soluc = size(Pop,1);
[n_filas, n_columnas] = size(Pop);
cant_variables = n_columnas - 1; %le resto uno porque la ultima columna es para el fitness

%verifico los parametros de entrada
if size(Bounds) ~= [cant_variables, 2] %#ok<BDSCA>
    error('El tamano de la matriz Bounds es incorrecta.');
end
if ~isscalar(cant_generac) || floor(cant_generac) ~= cant_generac
    error('La cantidad de generaciones debe ser un escalar entero.');
end
if ~isscalar(cant_selecc) || floor(cant_selecc) ~= cant_selecc || floor(cant_selecc) > cant_soluc - cant_elite
    error('La cantidad de seleccionados debe ser menor que el tamaño de la poblacion menos la elite.');
end
if ~isscalar(cant_mutados) || floor(cant_mutados) ~= cant_mutados
    error('La cantidad de mutados debe ser un escalar entero.');
end
if cant_mutados > cant_soluc
    error('La cantidad de mutados debe ser menor que el tamano de la poblacion.');
end
if ~isscalar(cant_elite) || floor(cant_elite) ~= cant_elite
    error('El tamano de la elite debe ser un escalar entero.');
end
if cant_elite > cant_soluc
    error('El tamano de la elite debe ser menor que el tamano de la poblacion.');
end
if ~isreal(eps) || eps < 0
    error('El valor de epsilon debe ser real y positivo.');
end

cant_sel = cant_soluc - cant_elite;
cant_pasan = cant_sel - cant_selecc; %pasan sin seleccion

%---inicializo vectores para reducir tiempo de calculo
mejoresFitness = zeros(1, cant_generac);
fitnessPromedios = zeros(1, cant_generac);

%---realizo las evaluaciones de la poblacion inicial.
for i = 1:cant_soluc
    Pop(i,end) = f(Pop(i,1:end-1));
end

for i = 1:cant_generac
    
    %---selecciono la elite de la generacion actual
    [Waste, Order] = sort(Pop(:,end), 'descend'); %el mayor primero
    Elite = Pop(Order(1:cant_elite),:);
    
    %---seleccion
    I = ruleta(Pop(:,end), eps, cant_selecc);
    S = Pop(I,:); %guardo la seleccion obtenida
    
    %--shuffle
    Pop = Pop(randperm(size(Pop,1)),:); 
    
    %--agrego los que faltan que pasaron sin seleccion
    S = [S; Pop(1:cant_pasan,:)];
    
    %---cruzamiento
    p = randperm(cant_sel);
    for k = 1:2:cant_sel-1
        [C1, C2] = xover(S(p(k), 1:end-1), S(p(k+1), 1:end-1));
        S(p(k), :) = [C1 NaN];
        S(p(k+1), :) = [C2 NaN];
    end

    %---mutacion
    p = randperm(cant_sel);
    for k = 1:cant_mutados
        C = mut(S(p(k), 1:end-1), Bounds);
        S(p(k),:) = [C NaN];
    end

    %---inserto la elite en la nueva poblacion en lugares al azar
    pos = ceil(rand(1,cant_elite)*cant_sel);
    Pop(1:cant_sel, :) = S;
    Pop(cant_sel+1:end, :) = S(pos, :);
    Pop(pos, :) = Elite; 

    %---realizo las evaluaciones de la nueva generacion
    for j =1:cant_soluc
        Pop(j,end) = f(Pop(j, 1:end-1));
    end
    mejoresFitness(i) = max(Pop(:,end)); %datos estadisticos
    fitnessPromedios(i) = mean(Pop(:,end)); %valor medio
    
    disp(['Generacion ' num2str(i) ': ' num2str(mejoresFitness(i))]);
end

%---busco la mejor solucion obtenida
[mejorFitness, m] = max(Pop(:,end));
mejorSoluc = Pop(m, 1:end-1);

end %function
