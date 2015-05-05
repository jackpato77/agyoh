% Algoritmos Geneticos y Optimizacion Heuristica - U.T.N. - F.R.T.
%   Trabajo Practico Nro 2 - 2015
%
% Realiza la seleccion haciendo tiros al azar a la ruleta.
%
% Parametros:
% - F: vector 1xn con valores de fitness de todos los individuos
% - eps: valor usado para calcular la probabilidad. Es igual a la
%   probabilidad de la solucion menos probable.
% - num_tiros: cantidad de tiradas a realizar a la ruleta
%
% Salida:
% - S: vector 1xn con los numeros de soluciones obtenidas
% - P: vector de probabilidades

function [S, P] = ruleta(F, epsilon, num_tiros)

P = probabilidad(F, epsilon);

% ... COMPLETAR AQUI ....

end %function


function [P] = probabilidad(F, epsilon)

% ... COMPLETAR AQUI ....

end %function

