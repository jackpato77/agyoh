% Curso: Algoritmos Geneticos y Optimizacion Heuristica - U.T.N. - F.R.T.
%   Trabajo Practico No1 - 2015
%
% Descripcion
%   Algoritmo de Hill Climbing para buscar el maximo de una funcion.
%
% Sintaxis:
%   [MejorX, MejorValor, Soluciones, Valores] = hillClimbing(f, X0, Bounds,
%   max_eps, cant_iterac)
%
% Parametros:
% - f: funcion de evaluacion
% - X0: vector solucion inicial, desde donde parte la exploracion.
% - Bounds: matriz de tamano n x 2, donde n es la cantidad de variables que 
%   tiene el problema. En la primera columna se establecen los valores limites
%   inferiores y en la segunda columna se establece los valores limite 
%   superiores. Por ejemplo, para 3 variables la matriz Bounds tiene la forma:
%	Bounds = [0 10; 4, 6; 100, 200];
%   Observen que los valores de la primera columna siempre deben ser menores 
%   que los valores de la segunda, en cada fila.
% - max_eps: indica la distancia maxima a recorrer por cada iteracion.
% - cant_iterac: es la cantidad de iteraciones fija usada como condicion de 
%   terminacion del metodo.
%
% Salida
% - MejorX: mejor solucion obtenida
% - MejorValor: evaluacion de la mejor solucion obtenida
% - Soluciones: vector de soluciones obtenidas en cada iteracion.
% - Valores: valores de funcion evaluacion

function [MejorX, MejorValor, Soluciones, Valores, Trace_R] = hillClimbing02(f, X0, Bounds, max_eps, cant_iterac)

%%%%%%%%%%%%%%% verifico parametros de entrada %%%%%%%%%%%%%%%

if size(X0,2) == 0
    error('La solucion inicial X0 debe tener al menos una variable.');
end
if any(size(Bounds) ~= [size(X0,2), 2])
    error('La matriz de Bounds debe tener 2 colunas y tantas filas como cantidad de variables.');
end
if ~(isreal(max_eps)) || max_eps <= 0
    error('El valor maximo de epsilon debe ser real y positivo.');
end
if cant_iterac < 1 || cant_iterac ~= floor(cant_iterac) 
    error('El numero maximo de iteraciones erroneas debe ser entero positivo.');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% inicializar variables
MejorValor = f(X0);
Soluciones = X0;
Valores = MejorValor;
cnt = 1; % cantidad de iteraciones
sigue = 1; % bandera que indica si el algoritmo continua ejecutandose o no
Trace_R = []; % para guardar los vectores direcci�n

%c_malas=0;  %contador de iteraciones con valor de la funci�n menor a la soluci�n actual 
%m_malas=10; %maximo nro de iteraciones con valor de la funci�n menor a la soluci�n actual
%c_intentos=0; %Contador de intentos

%cant_iterac=10;
%cant_iterac=round(rand()*10^size(Bounds,1));
cant_iterac=10^size(Bounds,1)/size(Bounds,1);
% repetir hasta que se cumpla la condicion de terminacion
while sigue

    %%%%%%%%%%%%%%% calculo el punto de exploracion %%%%%%%%%%%%%%%
    % R = Bounds(1,1) + (Bounds(1,2) - Bounds(1,1))*rand();
    % eps = max_eps*rand();
    % X = X0 + eps*R;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %R = rand();
    %R = 2*rand()-1;
    %R;
    %R = R/norm(R);
    %R = R/norm(Trace_R);
    R=2*rand(1,size(Bounds,1))-1;
    %R=R./abs(R);
    
    eps = max_eps.*rand(1,size(Bounds,1));
    X = X0 + eps.*R;
    %R
    %guardo el vector direccion para graficarlo despues
    

    %si la solucion actual es mejor que la que ya tenia
    Valor = f(X);
    if Valor > MejorValor
        X0 = X; 
        MejorValor = Valor;
        cnt=1;
        %c_malas=0;
    %else
    %    c_malas=c_malas+1;
    end
    
    %guardo el resultado
    Soluciones = [Soluciones; X0]; 
    Valores = [Valores; MejorValor];
    Trace_R = [Trace_R; R];
    
    
    %%%%%%%%%%%%%%%%%%% condicion de terminacion %%%%%%%%%%%%%%%%%%%
    if cnt > cant_iterac %cantidad fija de vueltas
        sigue = 0;
    end
    cnt = cnt + 1;
    %if c_malas > m_malas
    %    sigue = 0;
    %end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %c_intentos=c_intentos+1;
end

MejorX = X0;
%Trace_R;
end %function

%#ok<*AGROW>
