% Algoritmos Geneticos y Optimizacion Heuristica - U.T.N. - F.R.T.
%   Trabajo Practico Nro 2 - 2015
%
% Crea una matriz de poblacion aleatoria.
%
% Parametros:
% - cant_soluc: tamaño de poblacion
% - Bounds: matriz que contiene los extremos de los intervalos donde esta
%   definida la funcion f (una fila por variable)
% - f_eval: funcion evaluacion
%
% Salida
% - Pop: Matriz n x m+1, donde:
%   n = tamaño de la poblacion
%   m = numero de variables independientes. 
%   IMPORTANTE: La ultima columna debe reservarse para guardar los valores de fitness.

function [Pop] = init(cant_soluc, Bounds, f_eval)

cant_variables = size(Bounds,1);

% ... COMPLETAR AQUI ....

end
