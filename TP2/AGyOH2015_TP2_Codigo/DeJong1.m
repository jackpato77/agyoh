% Algoritmos Geneticos y Optimizacion Heuristicas - 2015
%

function [z] = DeJong1(x)
z = -sum((1:length(x)) .* x.^2);
