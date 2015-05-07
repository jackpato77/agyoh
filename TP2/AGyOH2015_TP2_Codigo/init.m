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
	Pop=[]
	%Pop=zeros(rows(B),columns(B)+1);
	for i=1:cant_soluc
		%X0=rand(1,cant_variables) .* (Bounds(:,2)-Bounds(:,1))' + Bounds(:,1)';
		x=rand * (Bounds(1,2) - Bounds(1,1)) + Bounds(1,1);
		y=rand * (Bounds(2,2) - Bounds(2,1)) + Bounds(2,1);
		z=f_eval([x y]);
		Pop=[Pop; x y z];	
	end %for i=1:cant_soluc
	disp(Pop);
end %function [Pop] = init(cant_soluc, Bounds, f_eval)
