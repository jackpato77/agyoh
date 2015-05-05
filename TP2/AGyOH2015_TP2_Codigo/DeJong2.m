% Algoritmos Geneticos y Optimizacion Heuristicas - 2015
%

function [z] = DeJong2(x)
z = - 100 * ((x(1).^2 - x(2)).^2 ) - (1-x(1)).^2;
