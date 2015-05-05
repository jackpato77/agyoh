% Algoritmos Geneticos y Optimizacion Heuristicas - 2015
%

function [z] = DeJong6(x)
z = -(10 * length(x) + sum(x.^2 - 10*cos(2*pi.*x)));
