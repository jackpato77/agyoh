% Algoritmos Geneticos y Optimizacion Heuristicas - 2015
%

function [z] = DeJong4(x)
z = -(sum((1:length(x)) .* x.^4) + rand() * .5);
